//
//  Nodes+Extension.swift
//  ML-AR
//
//  Created by Elina Lua Ming on 9/18/19.
//  Copyright © 2019 Elina Lua Ming. All rights reserved.
//

import SceneKit

extension SCNNode {
    
    public class func allNodes(from file: String) -> [SCNNode] {
        var nodesInFile = [SCNNode]()
        do {
            guard let sceneURL = Bundle.main.url(forResource: file, withExtension: nil) else {
                print("Could not find scene file \(file)")
                return nodesInFile
                
            }

            let objectScene = try SCNScene(url: sceneURL as URL, options: [SCNSceneSource.LoadingOption.animationImportPolicy: SCNSceneSource.AnimationImportPolicy.playRepeatedly])
            objectScene.rootNode.enumerateChildNodes { (node, _) in
                nodesInFile.append(node)
            }

        } catch {
        }
        
        return nodesInFile
    }
}
