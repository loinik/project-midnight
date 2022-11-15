function s2645() {
    let sum = AR.Summary({
        env: "PHH",
        bg: "PHH_StrD1" + (Flags.Night_FL ? "Night" : "") + "_BG"
    });
    var forwardNAV = AR.Hotspot({
        scene: "s2643",
        onScreen: [200, 70, 824, 640],
        cursor: "Forward",
        active: function() {
            //return not locked
        }
    });
    var leftNAV = AR.Hotspot({
        scene: "s2644",
        onScreen: [0, 0, 200, 690],
        cursor: "Left",
        active: function() {
            //return not locked
        }
    });
    return [sum, forwardNAV, leftNAV];
}