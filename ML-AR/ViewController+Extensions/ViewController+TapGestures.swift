//
//  ViewController+TapGestures.swift
//  ML-AR
//
//  Created by Elina Lua Ming on 9/18/19.
//  Copyright © 2019 Elina Lua Ming. All rights reserved.
//

import Foundation
import SceneKit
import ARKit

extension ViewController {

    func addTapGestureRecognizer(to view: SCNView) {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTapGesture(sender:)))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        self.view.addGestureRecognizer(tap)
        
    }
    
    @objc func handleTapGesture(sender: SCNView) {
        
        if let camera = sceneView.session.currentFrame?.camera {
            
            var translation = matrix_identity_float4x4
            translation.columns.3.z = -5.0
//            translation.columns.3.y = -1.0
            let transform = translation * camera.transform
            let position = SCNVector3Make(transform.columns.3.x, transform.columns.3.y, transform.columns.3.z)
            
            mainScene.addSceneObject(at: position, with: "art.scnassets/toy_drummer.scn", to: sceneView.scene.rootNode)
            
        }
        
    }

}
