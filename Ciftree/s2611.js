function s2611() {
    var sum = AR.Summary({
        env: "PHK",
        bg: "PHK_Node" + (Flags.Night_FL ? "Night" : "") + "0001_BG"
    });
    var locked = false;
    let barOverlay = AR.Overlay({
        ovl: "PHK_KokoKringle_OVL",
        source: (Flags.Night_FL) ? [0, 50, 84, 98] : [0, 0, 84, 48],
        onScreen: [499, 475, 583, 523],
        active: true,
        z: 1
    });
    var kokoKringleNAV = AR.Hotspot({
        scene: "s2614",
        onScreen: [481, 480, 601, 540],
        cursor: "Manipulate",
        hint: false,
        active: function() {
            //
        }        
    });
    var rightNAV = AR.Hotspot({
        scene: "s2612",
        onScreen: [824, 0, 1024, 690],
        cursor: "Right",
        active: function() {
            //return not locked
        }
    });
    var leftNAV = AR.Hotspot({
        scene: "s2610",
        onScreen: [0, 0, 200, 690],
        cursor: "Left",
        active: function() {
            //return not locked
        }
    });
    var backNAV = AR.Hotspot({
        onScreen: [0, 560, 1024, 690],
        scene: "s2613",
        cursor: "UTurn",
        active: function() {
            //return not locked
        }
    });
    return [sum, barOverlay, kokoKringleNAV, rightNAV, leftNAV, backNAV];
}