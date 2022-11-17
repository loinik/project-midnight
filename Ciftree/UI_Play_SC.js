function UI_Play_SC() {
    let sum = AR.Summary({
        env: "OPN",
        bg: "toast_BG"
    });
    let loadingBG = AR.Movie({
        movie: "UI_Loading_BG",
        id: "coverBG",
        source: Viewport.uiSize,
        onScreen: Viewport.uiSize,
        loop: true,
        z: 0,
        delay: 0.5,
        duration: 2,
        opacity: 0,
        animationName: "fadeIn"
    });
    let continueText = AR.Text({
        text: (Flags.Touch) ? autotext.UIOPN03 : autotext.UIOPN02,
        onScreen: [50, 678, 974, 718],
        align: "right",
        verticalAlign: "center",
        z: 1
    });
    let disableUI = AR.Override({
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
    return [sum, loadingBG, continueText, startNAV];
}