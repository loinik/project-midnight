function s2817() {
    var sum = AR.Summary({
        env: "NBH",
        bg: "NBH_NavD" + (Flags.Night_FL ? "Night" : "") + "_BG"
    });
    var locked = false;
    var backNAV = AR.Hotspot({
        onScreen: [0, 560, 1024, 690],
        scene: "s2818",
        cursor: "UTurn",
        active: function() {
            //return not locked
        }
    });
    return [sum, backNAV];
}