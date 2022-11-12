function UI_Frame_SC() {
    let frameBaseOVL = AR.Overlay({
        ovl: "UI_Frame_OVL",
        source: (Flags.Touch) ? [2, 130, 1026, 128] : [2, 2, 1026, 128],
        onScreen: [0, 642, 1024, 768],
        z: 1
    });
    let ccPaneOVL = AR.Overlay({
        ovl: "UI_Frame_OVL",
        source: [2, 258, 684, 173],
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
            source: [596, 473, 633, 550],
            onScreen: [0, 673, 37, 750],
            z: 1
        }),
        OnUp: function() {
            //alert(autotext.SequenceJR_01);
            uiFrame.classList.add("disabled");
            Scene.LetsGo("TitleMenu_SC");
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
    let touchNav = AR.Overlay({
        ovl: "UI_Frame_OVL",
        source: [686, 359, 937, 426],
        onScreen: [691, 697, 760, 764],
        z: 1,
        active: Flags.Touch,
        id: "touchNav"
    });
    let touchNav_Button = AR.Button({
        hs: AR.Hotspot({
            ref: "UI_Frame_OVL",
            source: [686, 359, 937, 426],
            onScreen: [691, 697, 760, 764],
            cursor: "MenuHot"
        }),
        overOvl: AR.Overlay({
          ovl: "UI_Frame_OVL",
          source: [686, 428, 937, 495],
          onScreen: [691, 697, 760, 764],
        }),
        z: 3,
        active: Flags.Touch,
        id: "touchNav_Button",
        OnUp: enableTouchNav.bind(this) 
    });
    let touchNavPressed = AR.Overlay({
        ovl: "UI_Frame_OVL",
        source: [686, 497, 937, 564],
        onScreen: [691, 697, 760, 764],
        z: 1,
        active: false,
        id: "touchNavPressed"
    });
    let touchNavPressed_Button = AR.Button({
        hs: AR.Hotspot({
            ref: "UI_Frame_OVL",
            source: [686, 497, 937, 564],
            onScreen: [691, 697, 760, 764],
            cursor: "MenuHot"
        }),
        overOvl: AR.Overlay({
          ovl: "UI_Frame_OVL",
          source: [686, 566, 937, 644],
          onScreen: [691, 697, 760, 764],
        }),
        z: 3,
        active: false,
        id: "touchNavPressed_Button",
        OnUp: disableTouchNav.bind(this) 
    });
    function enableTouchNav() {
        document.querySelector("#touchNav").style.visibility = "hidden";
        document.querySelector("#touchNav_Button").style.visibility = "hidden";
        document.querySelector("#touchNavPressed").style.visibility = "visible";
        document.querySelector("#touchNavPressed_Button").style.visibility = "visible";
        document.querySelector("body").classList.add("navHint");
    }
    function disableTouchNav() {
        document.querySelector("#touchNav").style.visibility = "visible";
        document.querySelector("#touchNav_Button").style.visibility = "visible";
        document.querySelector("#touchNavPressed").style.visibility = "hidden";
        document.querySelector("#touchNavPressed_Button").style.visibility = "hidden";
        document.querySelector("body").classList.remove("navHint");
    }
    document.querySelector("#uiFrame").append(frameBaseOVL, ccPaneOVL, menuMag_Button, menuFlashOVL, touchNav, touchNav_Button, touchNavPressed, touchNavPressed_Button);
}