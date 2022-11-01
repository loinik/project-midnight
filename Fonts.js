class fontsBoot {
    Init() {

    }
}
class fontColorsInit {
    Create(colorObj) {
        Object.entries(colorObj).forEach(([key, value]) => {
            //alert(key);
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