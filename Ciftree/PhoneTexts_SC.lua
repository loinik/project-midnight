-- Midnight in Salem: SEA's Messages app (PhoneTexts_SC, decompiled) on the MID Contacts
-- sheet; Carson's texts come from Texts_SC.
summary = AR:Summary({bg = "", env = ""})
Scene:Include("PhoneTextsLogic_SC")
Scene:Include("PhoneGlobals_Vert_SC")
MakePhoneFrame()
MakeAppBackground()
MakeMainPhotoButton({
  OnDone = function()
    Scene:Change("PhonePhotoTake_SC")
  end
})
MakeMainHomeButton({
  OnDone = function()
    Scene:Change("PhoneMainMenu_SC")
  end
})
MakeMainBackButton({
  OnDone = function()
    Scene:Change("PhoneMainMenu_SC")
  end
})
MakeBackout({
  OnDone = function()
    Scene:EndStream(Scene.streamName)
    summary:Send("CellButton", "AnimateDown")
  end
})
MakeWallpaper()
MakeStatusBar("messages")
MakeCharms()
contacts = TextManager:ContactList()
emptyOvl = AR:Overlay({
  ovl = "UI_CellTextVert_OVL",
  source = Rect:New(395, 214, 559, 250),
  onScreen = Rect:New(424, 246, 588, 282),
  active = next(contacts) == nil
})
do
  local text = AR:Text({
    text = "<f3><c4>FF all text timers",
    useAutotext = false,
    onScreen = Rect:LTWH(850, 200, 100, 0)
  })
  local bg = AR:Override({
    Render = function(this)
      this:DrawRect(text.bounds:Expand(2), Color:New(127, 255, 255, 255))
    end,
    z = -1
  })
  local hs = AR:Hotspot({
    onScreen = text.bounds:Expand(2),
    cursor = "Menu",
    OnDone = function(this)
      this:Restart()
      TextManager:FastForward()
    end
  })
  text.active = Game.cheatMode
  bg.active = Game.cheatMode
  hs.active = Game.cheatMode
end
local puzzle = MakePhoneContacts({
  alert = {
    ovl = "UI_CellTextVert_OVL",
    source = Rect:New(370, 214, 393, 237)
  },
  cursors = {click = "MenuHot"},
  -- MID: a contact's whole Contacts-sheet row (thumbnail + name plate) is its list entry,
  -- so the backing and the separate name piece are blank.
  contactBacking = {
    ovl = "UI_Phone_OVL",
    source = Rect:New(360, 0, 380, 20)
  },
  contacts = {
    PCD = {
      ovl = "UI_PhoneContacts_OVL",
      thumbnailSource = Rect:New(235, 64, 545, 124),
      nameSource = Rect:New(360, 0, 361, 1)
    },
    PNN = {
      ovl = "UI_PhoneContacts_OVL",
      thumbnailSource = Rect:New(235, 2, 545, 62),
      nameSource = Rect:New(360, 0, 361, 1)
    },
    default = {
      ovl = "UI_PhoneContacts_OVL",
      thumbnailSource = Rect:New(235, 2, 295, 62),
      prefix = "<f4><c4>"
    }
  },
  order = contacts,
  layout = {
    leftTop = Point:New(350, 28), -- MID phone screen x 336-686, y 20-616
    thumbnailOffset = Point.origin,
    nameOffset = Point:New(414, 78) - Point:New(349, 78),
    alertOffset = Point:New(399, 123) - Point:New(349, 78),
    contactSize = Point:New(330, 63),
    buffer = 10,
    size = Point:New(336, 580)
  },
  slider = AR:Slider({
    z = 5,
    hs = AR:Hotspot({
      cursor = "MenuHot",
      onScreen = Rect:New(670, 20, 690, 616)
    }),
    knobOvl = AR:Overlay({
      -- a translucent white knob, drawn over the bubbles (they run the full screen width)
      ovl = "UI_PhoneScroll_OVL",
      source = Rect:New(0, 0, 8, 113)
    }),
    knobArea = Rect:New(676, 24, 684, 612),
    scrollArea = Rect:LTWH(336, 20, 350, 596),
    scrollPixels = 15
  })
})
AR:Override({
  RunOnce = function(this)
    this.cc = TextManager:ChangeCount()
  end,
  Run = function(this)
    if this.cc ~= TextManager:ChangeCount() then
      Scene:Change(Scene.name)
    end
  end
})
contactSFX = AR:Sound({
  sounds = {
    "Beep_Single01_SFX"
  },
  channel = "EngineFX",
  volume = 0.5,
  active = false
})
AR:Timer({
  duration = 0.1,
  RunOnce = function()
    StrTable.UI_PhoneTextContact_ST = puzzle.chosenContact
    contactSFX:Restart()
  end,
  OnDone = function()
    Scene:Change("PhoneTextsDetails_SC")
  end,
  active = function()
    return puzzle.chosenContact ~= nil
  end
})
