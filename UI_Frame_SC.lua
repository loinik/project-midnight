frameBaseOVL = AR:Overlay({
  ovl = "UI_Frame_OVL",
  source = Rect:New(2, 2, 1026, 128),
  onScreen = Rect:New(0, 642, 1024, 768),
  z = -2
})
ccPaneOVL = AR:Overlay({
  ovl = "UI_Frame_OVL",
  source = Rect:New(2, 130, 684, 173),
  onScreen = Rect:New(102, 650, 784, 693),
  z = -5
})
menuMag_Button = AR:Button({
  hs = AR:Hotspot({
    onScreen = Rect:New(0, 669, 42, 755),
    cursor = "MenuHot"
  }),
  overOvl = AR:Overlay({
    ovl = "UI_Frame_OVL",
    source = Rect:New(596, 345, 633, 422),
    onScreen = Rect:New(0, 673, 37, 750)
  }),
  OnUp = function(this)
    this:Send("UIFrame", "Disable")
    Scene:BeginStream({
      stream = "MainMenuPopup",
      scene = "UI_Menu_SC",
      captureInput = true,
      inVP = false,
      save = false
    })
  end
})
menuKeyOpener = AR:Override({
  OnKeyDown = function(this, key)
    if key == Key.esc then
      menuMag_Button:OnUp()
      return true
    end
  end
})
menuFlashOVL = AR:Overlay({
  ovl = "UI_Frame_OVL",
  source = Rect:New(596, 345, 633, 422),
  onScreen = Rect:New(0, 673, 37, 750),
  z = 1,
  active = false
})
menuFlashAnim = AR:Override({
  active = false,
  alias = "MenuButton",
  durations = {loop = 0.5, full = 2},
  alphas = {on = 1, off = 0},
  RunOnce = function(this)
    menuFlashOVL.active = true
    this.elapsed = 0
  end,
  Run = function(this)
    menuFlashOVL.localAlpha = math.sinlerp2(this.alphas.off, this.alphas.on, this.elapsed / this.durations.loop)
    this.elapsed = this.elapsed + Scene.elapsedTime
    if this.elapsed >= this.durations.full then
      this:Done()
    end
  end,
  Receive = function(this, sender, action)
    if action == "Flash" then
      this:Restart()
    end
  end,
  OnDone = function(this)
    menuFlashOVL.active = false
  end
})
if not menuFlashAnim:RegisterAlias(menuFlashAnim.alias) then
  error(string.format("Could not register expected alias %s", Stringify(menuFlashAnim.alias)))
end
awardMenuOVL = AR:Overlay({
  ovl = "UI_Frame_OVL",
  source = Rect:New(596, 424, 633, 501),
  onScreen = Rect:New(0, 673, 37, 750),
  z = 1,
  active = false
})
awardFlashOVL = AR:Overlay({
  ovl = "UI_Frame_OVL",
  source = Rect:New(596, 503, 633, 580),
  onScreen = Rect:New(0, 673, 37, 750),
  z = 2,
  active = false
})
awardFlashSFX = AR:Sound({
  sounds = {
    "Cafe_Bell_SFX"
  },
  channel = "UIFX",
  volume = 0.85,
  active = false
})
awardFlashAnim = AR:Override({
  active = false,
  alias = "AwardMenuButton",
  durations = {loop = 1.2, full = 2.4},
  alphas = {on = 1, off = 0},
  RunOnce = function(this)
    awardMenuOVL.active = true
    awardFlashOVL.active = true
    this.elapsed = 0
  end,
  Run = function(this)
    awardFlashOVL.localAlpha = math.sinlerp2(this.alphas.off, this.alphas.on, this.elapsed / this.durations.loop)
    this.elapsed = this.elapsed + Scene.elapsedTime
    if this.elapsed >= this.durations.full then
      this:Done()
    end
  end,
  Receive = function(this, sender, action)
    if action == "Flash" then
      this:Restart()
    end
  end,
  OnDone = function(this)
    awardMenuOVL.active = false
    awardFlashOVL.active = false
  end
})
if not awardFlashAnim:RegisterAlias(awardFlashAnim.alias) then
  error(string.format("Could not register expected alias %s", Stringify(awardFlashAnim.alias)))
end
quitOvr = AR:Override({
  OnExitRequest = function()
    if Scene:IsStreamRunning("MainMenuPopup") then
      Scene:Change("MainMenuPopup", "UI_ToExit1_SC")
    else
      Scene:BeginStream({
        scene = "UI_ToExit1_SC",
        stream = "MainMenuPopup",
        captureInput = true,
        inVP = false,
        save = false
      })
    end
  end
})
uiFrame:Attach(frameBaseOVL, ccPaneOVL, menuMag_Button, menuKeyOpener, menuFlashOVL, menuFlashAnim, quitOvr)
