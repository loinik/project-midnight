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
    
    //var threescene = new THREE.Scene();
	//
	//var renderer = new THREE.WebGLRenderer({
    //    alpha: true,
    //    antialias: true
    //});
    //
	//renderer.setSize(1024, 690);
    //renderer.domElement.style.backgroundImage = `url(Video/${bg}.jpg)`;
    ////renderer.setClearColor(0x000000, 1);
	//document.querySelector("#scene").appendChild(renderer.domElement);
    //
    //var camera = new THREE.PerspectiveCamera(75, 1024 / 690, 0.1, 1000);
    ////camera.position.set(400, 200, 0);
    //
    //var controls = new THREE.OrbitControls(camera, renderer.domElement);
    //controls.update();
	//var geometry = new THREE.BoxGeometry(3, 3, 3);
	//var material = new THREE.MeshBasicMaterial({
    //    color: 0x00ff00
    //});
	//var cube = new THREE.Mesh(geometry, material);
    //cube.isDraggable = true;
	//threescene.add(cube);
    //
	//camera.position.z = 10;
    //
	//function animate() {
	//	requestAnimationFrame(animate);
    //    
	//	cube.rotation.x += 0.001;
	//	cube.rotation.y += 0.001;
    //    
	//	renderer.render(threescene, camera);
	//};
	//animate();



    let obj_cont;

    let camera, scene, renderer;

    let mouseX = 0, mouseY = 0;
            
    let windowHalfX = 1024 / 2;
    let windowHalfY = 690 / 2;

    let object;
    let controls;

    init();
    animate();

    function init() {

    	obj_cont = document.createElement( 'div' );
        obj_cont.id = "threejsscene";
    	document.querySelector("#scene").appendChild( obj_cont );

    	camera = new THREE.PerspectiveCamera( 45, 1024 / 690, 1, 2000 );
    	camera.position.z = 250;

    	// scene

    	scene = new THREE.Scene();

    	const ambientLight = new THREE.AmbientLight( 0xcccccc, 0.4 );
    	scene.add( ambientLight );

    	const pointLight = new THREE.PointLight( 0xffffff, 0.8 );
    	camera.add( pointLight );
    	scene.add( camera );

    	// manager

    	function loadModel() {

    		object.traverse( function ( child ) {
        		if ( child.isMesh ) child.material.map = texture;
    		});

    		object.position.y = - 95;
    		scene.add( object );

    	}

    	const manager = new THREE.LoadingManager( loadModel );

    	// texture

    	const textureLoader = new THREE.TextureLoader( manager );
    	const texture = textureLoader.load( 'Ciftree/male-02-1noCulling.JPG' );

    	// model

    	function onProgress( xhr ) {

    		if ( xhr.lengthComputable ) {

        const percentComplete = xhr.loaded / xhr.total * 100;
        console.log( 'model ' + Math.round( percentComplete, 2 ) + '% downloaded' );

    		}

    	}

    	function onError() {}

    	const loader = new THREE.OBJLoader( manager );
    	loader.load( 'Ciftree/male02.obj', function ( obj ) {

    		object = obj;

    	}, onProgress, onError );

    	//

    	renderer = new THREE.WebGLRenderer({
            alpha: true,
            antialias: true
        });
    	renderer.setPixelRatio(window.devicePixelRatio);
    	renderer.setSize(1024, 690);
        renderer.domElement.style.backgroundImage = `url(Video/${bg}.jpg)`;
    	document.querySelector("#threejsscene").appendChild( renderer.domElement );
        controls = new THREE.OrbitControls(camera, renderer.domElement);
        controls.enableZoom = false;

    	//document.addEventListener( 'mousemove', onDocumentMouseMove );

    	//

    	//window.addEventListener( 'resize', onWindowResize );

    }

    function onWindowResize() {

    	windowHalfX = 1024 / 2;
    	windowHalfY = 690 / 2;

    	camera.aspect = 1024 / 690;
    	camera.updateProjectionMatrix();

    	renderer.setSize( 1024, 690 );

    }

    function onDocumentMouseMove( event ) {

    	mouseX = ( event.clientX - windowHalfX ) / 2;
    	mouseY = ( event.clientY - windowHalfY ) / 2;

    }

    //

    function animate() {

    	requestAnimationFrame( animate );
    	render();

    }

    function render() {

    	camera.position.x += 0.005;
    	camera.position.y += 0.005;

    	camera.lookAt( scene.position );

    	renderer.render( scene, camera );

    }

    return [sum, backNAV];
}