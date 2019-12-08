# Control AR
An iOS app that detects hand gestures using ML to control AR objects.
* [App Preview](#App-Preview)
* [Description](#Description)
* [Technologies Used](#Technologies-Used)

### App Preview
![App Preview](https://github.com/ardentlycurious101/Control-AR/blob/master/ML-AR.gif)

### Description
* Trained an image classification machine learning model using CreateML to detect hand gestures.</li>
* Configured an augmented reality session using ARKit to incorporate virtual contents using SceneKit into the AR scene.
* Integrated the previously trained model using CoreML and Vision framework to detect hand gestures from the current camera frame.
* Performed multithreading using GCD dispatch queues to asynchronously run Vision requests.</div>
* Set up a repeating loop for CoreML to obtain images from the camera to process through Vision, to enable continuous control of virtual content animation.

### Technologies Used
* ARKit
* SceneKit
* CreateML
* CoreML
