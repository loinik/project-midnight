function s2648() {
    let sum = AR.Summary({
        env: "PHH",
        bg: "PHH_NavA" + (Flags.Night_FL ? "Night" : "") + "_BG"
    });
    var forwardNAV = AR.Hotspot({
        scene: "s2649",
        onScreen: [200, 70, 824, 640],
        cursor: "Forward",
        active: function() {
            //return not locked
        }
    });
    var rightNAV = AR.Hotspot({
        scene: "s2647",
        onScreen: [824, 0, 1024, 690],
        cursor: "Right",
        active: function() {
            //return not locked
        }
    });
    var leftNAV = AR.Hotspot({
        scene: "s2646",
        onScreen: [0, 0, 200, 690],
        cursor: "Left",
        active: function() {
            //return not locked
        }
    });
    return [sum, forwardNAV, rightNAV, leftNAV];
}