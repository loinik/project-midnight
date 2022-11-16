function s2614() {
    let sum = AR.Summary({
        env: "PHK",
        bg: "PHK_Node" + (Flags.Night_FL ? "Night" : "") + "0001_BG"
    });
    let locked = false;
    let kokoKringle = AR.Inspection({
        bg: "PHK_KokoKringleA" + (Flags.Night_FL ? "Night" : "") + "_BG",
        model: "PHK_KokoKringle_MDL"
    })
    let barOverlay = AR.Overlay({
        ovl: "PHK_KokoKringle_OVL",
        source: (Flags.Night_FL) ? [86, 50, 170, 98] : [86, 0, 170, 48],
        onScreen: [499, 475, 583, 523],
        active: true,
        z: 1
    });
    let backNAV = AR.Hotspot({
        onScreen: [0, 560, 1024, 690],
        scene: "s2611",
        cursor: "Back",
        active: function() {
            //return not locked
        }
    });
    return [sum, backNAV];
}