class scene {
    LetsGo(dest) {
        document.querySelector("#scene").innerHTML = "";
        window[dest]().forEach(element => {
            document.querySelector("#scene").append(element);
        });
    }
}