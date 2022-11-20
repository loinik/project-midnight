function UI_CellAnim_SC() {
    let phoneClick = AR.Sound({
        sounds: "Phone_Open_01_SFX",
        volume: 0.5,
        channel: "PhoneFX",
        active: false
    });
    let input = {
        anim: {
            small: {
                scale: [0.13, 0.13],
                center: [88, 711],
                alpha: 0,
                duration: 0.3
            },
            large: {
                scale: [1, 1],
                center: [512, 313],
                alpha: 1,
                duration: 0.3
            },
            fade: {duration: 0.15, alpha: 0},
            ovl: AR.Overlay({
                ovl: "UI_PhoneTrayANIM_OVL",
                source: [0, 0, 424, 763],
                onScreen: [0, 0, 424, 763],
                z: -5.1,
                active: false
            })
        },
        button: AR.Button({
            alias: "CellButton",
            ghostAlpha: 0.5,
            hs: AR.Hotspot({
                onScreen: [51, 667, 123, 761],
                cursor: "MenuHot"
            }),
            baseOvl: AR.Overlay({
                ovl: "UI_Frame_OVL",
                source: [596, 303, 653, 386],
                onScreen: [59, 673, 116, 756]
            }),
            overOvl: AR.Overlay({
                ovl: "UI_Frame_OVL",
                source: [596, 388, 653, 471],
                onScreen: [59, 673, 116, 756]
            })
        }),
        flash: {
            downovl: AR.Overlay({
                ovl: "UI_Frame_OVL",
                source: [596, 175, 653, 258],
                onScreen: [59, 673, 116, 756],
                active: false
            }),
            upovl: AR.Overlay({
                ovl: "UI_Frame_OVL",
                source: [596, 260, 653, 343],
                onScreen: [59, 673, 116, 756],
                active: false
            }),
            transitionDuration: 0.1,
            overalDuration: 1
        },
        callFlash: {
            downovl: AR.Overlay({
                ovl: "UI_Frame_OVL",
                source: [596, 175, 653, 258],
                onScreen: [59, 673, 116, 756],
                active: false
            }),
            upovl: AR.Overlay({
                ovl: "UI_Frame_OVL",
                source: [596, 260, 653, 343],
                onScreen: [59, 673, 116, 756],
                active: false
            }),
            transitionDuration: 0.1,
            overalDuration: 1
        }
    };
    let animatingUp = false;
    let animatingDown = false;
    let updater = AR.Override({});
    let waitOneFrame = AR.Override({active: false});
    let flasher = AR.Override({
        messageCountTrack: 0,
            RunOnce: function() {
                //this.messageCountTrack = TextManager.ChangeCount()
                input.flash.downOVL.animator[1].a = 0
                input.flash.upOVL.animator[1].a = 0
            },
        active: true
    });
    //let sink = AR.Sink({
    //    z: -1,
    //    active: false
    //});
    let flasherTMR = AR.Timer({
        duration: input.flash.overalDuration,
        active: false
    });
    let flashDown = AR.Override({active: false})
    let flashUp = AR.Override({active: false})
    let cellPhoneStreamName = "CellphoneStream"
    let cellPhoneStreamParams = {
        stream: cellPhoneStreamName,
        scene: "PhoneMainMenu_SC",
        z: -1,
        inVP: false
    }
    let deadCellPhoneStreamParams = {
        stream: cellPhoneStreamName,
        scene: "PhoneDead_SC",
        z: -1,
        inVP: false
    }
    document.querySelector("#uiFrame").append(input.button);
}
