<h1>Control AR</h1>
<p>An iOS app that detects hand gestures using ML to control AR objects.</p>
<blockquote class="imgur-embed-pub" lang="en" data-id="a/G0MWVeg" data-context="false" ><a href="//imgur.com/a/G0MWVeg"></a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>
<ul>
<li><code></code>Trained an image classification machine learning model using CreateML to detect hand gestures.</li>
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
