function s2649() {
    let sum = AR.Summary({
        env: "PHH",
        bg: "PHH_NavB" + (Flags.Night_FL ? "Night" : "") + "_BG",
        ext: "webp"
    });
    let light = AR.Movie({
        movie: "PHH_NavBNightLight_BG",
        id: "PHH_NavBNightLight_BG",
        onScreen: [0, 0, 1024, 690],
        z: 1,
        active: (Flags.Night_FL && Flags.Switch_toPHG) ? true : false
    });
    let forwardNAV = AR.Hotspot({
        scene: "s2900",
        onScreen: [275, 70, 749, 640],
        cursor: "Forward",
        id: "NAVtoPHG",
        active: (Flags.Night_FL) ? Flags.Switch_toPHG : true
    });
    let switchNAV = AR.Hotspot({
        onScreen: [200, 410, 275, 530],
        cursor: "Manipulate",
        hint: false,
        active: Flags.Night_FL,
        OnUp: function() {
            Flags.Switch_toPHG = !Flags.Switch_toPHG;
            if(Flags.Switch_toPHG) {
                document.querySelector("#PHH_NavBNightLight_BG").style.visibility = "visible";
                document.querySelector("#NAVtoPHG").style.visibility = "visible";
                document.querySelector("#NAVtoPHG").style.pointerEvents = "auto";
            }
            else {
                document.querySelector("#PHH_NavBNightLight_BG").style.visibility = "hidden";
                document.querySelector("#NAVtoPHG").style.visibility = "hidden";
                document.querySelector("#NAVtoPHG").style.pointerEvents = "none";
            }
        }
    });
    let leftNAV = AR.Hotspot({
        scene: "s2650",
        onScreen: [0, 0, 200, 690],
        cursor: "Left",
        active: function() {
            //return not locked
        }
    });
    let backNAV = AR.Hotspot({
        scene: "s2651",
        onScreen: [0, 560, 1024, 690],
        cursor: "UTurn",
        active: function() {
            //return not locked
        }
    });
    return [sum, light, forwardNAV, switchNAV, leftNAV, backNAV];
}