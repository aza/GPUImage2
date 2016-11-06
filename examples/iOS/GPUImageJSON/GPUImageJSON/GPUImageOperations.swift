//
//  GPUImageClassMap.swift
//  GPUImageJSON
//
//  Created by Aza Raskin on 11/5/16.
//  Copyright © 2016 Elsewhere. All rights reserved.
//

import Foundation
import GPUImage

class GPUImageOperations {
    
    init(){
        
    }
    
    func getByName(name: String) -> BasicOperation? {
        switch name {
        case "BoxBlur": return BoxBlur()
        case "PrewittEdgeDetection": return PrewittEdgeDetection()
        default: return nil
        }
    }
    
}
