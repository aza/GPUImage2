//
//  ViewController.swift
//  GPUImageJSON
//
//  Created by Aza Raskin on 11/5/16.
//  Copyright © 2016 Elsewhere. All rights reserved.
//

import UIKit
import GPUImage
import AVFoundation

class ViewController: UIViewController {
    
    var renderView: RenderView!
    var camera: Camera!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenSize: CGRect = UIScreen.main.bounds
        renderView = RenderView.init(frame: screenSize)
        
        self.view.addSubview(renderView)
        
        do {
            camera = try Camera(sessionPreset: AVCaptureSessionPreset1280x720)
            
            let json = "[{\"id\":\"camera\",\"outputs\":[\"f6c9557d-2363-4600-9fc2-c46c8e6a37a7\"]},{\"filter\":\"GPUImagePosterizeFilter\",\"id\":\"f6c9557d-2363-4600-9fc2-c46c8e6a37a7\",\"inputs\":[\"camera\"],\"options\":{\"colorLevels\":1.53},\"outputs\":[\"87e93265-1068-4372-8357-249696dd6063\"]},{\"filter\":\"GPUImagePrewittEdgeDetectionFilter\",\"id\":\"87e93265-1068-4372-8357-249696dd6063\",\"inputs\":[\"f6c9557d-2363-4600-9fc2-c46c8e6a37a7\"],\"options\":{\"edgeStrength\":3.44},\"outputs\":[\"left-eye\",\"0d15aa27-c976-44c3-ac6f-ddfc9de71d92\"]},{\"filter\":\"GPUImageLeftEyeFilter\",\"id\":\"left-eye\",\"inputs\":[\"87e93265-1068-4372-8357-249696dd6063\"]},{\"filter\":\"GPUImageRightEyeFilter\",\"id\":\"right-eye\",\"inputs\":[\"0d15aa27-c976-44c3-ac6f-ddfc9de71d92\"]},{\"filter\":\"Delay\",\"id\":\"0d15aa27-c976-44c3-ac6f-ddfc9de71d92\",\"inputs\":[\"87e93265-1068-4372-8357-249696dd6063\"],\"options\":{\"framesToDelay\":4.6552},\"outputs\":[\"right-eye\"]}]"
            let filter = OperationGroup.init(jsonString: json)
            camera --> filter --> renderView
            camera.startCapture()
        } catch {
            fatalError("Failure starting camera.")
        }
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}



struct OperationNode {
    
    let id: String
    let className: String?
    
    let inputs: [String]?
    let outputs: [String]?
    let options: [String: Any]?
    
    let operation: Any?
}

struct OperationNodeList {
    let nodes: [OperationNode]
    
    var input: ImageProcessingOperation? {
        get {
            return self.nodes.first?.operation as? ImageProcessingOperation
        }
    }
    
    var output: ImageProcessingOperation? {
        get {
            return self.get(id:"left-eye")?.operation as? ImageProcessingOperation
        }
    }
}

extension OperationNode {
    init?(json: [String: Any]?) {
        
        guard let json = json,
              let id = json["id"] as? String else { return nil }
        
        self.id = id
        self.inputs = json["inputs"] as? [String]
        self.outputs = json["outputs"] as? [String]
        self.options = json["options"] as? [String: Any]
        
        // Old filter definitions had `GPUImagePosterizeFilter` style classNames stored in `filter:`
        var className = json["filter"] as? String
        className = className?.replacingOccurrences(of: "GPUImage", with: "").replacingOccurrences(of: "Filter", with: "")
        self.className = className
        
        let operation = Operations().get(name: className)
        self.operation = operation == nil ? ImageRelay() : operation
        
        // TODO: apply options
    }
}

extension OperationNodeList {
    
    init?(jsonArray: [Any]?) {
        guard let jsonArray = jsonArray  else { return nil }
        
        var operationNodeList = [OperationNode]()
        
        jsonArray.forEach{ entry in
            if let entry = entry as? [String: Any] {
                if let operationNode = OperationNode(json: entry) {
                    operationNodeList.append( operationNode )
                }
            }
        }

        self.nodes = operationNodeList
        
        operationNodeList.forEach { node in
            node.outputs?.forEach{ outputId in
                let outputNode = self.get(id: outputId)
                let source = node.operation as? ImageProcessingOperation
                
                if let target = outputNode?.operation as? ImageProcessingOperation {
                    source?.addTarget(target)
                    if source != nil { print(source, "-->", target) }
                }
            }
        }
    }
    
    func get(id: String) -> OperationNode? {
        return self.nodes.first{ node in
            return node.id == id
        }
    }
    
}

extension OperationGroup {
    
    convenience init(jsonString: String) {
        
        let data = try? JSONSerialization.jsonObject(with: jsonString.data(using: .utf8)!, options: [])
        let operationNodeList = OperationNodeList(jsonArray: data as? [Any])
        
        
        self.init()
        
        self.configureGroup{ groupInput, groupOutput in
            if let listInput = operationNodeList?.input,
                let listOutput = operationNodeList?.output {
                
                groupInput.addTarget(listInput)
                listOutput.addTarget(groupOutput)
            }
        }
        
    }
    
}
