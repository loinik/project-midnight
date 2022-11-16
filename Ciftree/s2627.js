function s2627() {
    let sum = AR.Summary({
        env: "PHL",
        bg: "PHL_Bookshelf" + (Flags.Night_FL ? "Night" : "") + "_BG"
    });
    var backNAV = AR.Hotspot({
        onScreen: [0, 560, 1024, 690],
        scene: "s2626",
        cursor: "Back",
        active: function() {
            //return not locked
        }
    });
    var sprayCan = AR.Inspection({
        bg: "PHL_Bookshelf" + (Flags.Night_FL ? "Night" : "") + "_BG",
        model: "PHL_SprayCan_MDL"
    });
    return [sum, backNAV];
}