class color {
    New(a, r, g, b) {
        let alpha = a / 255 * 100;
        return `rgba(${r}, ${g}, ${b}, ${alpha})`;
    }
    Parse(string) {
        let colorTag = string.match(/<c([0-9]+)>/g).toString();
        let colorNumber = parseInt(colorTag.match(/[0-9]+/g));
        return colorNumber;
    }
}