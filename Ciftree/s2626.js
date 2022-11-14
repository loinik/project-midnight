function s2626() {
    let sum = AR.Summary({
        env: "PHL",
        bg: "PHL_Bookshelf" + (Flags.Night_FL ? "Night" : "") + "_BG"
    });
    var sprayNAV = AR.Hotspot({
        onScreen: [228, 289, 388, 449],
        scene: "s2627",
        cursor: "Manipulate",
        hint: false,
        active: function() {
            //return not locked
        }
    });
    var eggNAV = AR.Hotspot({
        onScreen: [720, 530, 845, 560],
        scene: "s2629",
        cursor: "MagGlassHot",
        hint: false,
        active: function() {
            //return not locked
        }
    });
    var binNAV = AR.Hotspot({
        onScreen: [435, 480, 575, 560],
        scene: "s2628",
        cursor: "MagGlassHot",
        hint: false,
        active: function() {
            //return not locked
        }
    });
    let sprayView = AR.Overlay({
        ovl: "PHL_BookshelfSpraycan_OVL",
        source: (Flags.Night_FL) ? [200, 0, 397, 160] : [0, 0, 197, 160],
        onScreen: [228, 289, 425, 449],
        z: 1,
        active: true,
        id: "spraycanView"
    });
    var backNAV = AR.Hotspot({
        onScreen: [0, 560, 1024, 690],
        scene: "s2623",
        cursor: "Back",
        active: function() {
            //return not locked
        }
    });
    return [sum, sprayNAV, sprayView, binNAV, eggNAV, backNAV];
}