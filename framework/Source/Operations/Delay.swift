//
//  Delay.swift
//
//  Created by Aza Raskin on 5/8/16.
//

import Foundation

public class Delay: OperationGroup {
    public var framesToDelay: UInt = 1 { didSet { buffer.bufferSize = framesToDelay } }
    
    let buffer = ImageBuffer()
    
    public override init() {
        super.init()
        
        buffer.bufferSize = 1
        ({framesToDelay = 1})()
        
        self.configureGroup{input, output in
            input --> self.buffer --> output
        }
    }
}
