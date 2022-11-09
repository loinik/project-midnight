function s2702() {
    var sum = AR.Summary({
        env: "PHP",
        bg: "PHP_Door" + (Flags.Night_FL ? "Night" : "") + "Open_BG"
    });
    var locked = false;
    var forwardNAV = AR.Hotspot({
        scene: "s2600",
        onScreen: [202, 70, 824, 640],
        cursor: "Forward",
        active: function() {
            //return not locked
        }
    });
    var backNAV = AR.Hotspot({
        onScreen: [0, 560, 1024, 690],
        scene: "s2700",
        cursor: "Back",
        active: function() {
            //return not locked
        }
    });
    return [sum, forwardNAV, backNAV];
}