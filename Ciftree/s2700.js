function s2700() {
    var sum = AR.Summary({
        env: "PHP",
        bg: "PHP_Door" + (Flags.Night_FL ? "Night" : "") + "_BG"
    });
    var locked = false;
    var forwardNAV = AR.Hotspot({
        scene: "s2702",
        onScreen: [202, 0, 824, 640],
        cursor: "Manipulate",
        hint: false,
        active: function() {
            //return not locked
        }
    });
    var backNAV = AR.Hotspot({
        onScreen: [0, 560, 1024, 690],
        scene: "s2701",
        cursor: "UTurn",
        active: function() {
            //return not locked
        }
    });
    return [sum, forwardNAV, backNAV];
}