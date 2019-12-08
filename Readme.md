<h1>ML-AR</h1>
<p>An iOS app that detects hand gestures using ML to control AR objects.</p>
<pre><code>![alt text](<a href="https://github.com/ardentlycurious101/Control-AR/blob/master/ML-AR.gif">https://github.com/ardentlycurious101/Control-AR/blob/master/ML-AR.gif</a>)</code></pre>
<ul>
<li>
<div>Trained an image classification machine learning model using CreateML to detect hand gestures.</div>
</li>
<li>
<div>Configured an augmented reality session using ARKit to incorporate virtual contents using SceneKit into the AR scene.&nbsp;</div>
</li>
<li>
<div>Integrated the previously trained model using CoreML and Vision framework to detect hand gestures from the current camera frame.</div>
</li>
<li>
<div>Performed multithreading using GCD dispatch queues to asynchronously run Vision requests.</div>
</li>
<li>
<div>Set up a repeating loop for CoreML to obtain images from the camera to process through Vision, to enable continuous control of virtual content animation.&nbsp;</div>
</li>
</ul>
<h3><strong>Technologies Used</strong></h3>
<ul>
<li>ARKit</li>
<li>SceneKit</li>
<li>CreateML</li>
<li>CoreML</li>
</ul>
