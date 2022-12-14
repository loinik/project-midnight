function UI_NotesTasklist_SC() {
    /*Scene:Include("UI_Notes_SC")
    Scene:Include("UI_Tasklist_SC")*/
    
    let ntMaster = AR.Transformer({
        collapsed: [0, 400],
        expanded: [0, 0],
        animTime: 0.2,
        z: 0,
        alias: "NotesTasklist"
    })
    let showTasklistHotspot = AR.Hotspot({
        ref: "UI_Frame_OVL",
        source: [13, 171, 122, 40],
        onScreen: [744, 242, 122, 40],
        cursor: "MenuHot",
        z: 3,
        active: false,
        id: "showTasklistHotspot",
        OnUp: ChangeTab.bind()
    });
    let showNotesHotspot = AR.Hotspot({
        ref: "UI_Frame_OVL",
        source: [175, 171, 122, 40],
        onScreen: [906, 242, 122, 40],
        cursor: "MenuHot",
        z: 3,
        active: true,
        id: "showNotesHotspot",
        OnUp: ChangeTab.bind()
    });
    let expandSound = AR.Sound({
        sounds: "TaskListOpen_SFX",
        channel: "UIFX",
        volume: 0.75,
        active: false
    });
    let collapseSound = AR.Sound({
        sounds: "TaskListClsd_SFX",
        channel: "UIFX",
        volume: 0.75,
        active: false
    });
    let expandTasklistButton = AR.Button({
        hs: AR.Hotspot({
            ref: "UI_Frame_OVL",
            source: [13, 299, 162, 40],
            onScreen: [744, 242, 162, 40],
            cursor: "MenuHot"
        }),
        overOvl: AR.Overlay({
          ovl: "UI_Frame_OVL",
          source: [969, 303, 994, 200],
          onScreen: [836, 254, 861, 279],
        }),
        z: 2,
        active: true,
        id: "expandTasklistButton",
        OnUp: Expand.bind(this) 
    });
    
    let collapseTasklistButton = AR.Button({
        hs: AR.Hotspot({
            ref: "UI_Frame_OVL",
            source: [13, 299, 162, 40],
            onScreen: [744, 242, 162, 40],
            cursor: "MenuHot"
        }),
        overOvl: AR.Overlay({
          ovl: "UI_Frame_OVL",
          source: [942, 303, 967, 200],
          onScreen: [836, 254, 861, 279],
        }),
        z: 2,
        active: false,
        id: "collapseTasklistButton",
        OnUp: Collapse.bind(this) 
    });
    
    ///
    
    let expandNotesButton = AR.Button({
        hs: AR.Hotspot({
            ref: "UI_Frame_OVL",
            source: [135, 299, 162, 40],
            onScreen: [866, 242, 162, 40],
            cursor: "MenuHot"
        }),
        overOvl: AR.Overlay({
          ovl: "UI_Frame_OVL",
          source: [969, 303, 994, 200],
          onScreen: [989, 252, 1014, 277]
        }),
        z: 3,
        active: false,
        id: "expandNotesButton",
        OnUp: Expand.bind(this) 
    });
    
    let collapseNotesButton = AR.Button({
        hs: AR.Hotspot({
            ref: "UI_Frame_OVL",
            source: [135, 299, 162, 40],
            onScreen: [866, 242, 162, 40],
            cursor: "MenuHot"
        }),
        overOvl: AR.Overlay({
          ovl: "UI_Frame_OVL",
          source: [942, 303, 967, 200],
          onScreen: [989, 252, 1014, 277],
        }),
        z: 3,
        active: false,
        id: "collapseNotesButton",
        OnUp: Collapse.bind(this) 
    });
    
    //let expandTasklistButton = AR.Button_obj(expandTasklistButton_obj);
    
    /*let resizeNotesButton = AR.Button({
        hs: AR.Hotspot({
          ref: "UI_Frame_OVL",
          source: [135, 171, 162, 40],
          onScreen: [866, 242, 162, 40],
          cursor: "MenuHot"
        }),
        overOvl: AR.Overlay({
          ovl: "UI_Frame_OVL",
          source: [969, 175, 994, 200],
          onScreen: [989, 252, 1014, 277]
        }),
        collapseSource: [942, 175, 967, 200],
        expandSource: [969, 175, 994, 200],
        z: 2,
        active: false,
        id: "resizeNotesButton"
    });*/
    
    let collapseButton = AR.Button({
        hs: AR.Hotspot({
          onScreen: [764, 729, 999, 759],
          cursor: "MenuHot"
        }),
        overOvl: AR.Overlay({
          ovl: "UI_Frame_OVL",
          source: [942, 303, 967, 200],
          onScreen: [876, 729, 901, 754]
        }),
        active: true,
        z: 2,
        id: "collapseButton",
        OnUp: Collapse.bind(this)
    });
    
    let expandedShownTasklistArrowOvl = AR.Overlay({
        ovl: "UI_Frame_OVL",
        source: [942, 276, 967, 173],
        onScreen: [836, 254, 861, 279],
        z: 1,
        active: false,
        id: "expandedShownTasklistArrowOvl"
    });
    let expandedShownNotesArrowOvl = AR.Overlay({
        ovl: "UI_Frame_OVL",
        source: [942, 276, 967, 173],
        onScreen: [989, 252, 1014, 277],
        z: 1,
        active: false,
        id: "expandedShownNotesArrowOvl"
    });
    let expandedHiddenTasklistArrowOvl = AR.Overlay({
        ovl: "UI_Frame_OVL",
        source: [969, 276, 994, 166],
        onScreen: [836, 252, 861, 270],
        z: 1,
        active: false,
        id: "expandedHiddenTasklistArrowOvl"
    });
    let expandedHiddenNotesArrowOvl = AR.Overlay({
        ovl: "UI_Frame_OVL",
        source: [969, 276, 994, 166],
        onScreen: [989, 250, 1014, 268],
        z: 1,
        active: false,
        id: "expandedHiddenNotesArrowOvl"
    });
    let backdropOvl = AR.Overlay({
        ovl: "UI_Frame_OVL",
        source: [686, 258, 940, 215],
        onScreen: [763, 676, 1017, 761],
        z: -4,
        active: true
    });
    let tasklistOvl = AR.Overlay({
        ovl: "UI_Frame_OVL",
        source: [2, 303, 297, 694],
        onScreen: [729, 242, 1024, 761],
        z: -1,
        active: true,
        id: "tasklistOvl"
    });
    let notesOVL = AR.Overlay({
        ovl: "UI_Frame_OVL",
        source: [299, 303, 594, 694],
        onScreen: [729, 242, 1024, 761],
        z: -1,
        active: false,
        id: "notesOVL"
    });
    /*let sink = AR.Hotspot({
        onScreen: tasklistOvl.onScreen,
        watchRight: true,
        cursor: "Menu",
        ref: tasklistOvl.ovl,
        source: tasklistOvl.source,
        z: -10
    });*/
    
    ntMaster.append(showTasklistHotspot, showNotesHotspot, expandTasklistButton, collapseTasklistButton, expandNotesButton, collapseNotesButton, collapseButton, expandedShownTasklistArrowOvl, expandedShownNotesArrowOvl, expandedHiddenTasklistArrowOvl, expandedHiddenNotesArrowOvl, tasklistOvl, notesOVL/*, sink, notesMaster, tasklistMaster*/);
    document.querySelector("#uiFrame").append(ntMaster, backdropOvl);
    
    let activeTab = 1;
    let desinationTab = 2;
    let tabsState = "Collapse";
    
    function Expand() {
        tabsState = "Expanded";
        expandSound.play();
    
        document.querySelector("#NotesTasklist").style.transform = "TranslateY(0)";
    
        switch (activeTab) {
            case 1:
                activatedTasklistExpand();
                deactivatedNotesExpand();
                break;
            case 2:
                activatedNotesExpand();
                deactivatedTasklistExpand();
                break;
        }
    }
    
    function Collapse() {
        tabsState = "Collapse";
        collapseSound.play();
    
        document.querySelector("#NotesTasklist").style.transform = "TranslateY(400px)";
    
        switch (activeTab) {
            case 1:
                activatedTasklistCollapse();
                deactivatedNotesCollapse();
                break;
            case 2:
                activatedNotesCollapse();
                deactivatedTasklistCollapse();
                break;
        }
    }
    
    function ChangeTab() {
        if(desinationTab == activeTab) return false;
        else {
            switch (desinationTab) {
                case 1:
                    activeTab = 1;
                    document.querySelector("#showTasklistHotspot").style.visibility = "hidden";
                    document.querySelector("#showNotesHotspot").style.visibility = "visible";
            
                    document.querySelector("#tasklistOvl").style.visibility = "visible";
                    document.querySelector("#notesOVL").style.visibility = "hidden";
            
                    if(tabsState == "Collapse") {
                        activatedTasklistCollapse();
                        deactivatedNotesCollapse();
                    }
                    else {
                        activatedTasklistExpand();
                        deactivatedNotesExpand();
                    }
                    
                    break;
                case 2:
                    activeTab = 2;
                    document.querySelector("#showTasklistHotspot").style.visibility = "visible";
                    document.querySelector("#showNotesHotspot").style.visibility = "hidden";
                
                    document.querySelector("#tasklistOvl").style.visibility = "hidden";
                    document.querySelector("#notesOVL").style.visibility = "visible";
                
                    if(tabsState == "Collapse") {
                        activatedNotesCollapse();
                        deactivatedTasklistCollapse();
                    }
                    else {
                        activatedNotesExpand();
                        deactivatedTasklistExpand();
                    }
                    
                    break;
            }
        }
        desinationTab = (activeTab == 1) ? 2 : 1;
    }
    
    /* TASKS */
    
    function activatedTasklistExpand() {
        document.querySelector("#collapseTasklistButton").style.visibility = "visible";
        document.querySelector("#expandTasklistButton").style.visibility = "hidden";
        document.querySelector("#expandedShownTasklistArrowOvl").style.visibility = "visible";
        document.querySelector("#expandedHiddenTasklistArrowOvl").style.visibility = "hidden";
    }
    
    function activatedTasklistCollapse() {
        document.querySelector("#collapseTasklistButton").style.visibility = "hidden";
        document.querySelector("#expandTasklistButton").style.visibility = "visible";
        document.querySelector("#expandedShownTasklistArrowOvl").style.visibility = "hidden";
        document.querySelector("#expandedHiddenTasklistArrowOvl").style.visibility = "hidden";
    }
    
    function deactivatedTasklistExpand() {
        document.querySelector("#collapseTasklistButton").style.visibility = "hidden";
        document.querySelector("#expandTasklistButton").style.visibility = "hidden";
        document.querySelector("#expandedShownTasklistArrowOvl").style.visibility = "hidden";
        document.querySelector("#expandedHiddenTasklistArrowOvl").style.visibility = "visible";
    }
    
    function deactivatedTasklistCollapse() {
        document.querySelector("#collapseTasklistButton").style.visibility = "hidden";
        document.querySelector("#expandTasklistButton").style.visibility = "hidden";
        document.querySelector("#expandedShownTasklistArrowOvl").style.visibility = "hidden";
        document.querySelector("#expandedHiddenTasklistArrowOvl").style.visibility = "hidden";
    }
    
    /* NOTES */
    
    function activatedNotesExpand() {
        document.querySelector("#collapseNotesButton").style.visibility = "visible";
        document.querySelector("#expandNotesButton").style.visibility = "hidden";
        document.querySelector("#expandedShownNotesArrowOvl").style.visibility = "visible";
        document.querySelector("#expandedHiddenNotesArrowOvl").style.visibility = "hidden";
    }
    
    function activatedNotesCollapse() {
        document.querySelector("#collapseNotesButton").style.visibility = "hidden";
        document.querySelector("#expandNotesButton").style.visibility = "visible";
        document.querySelector("#expandedShownNotesArrowOvl").style.visibility = "hidden";
        document.querySelector("#expandedHiddenNotesArrowOvl").style.visibility = "hidden";
    }
    
    function deactivatedNotesExpand() {
        document.querySelector("#collapseNotesButton").style.visibility = "hidden";
        document.querySelector("#expandNotesButton").style.visibility = "hidden";
        document.querySelector("#expandedShownNotesArrowOvl").style.visibility = "hidden";
        document.querySelector("#expandedHiddenNotesArrowOvl").style.visibility = "visible";
    }
    
    function deactivatedNotesCollapse() {
        document.querySelector("#collapseNotesButton").style.visibility = "hidden";
        document.querySelector("#expandNotesButton").style.visibility = "hidden";
        document.querySelector("#expandedShownNotesArrowOvl").style.visibility = "hidden";
        document.querySelector("#expandedHiddenNotesArrowOvl").style.visibility = "hidden";
    }
}