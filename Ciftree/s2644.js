function s2644() {
    let sum = AR.Summary({
        env: "PHH",
        bg: "PHH_StrU3" + (Flags.Night_FL ? "Night" : "") + "_BG",
        ext: "webp"
    });
    var forwardNAV = AR.Hotspot({
        scene: "s2646",
        onScreen: [200, 70, 824, 640],
        cursor: "Forward",
        active: function() {
            //return not locked
        }
    });
    var rightNAV = AR.Hotspot({
        onScreen: [824, 0, 1024, 690],
        scene: "s2645",
        cursor: "Right",
        active: function() {
            //return not locked
        }
    });
    return [sum, forwardNAV, rightNAV];
}