function s2651() {
    let sum = AR.Summary({
        env: "PHH",
        bg: "PHH_NavBBack" + (Flags.Night_FL ? "Night" : "") + "_BG",
        ext: "webp"
    });
    var forwardNAV = AR.Hotspot({
        scene: "s2647",
        onScreen: [200, 70, 824, 640],
        cursor: "LeftCorner ",
        active: function() {
            //return not locked
        }
    });
    var rightNAV = AR.Hotspot({
        onScreen: [824, 0, 1024, 690],
        scene: "s2650",
        cursor: "Right",
        active: function() {
            //return not locked
        }
    });
    var backNAV = AR.Hotspot({
        scene: "s2649",
        onScreen: [0, 560, 1024, 690],
        cursor: "UTurn",
        active: function() {
            //return not locked
        }
    });
    return [sum, forwardNAV, rightNAV, backNAV];
}