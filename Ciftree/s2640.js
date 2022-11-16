function s2640() {
    let sum = AR.Summary({
        env: "PHH",
        bg: "PHH_StrU1" + (Flags.Night_FL ? "Night" : "") + "_BG",
        ext: "webp"
    });
    var forwardNAV = AR.Hotspot({
        scene: "s2642",
        onScreen: [200, 70, 824, 640],
        cursor: "RightCorner",
        active: function() {
            //return not locked
        }
    });
    var backNAV = AR.Hotspot({
        onScreen: [0, 560, 1024, 690],
        scene: "s2641",
        cursor: "UTurn",
        active: function() {
            //return not locked
        }
    });
    return [sum, forwardNAV, backNAV];
}