class ar {
    Override(info) {
        if(info["Run"]) info["Run"]();
        if(info["RunOnce"]) return info["RunOnce"].bind();
    }

    Cache(array, dir) {
        if (!Cache.list) {
            Cache.list = [];
        }
        var list = Cache.list;
        for (var i = 0; i < array.length; i++) {
            var img = new Image();
            img.onload = function() {
                var index = list.indexOf(this);
                if (index !== -1) {
                    // remove image from the array once it's loaded
                    // for memory consumption reasons
                    list.splice(index, 1);
                }
            }
            list.push(img);
            img.src = dir + "/" + array[i];
        }
    }

    Inspection(info) {
        let camera, scene, renderer;
        let obj_cont;

        init();
        animate();

        function init() {
            let gameScene = document.querySelector("#scene");
            THREE.Cache.enabled = true;

            obj_cont = document.createElement('div');
            obj_cont.id = "threejsscene";
            document.querySelector(`#scene > #${sc}`).appendChild(obj_cont);

            camera = new THREE.PerspectiveCamera(45, 1024 / 690, 1, 2000);
            camera.position.z = 250;

            scene = new THREE.Scene();
            scene.add(camera);

            //const onProgress = function (xhr) {
            //    if (xhr.lengthComputable) {
            //        const percentComplete = xhr.loaded / xhr.total * 100;
            //        console.log(Math.round(percentComplete, 2) + '% downloaded');
            //    }
            //};

            let loader = new THREE.GLTFLoader();

            loader.load('Ciftree/' + info["model"] + '.gltf', function (gltf) {
                let object = gltf.scene;
                object.scale.set(1, 1, 1);
                object.position.y = 5;
                scene.add(object);
            });

            const ambientLight = new THREE.AmbientLight(0xcccccc, 0.2);
            camera.add(ambientLight);

            const directionalLight = new THREE.DirectionalLight(0xcccccc, 1);
            directionalLight.castShadow = true;
            directionalLight.position.set(10, 10, 10);
            camera.add(directionalLight);

            const helper = new THREE.DirectionalLightHelper(directionalLight);
            scene.add(helper);

            renderer = new THREE.WebGLRenderer({
                alpha: true,
                antialias: true
            });
            

            renderer.outputEncoding = THREE.sRGBEncoding;
            renderer.setPixelRatio(window.devicePixelRatio);
            renderer.setSize(1024, 690);
            renderer.domElement.style.backgroundImage = 'url(Video/' + info["bg"] + '.jpg)';
            obj_cont.appendChild(renderer.domElement);

            let controls = new THREE.OrbitControls(camera, renderer.domElement);
            controls.enableZoom = false;
            controls.enablePan = false;
            controls.enableRotate = true;
            controls.enableDamping = false;
            controls.mouseButtons = {
                //LEFT: THREE.MOUSE.PAN,
                //MIDDLE: THREE.MOUSE.DOLLY,
                RIGHT: THREE.MOUSE.ROTATE
            }
            controls.rotateSpeed = 0.5;
            camera.position.x = -1;
            camera.position.y = -1;
        }

        function animate() {
            requestAnimationFrame(animate);
            render();
        }

        function render() {
            camera.lookAt(scene.position);
            renderer.render(scene, camera);
        }

        //return init();
    }

    Overlay(info) {
        let Rectangle = document.createElement("canvas");
        
        if (info["onScreen"]) {
            var onScreen = Rect.New(info["onScreen"][0], info["onScreen"][1], info["onScreen"][2], info["onScreen"][3]);
            Rectangle.style.top = onScreen.y + "px";
            Rectangle.style.left = onScreen.x + "px";
        }
        else {
            var onScreen = Rect.New(info["source"][0], info["source"][1], info["source"][2], info["source"][3]);
        }

        let source = Rect.New(info["source"][0], info["source"][1], info["source"][2], info["source"][3]);
        
        if(info["id"]) {
            Rectangle.id = info["id"];
        }

        Rectangle.width = onScreen.width;
        Rectangle.height = onScreen.height;

        

        if(info["id"]) {
            Rectangle.id = info["id"];
        }

        if(info["opacity"]) {
            Rectangle.style.opacity = info["opacity"];
        }

        if(info["active"] == false && !info["opacity"] && info["transition"]) {
            Rectangle.style.opacity = 0;
            Rectangle.style.transition = "all " + info["transition"] + "s";
        }
        else if(info["active"] == false) {
            Rectangle.style.visibility = "hidden";
        }
        
        Rectangle.style.zIndex = (info["z"] != null) ? info["z"] : 0;
        Rectangle.style.position = "absolute";
        
        Rectangle.style.pointerEvents = "none";

        var image = new Image();
        image.src = "Ciftree/" + info["ovl"] + ".png"; 
        image.onload = function(){
            let frameCanvas = Rectangle;
            let ctx = frameCanvas.getContext("2d");
            ctx.beginPath();
            ctx.rect(0, 0, onScreen.width, onScreen.height);
            var pattern = ctx.createPattern(this, "no-repeat");
            ctx.fillStyle = pattern;
            //ctx.drawImage(this, source.x * -1, source.y * -1);
            ctx.translate(source.x * -1, source.y * -1);
            ctx.fill();
            ctx.closePath();    
        };
        return Rectangle;
    }

