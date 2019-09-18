//
//  TapGesture.swift
//  ML-AR
//
//  Created by Elina Lua Ming on 9/18/19.
//  Copyright © 2019 Elina Lua Ming. All rights reserved.
//

import Foundation
import SceneKit
import ARKit

extension ViewController {
    
    func addTapGestureRecognizer(to scene: SCNView) {
        
        // TODO: Create Tap Gesture
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        self.sceneView.addGestureRecognizer(tap)
        
    }
    
    @objc func handleTapGesture(from sender: SCNView) {
        
        if let camera = sceneView.session.currentFrame?.camera {
            
            var translation = matrix_identity_float4x4
            translation.columns.3.z = -1.0
            let transform = translation * camera.transform
            let position = SCNVector3Make(transform.columns.3.x, transform.columns.3.y, transform.columns.3.z)
            
            mainScene.addSceneObject(at: position, with: "art.scnassets/cagedHeart.scn", to: sceneView.scene.rootNode)
            
        }
        
    }
    
}
