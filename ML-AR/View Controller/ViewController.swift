//
//  ViewController.swift
//  ML-AR
//
//  Created by Elina Lua Ming on 9/18/19.
//  Copyright © 2019 Elina Lua Ming. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import CoreML
import Vision

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    let mainScene = MainScene()
    
    // ML variables
    let CoreMLModel = HandGestureClassifier().model
    private let serialQueue = DispatchQueue(label: "com.elinaluaming.dispatchqueueml")
    var visionRequests = [VNRequest]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Create a new scene
        if let scene = mainScene.scene {
            // Set the scene to the view
            sceneView.scene = scene
        }
        
        addTapGestureRecognizer(to: sceneView)

    }
        
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal

        // Run the view's session
        sceneView.session.run(configuration)
        
        setUpCoreML()
                
        let timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.loopCoreMLUpdate), userInfo: nil, repeats: true)
        
    }
    
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//
//        // Pause the view's session
//        sceneView.session.pause()
//    }
//
//    func session(_ session: ARSession, didFailWithError error: Error) {
//        // Present an error message to the user
//
//    }
//
//    func sessionWasInterrupted(_ session: ARSession) {
//        // Inform the user that the session has been interrupted, for example, by presenting an overlay
//
//    }
//
//    func sessionInterruptionEnded(_ session: ARSession) {
//        // Reset tracking and/or remove existing anchors if consistent tracking is required
//
//    }
    
// MARK:- MLModel
    
// TODO: set up model
   private func setUpCoreML() {
       
       guard let model = try? VNCoreMLModel(for: CoreMLModel) else {
           fatalError("Cannot load model")
       }
       
       let request = VNCoreMLRequest(model: model) { (request, error) in

            if error != nil {
                print("Error: " + (error?.localizedDescription)!)
                return
            }

            guard let result = request.results as? [VNClassificationObservation] else { fatalError("Model fail to process camera image.")
                
            }
        
            print(result)
        
//           let classifications = result[0...2]
//               .compactMap({ $0 as? VNClassificationObservation })
//               .map({ "\($0.identifier) \(String(format:" : %.2f", $0.confidence))" })
//               .joined(separator: "\n")

//           print("Classifications: \(classifications)")
//
//           DispatchQueue.main.async {
//               let topPrediction = classifications.components(separatedBy: "\n")[0]
//               let topPredictionName = topPrediction.components(separatedBy: ":")[0].trimmingCharacters(in: .whitespaces)
//               guard let topPredictionScore: Float = Float(topPrediction.components(separatedBy: ":")[1].trimmingCharacters(in: .whitespaces)) else { return }
//
//               if (topPredictionScore > 0.95) {
//                   print("Top prediction: \(topPredictionName) - score: \(String(describing: topPredictionScore))")
//
//               }
//           }
       }
       
       request.imageCropAndScaleOption = VNImageCropAndScaleOption.centerCrop
       
       visionRequests = [request]
  
   }
   
   // TODO: detect hand gesture
   private func detectHandGesture() {
       
       let pixbuff : CVPixelBuffer? = (sceneView.session.currentFrame?.capturedImage)
       if pixbuff == nil { return }

       let deviceOrientation = UIDevice.current.orientation.getImagePropertyOrientation()

       let handler = VNImageRequestHandler(cvPixelBuffer: pixbuff!, orientation: deviceOrientation, options: [ : ])
       do {
           try handler.perform(self.visionRequests)
       } catch {
           print(error)
       }
   }
   
    @objc private func loopCoreMLUpdate() {
        serialQueue.async {
            self.detectHandGesture()
        }
    }

}