    Hotspot(info) {
        let parent = document.createElement("div");

        let mouseArea = document.createElement("canvas");
        let width = info["onScreen"][2] - info["onScreen"][0];
        mouseArea.width = width;
        let height = info["onScreen"][3] - info["onScreen"][1];
        mouseArea.height = height;

        parent.style.position = "absolute";
        parent.style.left = info["onScreen"][0] + "px";
        parent.style.top = info["onScreen"][1] + "px";

        if(info["active"] == false) {
            parent.style.visibility = "hidden";
            parent.pointerEvents = "none";
        }
        else if(typeof(info["active"]) === "function") {
            parent.addEventListener("click", function(){
                info["active"]();
            });
        }

        if(info["z"]) {
            parent.style.zIndex = info["z"];
        }
        
        if(info["id"]) {
            parent.id = info["id"];
        }

        if(info["cursor"]) {
            parent.addEventListener("mouseover", function(event) {
                CursorInit.Set(info["cursor"]);
            });
            parent.addEventListener("mouseleave", function(event) {
                CursorInit.Set("MagGlass");
            });
        }

        if(info["OnUp"] != undefined) {
            parent.addEventListener("click", function(event){
                info["OnUp"]();
            });
            if((info["cursor"] != "MenuHot") && (info["cursor"] != "Menu")) {
                parent.classList.add("gameNAV")
            };
        }

        if(info["OnDown"] != undefined) {
            parent.addEventListener("click", function(event){
                info["OnDown"]();
            });
            if((info["cursor"] != "MenuHot") && (info["cursor"] != "Menu")) {
                parent.classList.add("gameNAV")
            };
        }

        if(info["scene"]) {
            parent.addEventListener("click", function(event){
                Scene.LetsGo(info["scene"]);
            });
            if(Flags.Touch && info["hint"] != false) {
                let navCursor = AR.Clone(info["cursor"]);
                navCursor.classList.add("touchNAV");
                parent.append(navCursor);
            }
            parent.classList.add("gameNAV");
        }
        parent.append(mouseArea);
        return parent;
    }

    Button(info) {
        let o = document.createElement("div");
        o.classList.add("overlayElement");

        if(info["active"] == false) {
            o.style.visibility = "hidden";
        }
        if(info["z"]) {
            o.style.zIndex = info["z"];
        }
        else {
            o.style.zIndex = 5;
        }
        o.style.webkitTransform = "translate3D(0px,0px,1px)";
        o.style.position = "absolute";        

        //overOvl
        info["overOvl"].style.opacity = 0;

        //hs
        info["hs"].addEventListener("mouseover", function(event){
            info["overOvl"].style.opacity = 1;
        });

        if(info["id"]) o.id = info["id"];

        info["hs"].addEventListener("mouseleave", function(event){
            info["overOvl"].style.opacity = 0;
        });

        info["hs"].addEventListener("click", function(event){
            if(info["OnUp"] != undefined) {
                info["OnUp"](o);
            }
            else if(info["OnDown"] != undefined) {
                info["OnDown"](o);
            }
            else {
                
            }
        });

        let baseOvl = (info["baseOvl"]) ? info["baseOvl"] : "";

        o.append(baseOvl, info["overOvl"], info["hs"]);
        return o;
        
    }

    Clone(id) {
        let node = document.querySelector(`#${id}`);
        let newNode;
        if(node.tagName === "CANVAS") {
            newNode = document.createElement("canvas");
            let context = newNode.getContext("2d");
            newNode.width = node.width;
            newNode.height = node.height;
            context.drawImage(node, 0, 0);
        } else {
            newNode = node.cloneNode(true);
        }
        newNode.removeAttribute("id");
        return newNode;
    }

    Transformer(info) {
        let block = document.createElement("div");
        if(info["collapsed"]) block.style.transform = "translateY(" + info["collapsed"][1] + "px)";
        block.style.transition = "all " + info["animTime"] + "s";
        block.style.zIndex = info["z"];
        block.id = info["alias"];
        block.style.position = "absolute";

        return block;
    }

