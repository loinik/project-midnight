function s2800() {
    var sum = AR.Summary({
        env: "NBH",
        bg: "NBH_Node" + (Flags.Night_FL ? "Night" : "") + "0000_BG"
    });
    var locked = false;
    var rightNAV = AR.Hotspot({
        scene: "s2801",
        onScreen: [824, 0, 1024, 690],
        cursor: "Right",
        active: function() {
            //return not locked
        }
    });
    var leftNAV = AR.Hotspot({
        scene: "s2803",
        onScreen: [0, 0, 200, 690],
        cursor: "Left",
        active: function() {
            //return not locked
        }
    });
    var backNAV = AR.Hotspot({
        onScreen: [0, 560, 1024, 690],
        scene: "s2802",
        cursor: "UTurn",
        active: function() {
            //return not locked
        }
    });
    return [sum, rightNAV, leftNAV, backNAV];
}