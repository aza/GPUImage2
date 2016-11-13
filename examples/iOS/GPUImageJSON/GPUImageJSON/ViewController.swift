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
            
            let eraser = "[{\"id\":\"camera\",\"outputs\":[\"f6c9557d-2363-4600-9fc2-c46c8e6a37a7\"]},{\"filter\":\"GPUImagePosterizeFilter\",\"id\":\"f6c9557d-2363-4600-9fc2-c46c8e6a37a7\",\"inputs\":[\"camera\"],\"options\":{\"colorLevels\":1.53},\"outputs\":[\"87e93265-1068-4372-8357-249696dd6063\"]},{\"filter\":\"GPUImagePrewittEdgeDetectionFilter\",\"id\":\"87e93265-1068-4372-8357-249696dd6063\",\"inputs\":[\"f6c9557d-2363-4600-9fc2-c46c8e6a37a7\"],\"options\":{\"edgeStrength\":3.44},\"outputs\":[\"left-eye\",\"0d15aa27-c976-44c3-ac6f-ddfc9de71d92\"]},{\"filter\":\"GPUImageLeftEyeFilter\",\"id\":\"left-eye\",\"inputs\":[\"87e93265-1068-4372-8357-249696dd6063\"]},{\"filter\":\"GPUImageRightEyeFilter\",\"id\":\"right-eye\",\"inputs\":[\"0d15aa27-c976-44c3-ac6f-ddfc9de71d92\"]},{\"filter\":\"Delay\",\"id\":\"0d15aa27-c976-44c3-ac6f-ddfc9de71d92\",\"inputs\":[\"87e93265-1068-4372-8357-249696dd6063\"],\"options\":{\"framesToDelay\":4.6552},\"outputs\":[\"right-eye\"]}]"
            
            let sumie = "[{\"id\":\"camera\",\"outputs\":[\"dc85a745-f8fc-4a85-889d-874e20733675\",\"f2cf45e4-56a6-4fb9-a050-bb1bd3c86588\"]},{\"filter\":\"LeftEye\",\"id\":\"left-eye\",\"inputs\":[\"cf8eb3f6-ecb9-4b5f-8263-923b6d52cf59\"]},{\"filter\":\"RightEye\",\"id\":\"right-eye\",\"inputs\":[\"cf8eb3f6-ecb9-4b5f-8263-923b6d52cf59\"]},{\"filter\":\"BilateralBlur\",\"id\":\"f7342b0e-1a22-411c-b516-97a56713d830\",\"inputs\":[\"ecc96947-3c84-448a-8953-100674a4acb0\"],\"options\":{\"distanceNormalizationFactor\":8,\"texelSpacingMultiplier\":4},\"outputs\":[\"928cf280-18ec-456c-a950-b36cc0418fa8\",\"5e1b9f51-4142-4447-bbc1-cf3d91e62638\"]},{\"filter\":\"BilateralBlur\",\"id\":\"ecc96947-3c84-448a-8953-100674a4acb0\",\"inputs\":[\"dc85a745-f8fc-4a85-889d-874e20733675\"],\"options\":{\"distanceNormalizationFactor\":8,\"texelSpacingMultiplier\":4},\"outputs\":[\"f7342b0e-1a22-411c-b516-97a56713d830\"]},{\"filter\":\"PrewittEdgeDetection\",\"id\":\"928cf280-18ec-456c-a950-b36cc0418fa8\",\"inputs\":[\"f7342b0e-1a22-411c-b516-97a56713d830\"],\"options\":{\"edgeStrength\":1.1111},\"outputs\":[\"5e1b9f51-4142-4447-bbc1-cf3d91e62638\"]},{\"filter\":\"ExposureAdjustment\",\"id\":\"3dd0a38d-ee0b-43b2-bd81-6c3262a81fc0\",\"inputs\":[\"f72f89ed-684e-401a-b00e-4e580191fa71\"],\"options\":{\"exposure\":0.0268},\"outputs\":[\"cf8eb3f6-ecb9-4b5f-8263-923b6d52cf59\"]},{\"filter\":\"ExclusionBlend\",\"id\":\"5e1b9f51-4142-4447-bbc1-cf3d91e62638\",\"inputs\":[\"f7342b0e-1a22-411c-b516-97a56713d830\",\"928cf280-18ec-456c-a950-b36cc0418fa8\"],\"outputs\":[\"efa426fc-c6b5-4a36-ab83-77574de68da4\",\"91283d26-1db6-4dff-bc48-39c26c2acb8d\"]},{\"filter\":\"HueAdjustment\",\"id\":\"cf8eb3f6-ecb9-4b5f-8263-923b6d52cf59\",\"inputs\":[\"3dd0a38d-ee0b-43b2-bd81-6c3262a81fc0\"],\"options\":{\"hue\":360},\"outputs\":[\"left-eye\",\"right-eye\"]},{\"filter\":\"BoxBlur\",\"id\":\"dc85a745-f8fc-4a85-889d-874e20733675\",\"inputs\":[\"camera\"],\"options\":{\"blurRadiusInPixels\":2.0313},\"outputs\":[\"ecc96947-3c84-448a-8953-100674a4acb0\"]},{\"filter\":\"PerlinNoise\",\"id\":\"f2cf45e4-56a6-4fb9-a050-bb1bd3c86588\",\"inputs\":[\"camera\"],\"options\":{\"scale\":199.4897},\"outputs\":[\"d1e5d673-2c06-4380-bbc8-de8ed8267ac6\"]},{\"filter\":\"DissolveBlend\",\"id\":\"f72f89ed-684e-401a-b00e-4e580191fa71\",\"inputs\":[\"f0b05d83-5a78-4f20-b91b-1f99bc947986\",\"d1e5d673-2c06-4380-bbc8-de8ed8267ac6\"],\"options\":{\"mix\":0.0385},\"outputs\":[\"3dd0a38d-ee0b-43b2-bd81-6c3262a81fc0\"]},{\"filter\":\"FalseColor\",\"id\":\"efa426fc-c6b5-4a36-ab83-77574de68da4\",\"inputs\":[\"5e1b9f51-4142-4447-bbc1-cf3d91e62638\"],\"options\":{\"firstColor\":[0.7229166666666667,0.7229166666666667,0.7229166666666667],\"secondColor\":[0.11973039215686276,0.007028291402345254,0.11973039215686276]},\"outputs\":[\"f0b05d83-5a78-4f20-b91b-1f99bc947986\"]},{\"filter\":\"FalseColor\",\"id\":\"91283d26-1db6-4dff-bc48-39c26c2acb8d\",\"inputs\":[\"5e1b9f51-4142-4447-bbc1-cf3d91e62638\"],\"options\":{\"firstColor\":[1,1,1],\"secondColor\":[0.12919353433775474,0.20621310250396838,0.30232843137254906]},\"outputs\":[\"f0b05d83-5a78-4f20-b91b-1f99bc947986\"]},{\"filter\":\"OverlayBlend\",\"id\":\"f0b05d83-5a78-4f20-b91b-1f99bc947986\",\"inputs\":[\"efa426fc-c6b5-4a36-ab83-77574de68da4\",\"91283d26-1db6-4dff-bc48-39c26c2acb8d\"],\"outputs\":[\"f72f89ed-684e-401a-b00e-4e580191fa71\"]},{\"filter\":\"HueAdjustment\",\"id\":\"d1e5d673-2c06-4380-bbc8-de8ed8267ac6\",\"inputs\":[\"f2cf45e4-56a6-4fb9-a050-bb1bd3c86588\"],\"options\":{\"hue\":0.5},\"outputs\":[\"f72f89ed-684e-401a-b00e-4e580191fa71\"]}]"
            
            let skittle = "[{\"id\":\"camera\",\"outputs\":[\"77af6e66-c825-41b1-8cd8-b93cbcebe013\",\"4dce357e-0423-4d87-9db5-966589fe6809\",\"f4f7cb1b-c1db-484e-b052-f8fe9dfcd831\"]},{\"filter\":\"GammaAdjustment\",\"id\":\"77af6e66-c825-41b1-8cd8-b93cbcebe013\",\"inputs\":[\"camera\"],\"options\":{\"gamma\":0.26},\"outputs\":[\"77fd10c4-a8a7-455d-bc56-4c32db979eb3\"]},{\"filter\":\"PrewittEdgeDetection\",\"id\":\"77fd10c4-a8a7-455d-bc56-4c32db979eb3\",\"inputs\":[\"77af6e66-c825-41b1-8cd8-b93cbcebe013\"],\"options\":{\"edgeStrength\":1},\"outputs\":[\"1bfe6569-f6c4-416e-a1dc-99a4ca2f4f85\"]},{\"filter\":\"LowPassFilter\",\"id\":\"1bfe6569-f6c4-416e-a1dc-99a4ca2f4f85\",\"inputs\":[\"77fd10c4-a8a7-455d-bc56-4c32db979eb3\"],\"options\":{\"filterStrength\":0.63},\"outputs\":[\"d7389dcc-2263-41ba-93a3-0a6f22b7389e\"]},{\"filter\":\"RGBAdjustment\",\"id\":\"d7389dcc-2263-41ba-93a3-0a6f22b7389e\",\"inputs\":[\"1bfe6569-f6c4-416e-a1dc-99a4ca2f4f85\"],\"options\":{\"blue\":1,\"green\":1,\"red\":2.82},\"outputs\":[\"ee4c2bfd-86a4-42ec-acec-44eb0cb12f1a\"]},{\"filter\":\"PrewittEdgeDetection\",\"id\":\"4dce357e-0423-4d87-9db5-966589fe6809\",\"inputs\":[\"camera\"],\"options\":{\"edgeStrength\":1},\"outputs\":[\"bce4595f-d2e0-44c5-883a-2c30f0320b29\"]},{\"filter\":\"LowPassFilter\",\"id\":\"bce4595f-d2e0-44c5-883a-2c30f0320b29\",\"inputs\":[\"4dce357e-0423-4d87-9db5-966589fe6809\"],\"options\":{\"filterStrength\":0.3},\"outputs\":[\"48e14f24-78fe-414d-88d3-858e50df5bca\"]},{\"filter\":\"RGBAdjustment\",\"id\":\"48e14f24-78fe-414d-88d3-858e50df5bca\",\"inputs\":[\"bce4595f-d2e0-44c5-883a-2c30f0320b29\"],\"options\":{\"blue\":1,\"green\":2.48,\"red\":1},\"outputs\":[\"ee4c2bfd-86a4-42ec-acec-44eb0cb12f1a\"]},{\"filter\":\"LightenBlend\",\"id\":\"ee4c2bfd-86a4-42ec-acec-44eb0cb12f1a\",\"inputs\":[\"d7389dcc-2263-41ba-93a3-0a6f22b7389e\",\"48e14f24-78fe-414d-88d3-858e50df5bca\"],\"outputs\":[\"dbfa8ad8-9f46-4d23-8fc8-f7d3f87c08a8\"]},{\"filter\":\"GammaAdjustment\",\"id\":\"f4f7cb1b-c1db-484e-b052-f8fe9dfcd831\",\"inputs\":[\"camera\"],\"options\":{\"gamma\":2.19},\"outputs\":[\"69e8ab7b-3b55-42d8-b84d-b471364a92e6\"]},{\"filter\":\"PrewittEdgeDetection\",\"id\":\"69e8ab7b-3b55-42d8-b84d-b471364a92e6\",\"inputs\":[\"f4f7cb1b-c1db-484e-b052-f8fe9dfcd831\"],\"options\":{\"edgeStrength\":1},\"outputs\":[\"8366f004-9900-481f-9fd3-d3e873ce6286\"]},{\"filter\":\"LowPassFilter\",\"id\":\"8366f004-9900-481f-9fd3-d3e873ce6286\",\"inputs\":[\"69e8ab7b-3b55-42d8-b84d-b471364a92e6\"],\"options\":{\"filterStrength\":0.55},\"outputs\":[\"2afd0226-7f6c-48e4-a26f-08b563451b75\"]},{\"filter\":\"RGBAdjustment\",\"id\":\"2afd0226-7f6c-48e4-a26f-08b563451b75\",\"inputs\":[\"8366f004-9900-481f-9fd3-d3e873ce6286\"],\"options\":{\"blue\":2.91,\"green\":1,\"red\":1},\"outputs\":[\"dbfa8ad8-9f46-4d23-8fc8-f7d3f87c08a8\"]},{\"filter\":\"LightenBlend\",\"id\":\"dbfa8ad8-9f46-4d23-8fc8-f7d3f87c08a8\",\"inputs\":[\"ee4c2bfd-86a4-42ec-acec-44eb0cb12f1a\",\"2afd0226-7f6c-48e4-a26f-08b563451b75\"],\"outputs\":[\"left-eye\",\"abf23614-52c6-4ac9-a73b-a82dbebae411\"]},{\"filter\":\"LeftEye\",\"id\":\"left-eye\",\"inputs\":[\"dbfa8ad8-9f46-4d23-8fc8-f7d3f87c08a8\"]},{\"filter\":\"RightEye\",\"id\":\"right-eye\",\"inputs\":[\"abf23614-52c6-4ac9-a73b-a82dbebae411\"]},{\"filter\":\"Delay\",\"id\":\"abf23614-52c6-4ac9-a73b-a82dbebae411\",\"inputs\":[\"dbfa8ad8-9f46-4d23-8fc8-f7d3f87c08a8\"],\"options\":{\"framesToDelay\":3.0512},\"outputs\":[\"right-eye\"]}]"
            
            let filter = OperationGroup.init(withJson: sumie)
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
        self.className = json["filter"] as? String
        
        let operation = Operations().get(name: className)
        self.operation = operation == nil ? ImageRelay() : operation
        
        if operation == nil { print("Unknown className", className ) }
        
        // TODO: apply options
        
        self.options?.forEach{ uniformName, uniformValue in
            if let op = self.operation as? BasicOperation {
                
                let uniforms = op.uniformSettings.uniformValues
                let actualUniformName = findClosestKeyTo(key: uniformName, in: uniforms)

                op.uniformSettings[ actualUniformName ] = uniformValue as? Float
                
                
                let uniformValueArray = uniformValue as? [Any]

                if let r = uniformValueArray?[0] as? Float, let g = uniformValueArray?[1] as? Float, let b = uniformValueArray?[2] as? Float {
                    op.uniformSettings[ uniformName ] = Color(red: r, green: g, blue: b)
                }

                print( className! + ":" + actualUniformName, uniformValue )
            }
        }
        print()
        
    }
    
    private func findClosestKeyTo(key inputKey: String, in dictionary: [String: Any]) -> String {
        for (key, _) in dictionary {
            if key.contains(inputKey) { return key }
        }
        
        return inputKey
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
                    if source != nil { /*print(source, "-->", target)*/ }
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
    
    convenience init(withJson jsonString: String) {
        
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
