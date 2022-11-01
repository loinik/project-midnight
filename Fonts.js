class fontsBoot {
    Init(fontsObj) {
        Object.entries(fontsObj).forEach(([key, info]) => {
            fonts[key] = {};
            fonts[key]["family"] = info["family"];
            fonts[key]["size"] = info["size"];
        });
    }
}
class fontColorsInit {
    Create(colorObj) {
        Object.entries(colorObj).forEach(([key, value]) => {
            colors[key] = value;
        }); 
    }
}
class font {
    Parse(string) {
        let fontTag = string.match(/<f([0-9]+)>/g);
        if (fontTag != null) {
            let fontNumber = parseInt(fontTag.toString().match(/[0-9]+/g));
            return fontNumber;
        }
        else {
            return false;
        }
    }
}