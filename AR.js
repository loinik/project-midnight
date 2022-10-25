class ar {
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

        if(info["active"] == false) {
            Rectangle.style.visibility = "hidden";
        }

        if(info["id"]) {
            Rectangle.id = info["id"];
        }

        if(info["opacity"]) {
            Rectangle.style.opacity = info["opacity"];
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
        //mouseArea.style.cursor = "pointer";

        if(info["active"] == false) {
            parent.style.visibility = "hidden";
        }

        if(info["z"]) {
            parent.style.zIndex = info["z"];
        }
        
        if(info["id"]) {
            parent.id = info["id"];
        }

        if(info["cursor"]) {
            //alert(info["cursor"]);
            parent.addEventListener("mouseover", function(event) {
                CursorInit.Set(info["cursor"]);
            });
            parent.addEventListener("mouseleave", function(event) {
                CursorInit.Set("MagGlass");
            });
        }

        //switch(info["cursor"]) {
        //    case "MenuHot":
        //        mouseArea.style.cursor = "pointer";
        //        break;
        //    case "Forward":
        //        mouseArea.style.cursor = "n-resize";
        //        break;
        //    case "RightCorner":
        //        mouseArea.style.cursor = "e-resize";
        //        break;
        //    case "LeftCorner":
        //        mouseArea.style.cursor = "w-resize";
        //        break;
        //    case "Uturn":
        //        mouseArea.style.cursor = "s-resize";
        //        break;
        //}

        if(info["OnUp"] != undefined) {
            parent.addEventListener("click", function(event){
                
                info["OnUp"]();
            });
        }

        if(info["scene"]) {
            parent.addEventListener("click", function(event){
                document.querySelector("#scene").innerHTML = "";
                import ("/mid/Ciftree/" + info["scene"] + ".js");
                window[info["scene"]]().forEach(element => {
                    document.querySelector("#scene").append(element);
                });                 
            });
            if(Flags.Touch && info["hint"] != false) {
                let navCursor = AR.Clone(info["cursor"]);
                navCursor.classList.add("touchNAV");
                parent.append(navCursor);
            }
            
        }
        parent.append(mouseArea);
        return parent;
    }

    Button (info) {
        let o = document.createElement("div");
        if(info["active"] == false) {
            o.style.visibility = "hidden";
        }
        o.style.zIndex = info["z"];
        //o.style.display = "block";
        
        //alert(test.getPropertyValue('position'));
        //let test = info["hs"].style;
        o.style.position = "relative";
        //o.style.left = 0;
        //o.style.top = "1200px";
        //o.style.position = test.getPropertyValue('position');
        //o.style.left = test.getPropertyValue('left');
        //o.style.top = test.getPropertyValue('top');
        //o.style.display = "block";
        //o.style.height = "100%";
        //o.style.width = "100%";
        
        info["overOvl"].style.opacity = 0;

        info["hs"].addEventListener("mouseover", function(event){
            info["overOvl"].style.opacity = 1;
        });

        o.id = info["id"];

        info["hs"].addEventListener("mouseleave", function(event){
            info["overOvl"].style.opacity = 0;
        });

        info["hs"].addEventListener("click", function(event){
            info["OnUp"](o);
        });

        o.append(info["overOvl"], info["hs"]);
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
        var snd = new Audio("Sound/" + info["sounds"] + ".wav");
        if(info["volume"]) snd.volume = info["volume"];
        snd.currentTime = 0;

        if(info["active"] == true) {
            var sound = document.createElement("audio");
            sound.id = info["sounds"];

            var source = document.createElement("source");
            source.src = "Sound/" + info["sounds"] + ".wav";
            source.type = "audio/wav";

            sound.append(source);
            document.querySelector("#game").append(sound);
            document.querySelector("#" + info["sounds"]).play();
        }
        else {
            return snd;
        }
        
    }

    Movie(info) {
        var video = document.createElement("video");
        if (info["OnEnd"]) {
            video.id = info["id"];
        }
        
        video.width = "1024";
        video.height = "768";

        var source = document.createElement("source");
        source.src = "Video/" + info["movie"] + ".mp4";
        source.type = "video/mp4";

        video.append(source);
        

        if (info["OnEnd"]) {
            video.addEventListener('ended', function(event) {
                document.querySelector("#" + info["id"]).remove();
                info["OnEnd"]();
            });
        }
        else {
            video.addEventListener('ended', function(event) {
                document.querySelector("#" + info["id"]).remove();
            });
        }

        
        document.querySelector("#game").append(video);

        if (info["active"] == true) {
            document.querySelector("#" + info["id"]).play();
        }

        
    }

    Timer(info) {
        let timer = {
            start() {
                window.setTimeout(info["OnEnd"], info["duration"] * 1000);
            }
        }
        return timer;
    }

    Summary(info) {
        var Rectangle = document.createElement("canvas");

        Rectangle.style.position = "absolute";
        Rectangle.width = 1024;
        Rectangle.height = 690;

        var image = new Image();
        image.src = "Video/" + info["bg"] + ".jpg"; 
        image.onload = function(){
            let frameCanvas = Rectangle;
            let ctx = frameCanvas.getContext("2d");
            ctx.beginPath();
            ctx.rect(0, 0, 1024, 690);
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