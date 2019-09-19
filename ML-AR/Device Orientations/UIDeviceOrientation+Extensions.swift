//
//  UIDeviceOrientation+Extensions.swift
//  ML-AR
//
//  Created by Elina Lua Ming on 9/18/19.
//  Copyright © 2019 Elina Lua Ming. All rights reserved.
//

import UIKit

extension UIDeviceOrientation {
    
    func getImagePropertyOrientation() -> CGImagePropertyOrientation {
       
        switch self {
            case UIDeviceOrientation.portrait, .faceUp: return CGImagePropertyOrientation.right
            case UIDeviceOrientation.portraitUpsideDown, .faceDown: return CGImagePropertyOrientation.left
            case UIDeviceOrientation.landscapeLeft: return CGImagePropertyOrientation.up
            case UIDeviceOrientation.landscapeRight: return CGImagePropertyOrientation.down
            case UIDeviceOrientation.unknown: return CGImagePropertyOrientation.right
        @unknown default:
            fatalError("Unclear Orientation.")
        }
        
    }
    
}
