//import { Scene } from "../Build/three/three";

function s2625() {
    var sum = AR.Summary({
        env: "PHL",
        bg: "PHL_Fans" + (Flags.Night_FL ? "Night" : "") + "_BG",
        ext: "webp"
    });
    var locked = false;
    let missing = AR.Sound({
        sounds: "GTH113_SFX",
        channel: "PlayerVoice",
        volume: 0.75,
        active: false
    });
    var backNAV = AR.Hotspot({
        onScreen: [0, 560, 1024, 690],
        scene: "s2623",
        cursor: "Back",
        active: function() {
            //return not locked
        }
    });
    var lookNAV = AR.Hotspot({
        onScreen: [200, 150, 824, 450],
        cursor: "Manipulate",
        OnUp: function() {
            //missing.play();
            Flags.Night_FL = (Flags.Night_FL) ? false : true;
            Scene.LetsGo("UI_Transition_SC");
        }
    });
    return [sum, backNAV, lookNAV];
}