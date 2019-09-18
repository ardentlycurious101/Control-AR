//
//  SceneObject.swift
//  ML-AR
//
//  Created by Elina Lua Ming on 9/18/19.
//  Copyright © 2019 Elina Lua Ming. All rights reserved.
//

import Foundation
import ARKit
import SceneKit

class SceneObject: SCNNode {
    
    init(from file: String){
        super.init()
        
        let nodesInFile = SCNNode.allNodes(from: file)
        nodesInFile.forEach { (node) in
            self.addChildNode(node)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
