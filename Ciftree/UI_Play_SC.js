function UI_Play_SC() {
    let sum = AR.Summary({
        env: "OPN",
        bg: "UI_Play_BG"
    });
    let locked = false;
    let startNAV = AR.Hotspot({
        scene: "s0",
        cursor: "MagGlassHot",
        onScreen: [0, 0, 1024, 768],
        active: function() {
            //
        }
    });
    return [sum, startNAV];
}