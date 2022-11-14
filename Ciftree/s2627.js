function s2627() {
    let sum = AR.Summary({
        env: "PHL",
        bg: "PHL_Bookshelf" + (Flags.Night_FL ? "Night" : "") + "_BG"
    });
    var backNAV = AR.Hotspot({
        onScreen: [0, 560, 1024, 690],
        scene: "s2626",
        cursor: "Back",
        active: function() {
            //return not locked
        }
    });
    var threescene = new THREE.Scene();
	
	var renderer = new THREE.WebGLRenderer({
        alpha: true,
        antialias: true
    });
    
	renderer.setSize(1024, 690);
    renderer.domElement.style.backgroundImage = `url(Video/${bg}.jpg)`;
    //renderer.setClearColor(0x000000, 1);
	document.querySelector("#scene").appendChild(renderer.domElement);

    var camera = new THREE.PerspectiveCamera(75, 1024 / 690, 0.1, 1000);
    //camera.position.set(400, 200, 0);

    var controls = new THREE.OrbitControls(camera, renderer.domElement);
    controls.update();
	var geometry = new THREE.BoxGeometry(3, 3, 3);
	var material = new THREE.MeshBasicMaterial({
        color: 0x00ff00
    });
	var cube = new THREE.Mesh(geometry, material);
    cube.isDraggable = true;
	threescene.add(cube);
    
	camera.position.z = 10;
    
	function animate() {
		requestAnimationFrame(animate);
        
		cube.rotation.x += 0.001;
		cube.rotation.y += 0.001;
        
		renderer.render(threescene, camera);
	};
	animate();
    //renderer.render(threescene, camera);
    return [sum, backNAV];
}