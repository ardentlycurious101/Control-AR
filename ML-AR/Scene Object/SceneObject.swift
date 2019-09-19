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
    
    var animating: Bool = false

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

    func animate() {
        
        if animating { return }
        animating = true
        
        let rotateOne = SCNAction.rotateBy(x: 0, y: CGFloat(Float.pi * 2), z: 0, duration: 5.0)
        let repeatForever = SCNAction.repeatForever(rotateOne)

        runAction(repeatForever)
    }
    
    func stopAnimating() {
        removeAllActions()
        animating = false
    }
    
}