    Sound(info) {
        var snd;
        var sound_file = (Array.isArray(info["sounds"])) ? info["sounds"][getRandomInt(info["sounds"].length)] : info["sounds"];
        var path = "Sound/" + sound_file + ".wav";
        snd = new Audio();
        snd.src = path;
        if(info["volume"]) snd.volume = info["volume"];
        snd.currentTime = 0;

        snd.addEventListener("play", function(event) {
            for(var key in autotext){
                if(sound_file == key) {
                    let text = AR.Text({
                        text: autotext[sound_file],
                        onScreen: [102, 650, 782, 693],
                        useAutotext: true,
                        active: false
                    });
                    document.querySelectorAll(".gameNAV, .touchNAV").forEach(allNAV => {
                        allNAV.style.setProperty("visibility", "hidden", "important");
                    });
                    game.insertBefore(text, game.firstChild);
                }
            }
        });

        snd.addEventListener("ended", function(event) {
            if(document.querySelector("#" + info["id"])) {
                document.querySelector("#" + info["id"]).remove();
            }
            else if(document.querySelector("div#textPane")) {
                document.querySelector("div#textPane").remove();
            }
            
            if(info["channel"] != "Theme") {
                if(document.querySelector("div#textPane")) {
                    document.querySelector("div#textPane").remove();
                }
                document.querySelectorAll(".gameNAV").forEach(gNAV => {
                    gNAV.style.setProperty("visibility", "visible", "important");
                });
                //to fix it for captions and music in the future, plz:
                if(Flags.TouchNav_FL) {
                    document.querySelectorAll(".touchNAV").forEach(tNAV => {
                        tNAV.style.setProperty("visibility", "visible", "important");
                    });
                }
            }
            if(typeof(info["OnEnd"]) === "function") {
                info["OnEnd"]();
            }
            if(typeof(info["OnDone"]) === "function") {
                info["OnDone"]();
            }
            if(info["loop"] == true) {
                this.currentTime = 0;
                this.play();
            }
        });
        

        if(info["loop"] == true) {
            snd.loop = true;
        }

        //if(info["id"] == true && info["id"] != "file") {
        //    snd.id = info["id"];
        //} else if(info["id"] == true && info["id"] == "file") {
        //    snd.id = sound_file;
        //}

        if(info["active"] == true) {
            var sound = document.createElement("audio");
            sound.id = sound_file;
            
            var source = document.createElement("source");
            source.src = "Sound/" + sound_file + ".wav";
            source.type = "audio/wav";
            
            sound.append(source);
            sound.dataset.autoplay = true;
            //document.querySelector("#scene").append(sound);
            //document.querySelector("#" + info["sounds"]).play();
            if(info["OnEnd"]) {
                sound.addEventListener("ended", function(event) {
                    info["OnEnd"]();
                });
            }
            if(info["OnDone"]) {
                sound.addEventListener("ended", function(event) {
                    info["OnDone"]();
                });
            }
            return sound;
        }
        else {
            return snd;
        }

        
        
    }

    Text(info) {
        let Text = document.createElement("div");
        Text.style.position = "absolute";
        Text.style.zIndex = 10;
        Text.style.webkitTransform = "translate3D(0px,0px,1px)";

        var onScreen = Rect.New(info["onScreen"][0], info["onScreen"][1], info["onScreen"][2], info["onScreen"][3]);

        Text.style.top = onScreen.y + "px";
        Text.style.left = onScreen.x + "px";
        Text.style.width = onScreen.width + "px";
        Text.style.height = onScreen.height + "px";

        Text.classList.add("text");

        let fontNum = (Font.Parse(info["text"])) ? Font.Parse(info["text"]) : 13;
        let fontInfo = fonts[fontNum];
        let align = (info["align"]) ? info["align"] : "center";
        let verticalAlign = (info["verticalAlign"]) ? info["verticalAlign"] : "top";

        Text.style.color = colors[Color.Parse(info["text"])];
        Text.style.fontFamily = fontInfo["family"];
        Text.style.fontSize = fontInfo["size"] + "px";
        Text.style.justifyContent = align;
        Text.style.alignItems = verticalAlign;

        Text.id = "textPane";

        Text.innerHTML = info["text"].replace(/<[^>]*>?/gm, '');
        return Text;
    }

