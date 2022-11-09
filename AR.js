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
                document.querySelector("#scene").innerHTML = "";
                //import ("/mid/Ciftree/" + info["scene"] + ".js");
                window[info["scene"]]().forEach(element => {
                    document.querySelector("#scene").append(element);
                });                 
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

    Button (info) {
        let o = document.createElement("div");
        if(info["active"] == false) {
            o.style.visibility = "hidden";
        }
        o.style.zIndex = info["z"];

        o.style.position = "relative";
        
        info["overOvl"].style.opacity = 0;

        info["hs"].addEventListener("mouseover", function(event){
            info["overOvl"].style.opacity = 1;
        });

        o.id = info["id"];

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

        snd.addEventListener("play", function(event) {
            let sound = info["sounds"];
            for(var key in autotext){
                if(info["sounds"] == key) {
                    let text = AR.Text({
                        text: autotext[sound],
                        onScreen: [102, 650, 784, 693],
                        useAutotext: true,
                        active: false
                    });
                    document.querySelectorAll(".gameNAV, .touchNAV").forEach(allNAV => {
                        allNAV.style.setProperty("visibility", "hidden", "important");
                    });
                    game.append(text);
                }
            }
        });
        
        if(info["channel"] != "Theme") {
            snd.addEventListener("ended", function(event) {
                document.querySelector("#textPane").remove();
                document.querySelectorAll(".gameNAV, .touchNAV").forEach(allNAV => {
                    allNAV.style.setProperty("visibility", "visible", "important");
                });
            });
        }
        

        if(info["loop"] == true) {
            snd.loop = true;
        }

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

    Text(info) {
        let Text = document.createElement("div");
        Text.style.position = "absolute";
        Text.style.zIndex = 5;

        var onScreen = Rect.New(info["onScreen"][0], info["onScreen"][1], info["onScreen"][2], info["onScreen"][3]);

        Text.style.top = onScreen.y + "px";
        Text.style.left = onScreen.x + "px";
        Text.style.width = onScreen.width + "px";
        Text.style.height = onScreen.height + "px";

        Text.classList.add("text");

        let fontNum = (Font.Parse(info["text"])) ? Font.Parse(info["text"]) : 13;
        let fontInfo = fonts[fontNum];

        Text.style.color = colors[Color.Parse(info["text"])];
        Text.style.fontFamily = fontInfo["family"];
        Text.style.fontSize = fontInfo["size"] + "px";

        Text.id = "textPane";

        Text.innerHTML = info["text"];
        return Text;
    }

    Movie(info) {
        let mp4 = "Video/" + info["movie"] + ".mp4";
        let jpg = "Video/" + info["movie"] + ".jpg";
        let png = "Video/" + info["movie"] + ".apng";
        let z = (info["z"]) ? info["z"] : 1;

        if(mp4) {
            var video = document.createElement("video");
            if (info["OnEnd"]) {
                video.id = info["id"];
            }

            video.width = "1024";
            video.height = "690";
            video.style.zIndex = z;
            video.style.position = "absolute";
            video.style.top = "0px";
            video.style.left = "0px";
            video.controls = false;

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
        if(jpg) {
            let Rectangle = document.createElement("canvas");

            Rectangle.style.position = "absolute";
            Rectangle.width = 1024;
            Rectangle.height = 768;
            Rectangle.style.zIndex = z;

            let image = new Image();
            image.src = "Video/" + info["movie"] + ".jpg"; 
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
            return Rectangle;
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
        Rectangle.style.zIndex = 0;

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