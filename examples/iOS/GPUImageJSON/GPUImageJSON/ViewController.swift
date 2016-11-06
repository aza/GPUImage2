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
            
            let filter = OperationGroup.init(json: "hello")
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

extension OperationGroup {
    
    convenience init(json: String) {
        
        let edge = PrewittEdgeDetection()
        let operations = Operations()
        
        let op = operations.get(name: "BulgeDistortion") as! BasicOperation
        
        self.init()
        
        self.configureGroup{ input, output in
            input --> op --> edge --> output
        }
        
    }
    
}

//let blur: BoxBlur = operations.getByName(name: "BoxBlur")
