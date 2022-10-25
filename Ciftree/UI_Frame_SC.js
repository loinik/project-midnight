let frameBaseOVL = AR.Overlay({
    ovl: "UI_Frame_OVL",
    source: [2, 2, 1026, 128],
    onScreen: [0, 642, 1024, 768],
    z: 1
});
let ccPaneOVL = AR.Overlay({
    ovl: "UI_Frame_OVL",
    source: [2, 130, 684, 173],
    onScreen: [102, 650, 784, 693],
    z: -5
});
let menuMag_Button = AR.Button({
    hs: AR.Hotspot({
        onScreen: [0, 669, 42, 755],
        cursor: "MenuHot"
    }),
    overOvl: AR.Overlay({
        ovl: "UI_Frame_OVL",
        source: [596, 345, 633, 422],
        onScreen: [0, 673, 37, 750],
        z: 1
    }),
    OnUp: function() {
        alert("Not Available Yet");
    }
});

let menuFlashOVL = AR.Overlay({
    id: "menuFlashOVL",
    ovl: "UI_Frame_OVL",
    source: [596, 345, 633, 422],
    onScreen: [0, 673, 37, 750],
    z: 1,
    active: false
});

let awardMenuOVL = AR.Overlay({
    id: "awardMenuOVL",
    ovl: "UI_Frame_OVL",
    source: [596, 424, 633, 501],
    onScreen: [0, 673, 37, 750],
    z: 1,
    active: false
});
let awardFlashOVL = AR.Overlay({
    id: "awardFlashOVL",
    ovl: "UI_Frame_OVL",
    source: [596, 503, 633, 580],
    onScreen: [0, 673, 37, 750],
    z: 2,
    active: false
});
document.querySelector("#uiFrame").append(frameBaseOVL, ccPaneOVL, menuMag_Button, menuFlashOVL);