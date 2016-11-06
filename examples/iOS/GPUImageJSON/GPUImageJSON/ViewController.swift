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
            
            let sumie = "[{\"id\":\"camera\",\"outputs\":[\"dc85a745-f8fc-4a85-889d-874e20733675\",\"f2cf45e4-56a6-4fb9-a050-bb1bd3c86588\"]},{\"filter\":\"GPUImageLeftEyeFilter\",\"id\":\"left-eye\",\"inputs\":[\"cf8eb3f6-ecb9-4b5f-8263-923b6d52cf59\"]},{\"filter\":\"GPUImageRightEyeFilter\",\"id\":\"right-eye\",\"inputs\":[\"9aa42297-0f4c-4ab0-9555-a7d422add6ce\"]},{\"filter\":\"GPUImageBilateralFilter\",\"id\":\"f7342b0e-1a22-411c-b516-97a56713d830\",\"inputs\":[\"ecc96947-3c84-448a-8953-100674a4acb0\"],\"options\":{\"distanceNormalizationFactor\":8,\"texelSpacingMultiplier\":4},\"outputs\":[\"928cf280-18ec-456c-a950-b36cc0418fa8\",\"5e1b9f51-4142-4447-bbc1-cf3d91e62638\"]},{\"filter\":\"GPUImageBilateralFilter\",\"id\":\"ecc96947-3c84-448a-8953-100674a4acb0\",\"inputs\":[\"efa426fc-c6b5-4a36-ab83-77574de68da4\"],\"options\":{\"distanceNormalizationFactor\":8,\"texelSpacingMultiplier\":4},\"outputs\":[\"f7342b0e-1a22-411c-b516-97a56713d830\"]},{\"filter\":\"GPUImagePrewittEdgeDetectionFilter\",\"id\":\"928cf280-18ec-456c-a950-b36cc0418fa8\",\"inputs\":[\"f7342b0e-1a22-411c-b516-97a56713d830\"],\"options\":{\"edgeStrength\":1.1111},\"outputs\":[\"5e1b9f51-4142-4447-bbc1-cf3d91e62638\"]},{\"filter\":\"GPUImageExposureFilter\",\"id\":\"3dd0a38d-ee0b-43b2-bd81-6c3262a81fc0\",\"inputs\":[\"f72f89ed-684e-401a-b00e-4e580191fa71\"],\"options\":{\"exposure\":0.0268},\"outputs\":[\"cf8eb3f6-ecb9-4b5f-8263-923b6d52cf59\"]},{\"filter\":\"GPUImageExclusionBlendFilter\",\"id\":\"5e1b9f51-4142-4447-bbc1-cf3d91e62638\",\"inputs\":[\"f7342b0e-1a22-411c-b516-97a56713d830\",\"928cf280-18ec-456c-a950-b36cc0418fa8\"],\"outputs\":[\"f72f89ed-684e-401a-b00e-4e580191fa71\"]},{\"filter\":\"GPUImageHueFilter\",\"id\":\"cf8eb3f6-ecb9-4b5f-8263-923b6d52cf59\",\"inputs\":[\"3dd0a38d-ee0b-43b2-bd81-6c3262a81fc0\"],\"options\":{\"hue\":360},\"outputs\":[\"left-eye\",\"9aa42297-0f4c-4ab0-9555-a7d422add6ce\"]},{\"filter\":\"GPUImageBoxBlurFilter\",\"id\":\"dc85a745-f8fc-4a85-889d-874e20733675\",\"inputs\":[\"camera\"],\"options\":{\"blurRadiusInPixels\":2.0313},\"outputs\":[\"efa426fc-c6b5-4a36-ab83-77574de68da4\"]},{\"filter\":\"GPUImagePerlinNoiseFilter\",\"id\":\"f2cf45e4-56a6-4fb9-a050-bb1bd3c86588\",\"inputs\":[\"camera\"],\"options\":{\"scale\":199.4897},\"outputs\":[\"f72f89ed-684e-401a-b00e-4e580191fa71\"]},{\"filter\":\"GPUImageDissolveBlendFilter\",\"id\":\"f72f89ed-684e-401a-b00e-4e580191fa71\",\"inputs\":[\"5e1b9f51-4142-4447-bbc1-cf3d91e62638\",\"f2cf45e4-56a6-4fb9-a050-bb1bd3c86588\"],\"options\":{\"mix\":0.0385},\"outputs\":[\"3dd0a38d-ee0b-43b2-bd81-6c3262a81fc0\"]},{\"filter\":\"GPUImageFalseColorFilter\",\"id\":\"efa426fc-c6b5-4a36-ab83-77574de68da4\",\"inputs\":[\"dc85a745-f8fc-4a85-889d-874e20733675\"],\"options\":{\"firstColor\":[0.7229166666666667,0.7229166666666667,0.7229166666666667],\"secondColor\":[0.3145198169834813,0.311250946150519,0.3150735294117647]},\"outputs\":[\"ecc96947-3c84-448a-8953-100674a4acb0\"]},{\"filter\":\"Delay\",\"id\":\"9aa42297-0f4c-4ab0-9555-a7d422add6ce\",\"inputs\":[\"cf8eb3f6-ecb9-4b5f-8263-923b6d52cf59\"],\"options\":{\"framesToDelay\":2},\"outputs\":[\"right-eye\"]}]"
            
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
    
    let operation: ImageProcessingOperation?
}

struct OperationNodeList {
    let nodes: [OperationNode]
    
    var input: ImageProcessingOperation? {
        get {
            return self.nodes.first?.operation
        }
    }
    
    var output: ImageProcessingOperation? {
        get {
            return self.get(id:"left-eye")?.operation
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
                let source = node.operation
                
                if let target = outputNode?.operation {
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
