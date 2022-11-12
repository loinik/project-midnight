class scene {
    LetsGo(dest, bool = true) {
        document.querySelector("#scene").innerHTML = "";
        window[dest](bool).forEach(element => {
            document.querySelector("#scene").append(element);
        });
    }
}