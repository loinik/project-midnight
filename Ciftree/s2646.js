function s2646() {
    let sum = AR.Summary({
        env: "PHH",
        bg: "PHH_RoomMei" + (Flags.Night_FL ? "Night" : "") + "_BG"
    });
    var rightNAV = AR.Hotspot({
        scene: "s2648",
        onScreen: [824, 0, 1024, 690],
        cursor: "Right",
        active: function() {
            //return not locked
        }
    });
    var backNAV = AR.Hotspot({
        onScreen: [0, 560, 1024, 690],
        scene: "s2647",
        cursor: "UTurn",
        active: function() {
            //return not locked
        }
    });
    return [sum, rightNAV, backNAV];
}