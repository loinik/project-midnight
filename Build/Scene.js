class scene {
    LetsGo(dest, bool = true) {
        let oldScene = sc;
        let gameScene = document.querySelector("#scene");
        sc = dest;
        let newScene = document.createElement("div");
        newScene.id = dest;
        
        gameScene.insertBefore(newScene, gameScene.firstChild);

        window[dest](bool).forEach(element => {
            newScene.append(element);
        });
        
        document.querySelector(`#${dest}`).childNodes.forEach(element => {
            if(element && element.hasAttribute("data-autoplay") && element.getAttribute("data-autoplay") == "true") {
                document.querySelector(`#${element.id}`).play();
            }
        });

        setTimeout(function() {
            if(oldScene) document.querySelector(`#${oldScene}`).remove()
        }, 10);
    }
}