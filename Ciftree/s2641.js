function s2641() {
    let sum = AR.Summary({
        env: "PHH",
        bg: "PHH_StrD3" + (Flags.Night_FL ? "Night" : "") + "_BG",
        ext: "webp"
    });
    var forwardNAV = AR.Hotspot({
        scene: "s2602",
        onScreen: [200, 70, 824, 640],
        cursor: "ForwardLeft",
        active: function() {
            //return not locked
        }
    });
    var backNAV = AR.Hotspot({
        onScreen: [0, 560, 1024, 690],
        scene: "s2640",
        cursor: "UTurn",
        active: function() {
            //return not locked
        }
    });
    return [sum, forwardNAV, backNAV];
}