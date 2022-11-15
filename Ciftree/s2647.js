function s2647() {
    let sum = AR.Summary({
        env: "PHH",
        bg: "PHH_NavABack" + (Flags.Night_FL ? "Night" : "") + "_BG"
    });
    var forwardNAV = AR.Hotspot({
        scene: "s2645",
        onScreen: [200, 70, 824, 640],
        cursor: "LeftCorner",
        active: function() {
            //return not locked
        }
    });
    var backNAV = AR.Hotspot({
        onScreen: [0, 560, 1024, 690],
        scene: "s2646",
        cursor: "UTurn",
        active: function() {
            //return not locked
        }
    });
    return [sum, forwardNAV, backNAV];
}