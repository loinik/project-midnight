function s2801() {
    var sum = AR.Summary({
        env: "NBH",
        bg: "NBH_Node" + (Flags.Night_FL ? "Night" : "") + "0001_BG"
    });
    var locked = false;
    var forwardNAV = AR.Hotspot({
        scene: "s2811",
        onScreen: [200, 70, 820, 640],
        cursor: "Forward",
        active: function() {
            //return not locked
        }
    });
    var rightNAV = AR.Hotspot({
        scene: "s2802",
        onScreen: [824, 0, 1024, 690],
        cursor: "Right",
        active: function() {
            //return not locked
        }
    });
    var leftNAV = AR.Hotspot({
        scene: "s2800",
        onScreen: [0, 0, 200, 690],
        cursor: "Left",
        active: function() {
            //return not locked
        }
    });
    var backNAV = AR.Hotspot({
        onScreen: [0, 560, 1024, 690],
        scene: "s2803",
        cursor: "UTurn",
        active: function() {
            //return not locked
        }
    });
    return [sum, forwardNAV, rightNAV, leftNAV, backNAV];
}