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
    //const scene = new THREE.Scene();
    //const camera = new THREE.PerspectiveCamera( 75, 1024 / 768, 0.1, 1000 );
    //const renderer = new THREE.WebGLRenderer();
    //renderer.setSize( window.innerWidth, window.innerHeight );
    //const loader = new OBJLoader();
//
    //// load a resource
    //loader.load(
    //	// resource URL
    //	'PHL_Spraycan_MDL.obj',
    //	// called when resource is loaded
    //	function ( object ) {
//
    //		scene.add( object );
//
    //	},
    //	// called when loading is in progresses
    //	function ( xhr ) {
//
    //		console.log( ( xhr.loaded / xhr.total * 100 ) + '% loaded' );
//
    //	},
    //	// called when loading has errors
    //	function ( error ) {
//
    //		console.log( 'An error happened' );
//
    //	}
    //);
    return [sum, backNAV];
}