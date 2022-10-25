function s2602() {
    var sum = AR.Summary({
        env: "PHH",
        bg: "PHH_Node" + (Flags.Night_FL ? "Night" : "") + "0002_BG"
    });
    var locked = false;
    var rightNAV = AR.Hotspot({
        scene: "s2603",
        onScreen: [824, 0, 1024, 580],
        cursor: "Right",
        active: function() {
            //return not locked
        }
    });
    var leftNAV = AR.Hotspot({
        scene: "s2601",
        onScreen: [0, 0, 200, 580],
        cursor: "Left",
        active: function() {
            //return not locked
        }
    });
    var backNAV = AR.Hotspot({
        onScreen: [0, 590, 1024, 690],
        scene: "s2600",
        cursor: "UTurn",
        active: function() {
            //return not locked
        }
    });
    return [sum, rightNAV, leftNAV, backNAV];
}