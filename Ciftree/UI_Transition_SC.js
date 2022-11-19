function UI_Transition_SC() {
    var sum = AR.Summary({
        env: "PHG",
        bg: "toast_BG"
    });
    var transitionAnim = AR.Movie({
        movie: "UI_Trans" + (Flags.Night_FL ? "D2N" : "N2D") + "_BG",
        z: 3,
        type: "anim",
        onScreen: [0, 0, 1024, 690],
        active: true,
        id: "transitionAnim",
        webm: false,
        OnEnd: function() {
            Scene.LetsGo("s2600");
        }
    });
    return [sum, transitionAnim];
}