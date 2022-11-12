function UI_Transition_SC() {
    var sum = AR.Summary({
        env: "PHG",
        bg: "toast_BG"
    });
    var transitionAnim = AR.Movie({
        movie: "UI_Trans" + (Flags.Night_FL ? "D2N" : "N2D") + "_BG",
        z: 1,
        onScreen: [0, 0, 1024, 690],
        active: true,
        id: "transitionAnim",
        OnEnd: function() {
            document.querySelector("#scene").innerHTML = "";
            s2600().forEach(element => {
                document.querySelector("#scene").append(element);
            });
        }
    });
    return [sum, transitionAnim];
}