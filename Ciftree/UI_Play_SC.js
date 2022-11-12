function UI_Play_SC() {
    let sum = AR.Summary({
        env: "OPN",
        bg: "UI_Play_BG"
    });
    var disableUI = AR.Override({
        Run: function() {
            //this:Send("UIFrame", "Disable")
            //this:Send("UIFrame", "Hide")
            //this:Done()
            uiFrame.classList.add("disabled");
        }
    });
    let locked = false;
    let startNAV = AR.Hotspot({
        scene: "s0",
        cursor: "MenuHot",
        onScreen: [0, 0, 1024, 768],
        active: function() {
            //
        }
    });
    return [sum, startNAV];
}