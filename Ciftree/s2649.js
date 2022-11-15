function s2649() {
    let sum = AR.Summary({
        env: "PHH",
        bg: "PHH_NavB" + (Flags.Night_FL ? "Night" : "") + "_BG"
    });
    var forwardNAV = AR.Hotspot({
        scene: "s2900",
        onScreen: [200, 70, 824, 640],
        cursor: "Forward",
        active: function() {
            //return not locked
        }
    });
    var leftNAV = AR.Hotspot({
        scene: "s2650",
        onScreen: [0, 0, 200, 690],
        cursor: "Left",
        active: function() {
            //return not locked
        }
    });
    var backNAV = AR.Hotspot({
        scene: "s2651",
        onScreen: [0, 560, 1024, 690],
        cursor: "UTurn",
        active: function() {
            //return not locked
        }
    });
    return [sum, forwardNAV, leftNAV, backNAV];
}