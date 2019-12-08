//
//  MainScene.swift
//  ML-AR
//
//  Created by Elina Lua Ming on 9/18/19.
//  Copyright © 2019 Elina Lua Ming. All rights reserved.
//

import UIKit
import ARKit
import SceneKit
import GLKit

struct MainScene {
    
    var scene: SCNScene?
    
    init() {
        scene = self.initializeScene()
    }
    
    func initializeScene() -> SCNScene {
        let scene = SCNScene()
        
        setDefault(for: scene)
        
        return scene
    }
    
    func setDefault(for scene: SCNScene) {
        
        // TODO: create ambience lighting
        let ambienceLightNode = SCNNode()
        ambienceLightNode.light = SCNLight()
        ambienceLightNode.light?.type = .ambient
        ambienceLightNode.light?.color = UIColor(white: 0.4, alpha: 0.8)
        scene.rootNode.addChildNode(ambienceLightNode)
        
        // TODO: create directional lighting
        let directionalLightNode = SCNNode()
        directionalLightNode.light = SCNLight()
        directionalLightNode.light?.type = .directional
        directionalLightNode.eulerAngles = SCNVector3Make(GLKMathDegreesToRadians(-130), GLKMathDegreesToRadians(0), GLKMathDegreesToRadians(35))
        scene.rootNode.addChildNode(directionalLightNode)
        
    }
    
    func addSceneObject(at position: SCNVector3, with sceneAsset: String, to parentNode: SCNNode) {
                   
        guard let scene = self.scene else { return }
       
        let object = SceneObject(from: sceneAsset)
       
        object.name = sceneAsset
        object.scale = SCNVector3(0.1, 0.1, 0.1)
        object.position = scene.rootNode.convertPosition(position, to: parentNode)
        parentNode.addChildNode(object)
    
    }
    
}
