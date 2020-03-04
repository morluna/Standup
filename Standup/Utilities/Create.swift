//
//  Create.swift
//  Standup
//
//  Created by Marcos Ortiz on 11/18/19.
//  Copyright © 2019 Marcos Ortiz. All rights reserved.
//

import Foundation

func create<T>(builder: @escaping (T) -> Void) -> T where T: NSObject {
    let instance = T()
    
    builder(instance)
    
    return instance
}
