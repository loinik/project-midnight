function s2650() {
    let sum = AR.Summary({
        env: "PHH",
        bg: "PHH_RoomBath" + (Flags.Night_FL ? "Night" : "") + "_BG",
        ext: "webp"
    });
    var rightNAV = AR.Hotspot({
        scene: "s2649",
        onScreen: [824, 0, 1024, 690],
        cursor: "Right",
        active: function() {
            //return not locked
        }
    });
    var leftNAV = AR.Hotspot({
        scene: "s2651",
        onScreen: [0, 0, 200, 690],
        cursor: "Left",
        active: function() {
            //return not locked
        }
    });
    return [sum, rightNAV, leftNAV];
}