    Movie(info) {
        let mp4 = "Video/" + info["movie"] + ".mp4";
        let jpg = "Video/" + info["movie"] + ".jpg";
        let png = "Video/" + info["movie"] + ".apng";
        let z = (info["z"]) ? info["z"] : 1;
        let ext;

        let type = (info["type"]) ? info["type"] : "img";
        switch(type) {
            case "anim":
                var video = document.createElement("video");
                if (info["OnEnd"]) {
                    video.id = info["id"];
                }

                video.width = info["onScreen"][2];
                video.height = info["onScreen"][3];
                video.style.zIndex = z;
                video.style.position = "absolute";
                video.style.top = "0px";
                video.style.left = "0px";
                video.controls = false;
                video.setAttribute('webkit-playsinline', 'webkit-playsinline');
                video.setAttribute('playsinline', 'playsinline');
                video.style.pointerEvents = "none";

                ext = (info["webm"]) ? "webm" : "mp4";

                var source = document.createElement("source");
                source.src = "Video/" + info["movie"] + `.${ext}`;
                source.type = "video/" + ext;

                video.append(source);

                if (info["OnEnd"]) {
                    video.addEventListener('ended', function() {
                        document.querySelector("#" + info["id"]).remove();
                        info["OnEnd"]();
                    });
                }
                else {
                    video.addEventListener('ended', function() {
                        document.querySelector("#" + info["id"]).remove();
                    });
                }

                
                //document.querySelector("#scene").append(video);
                //
                if (info["active"] == true) {
                    video.dataset.autoplay = true;
                    //document.querySelector("#" + info["id"]).play();
                }
                return video;
                //break;
            case "img":
                let Rectangle = document.createElement("canvas");
                if (info["id"]) {
                    Rectangle.id = info["id"];
                }

                Rectangle.style.position = "absolute";
                Rectangle.width = info["onScreen"][2];
                Rectangle.height = info["onScreen"][3];
                Rectangle.style.zIndex = z;
                Rectangle.style.pointerEvents = "none"; 
                ext = (info["webm"]) ? "webp" : "jpg";

                if(info["active"] == false) {
                    Rectangle.style.visibility = "hidden";
                }

                if(info["active"] == false && !info["opacity"] && info["transition"]) {
                    Rectangle.style.opacity = 0;
                    Rectangle.style.transition = "all " + info["transition"] + "s";
                }

                if(info["animationName"] && info["duration"]) {
                    Rectangle.style.animationName = info["animationName"];
                    Rectangle.style.animationDuration = info["duration"] + "s";
                    Rectangle.style.animationDelay = (info["delay"]) ? info["delay"] + "s" : "0s";
                    Rectangle.style.animationFillMode = "forwards";
                    Rectangle.style.pointerEvents = "none";
                    if(info["animationName"] == "fadeIn") Rectangle.style.opacity = 0;
                }

                let image = new Image();
                image.src = "Video/" + info["movie"] + `.${ext}`; 
                image.onload = function(){
                    let frameCanvas = Rectangle;
                    let ctx = frameCanvas.getContext("2d");
                    ctx.beginPath();
                    ctx.rect(0, 0, info["onScreen"][2], info["onScreen"][3]);
                    var pattern = ctx.createPattern(this, "no-repeat");
                    ctx.fillStyle = pattern;
                    ctx.fill();
                    ctx.closePath();    
                };
                return Rectangle;
        }
    }

    Timer(info) {
        let timer = {
            start() {
                if (typeof(info["OnEnd"]) === "function") window.setTimeout(info["OnEnd"], info["duration"] * 1000);
                else if (typeof(info["OnDone"]) === "function") window.setTimeout(info["OnDone"], info["duration"] * 1000);
            }
        }
        return timer;
    }

    getJSON = function(url, callback) {
        var xhr = new XMLHttpRequest();
        xhr.open('GET', url, true);
        xhr.responseType = 'json';
        xhr.onload = function() {
            var status = xhr.status;
            if (status === 200) {
                callback(null, xhr.response);
            } else {
                callback(status, xhr.response);
            }
        };
        xhr.send();
    };

    Summary(info) {
        let ext = (info["ext"]) ? info["ext"] : "jpg";
        let Rectangle = document.createElement("canvas");

        Rectangle.style.position = "absolute";
        Rectangle.width = 1024;
        Rectangle.height = 768;
        Rectangle.style.zIndex = 0;

        let image = new Image();
        image.src = "Video/" + info["bg"] + `.${ext}`; 
        bg = info["bg"];
        if(env != info["env"] && !cachedEnvs.includes(info["env"])) {
            cachedEnvs.push(info["env"]);
            AR.getJSON("Ciftree/" + info["env"] + "_Cache.json", function(err, data) {
                if (err !== null) {
                    console.log('Something went wrong: ' + err);
                } else {
                    //console.log('Your query count: ' + data.query.count);
                    let ciftree_files = data.Ciftree;
                    let video_files = data.Video;
                    AR.Cache(ciftree_files, "Ciftree");
                    AR.Cache(video_files, "Video");
                }
            });
        }
        env = info["env"];
        image.onload = function(){
            let frameCanvas = Rectangle;
            let ctx = frameCanvas.getContext("2d");
            ctx.beginPath();
            ctx.rect(0, 0, 1024, 768);
            var pattern = ctx.createPattern(this, "no-repeat");
            ctx.fillStyle = pattern;
            ctx.fill();
            ctx.closePath();    
        };


        //document.querySelector("#scene").innerHTML = "";
        //document.querySelector("#scene").append(video);
        return Rectangle;
    }
}