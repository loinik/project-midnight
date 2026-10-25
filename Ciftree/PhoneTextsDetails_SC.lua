-- Midnight in Salem: SEA's message thread (PhoneTextsDetails_SC, decompiled) with the
-- bubble template on UI_Phone_OVL (same slices as SEA's UI_CellTextVert_OVL).
summary = AR:Summary({bg = "", env = ""})
Scene:Include("PhoneGlobals_Vert_SC") -- MID: the vertical phone (PhoneGlobals_SC is absent)
Scene:Include("PhoneTextsDetailsLogic_SC")
MakePhoneFrame()
MakeAppBackground()
MakeWallpaper()
MakeStatusBar("messages")
MakeCharms()
if not Flags.InForcedText_FL then
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
      Scene:Change("PhoneTexts_SC")
    end
  })
  MakeBackout({
    OnDone = function()
      Scene:EndStream(Scene.streamName)
      summary:Send("CellButton", "AnimateDown")
    end
  })
end
-- Avatars from the Contacts sheet's thumbnail column (Nancy's silhouette = MID
-- nancy_portrait), 50x50, centred in the template's 54x54 placeholder squares.
contacts = {
  PNN = {ovl = "UI_PhoneContacts_OVL", source = Rect:New(547, 2, 597, 52)},
  PCD = {ovl = "UI_PhoneContacts_OVL", source = Rect:New(547, 64, 597, 114)},
  default = {ovl = "UI_PhoneContacts_OVL", source = Rect:New(547, 188, 597, 238)}
}
local puzzle = MakePhoneMessages({
  sequences = TextManager:MessageList(StrTable.UI_PhoneTextContact_ST),
  textPreamble = "<f20><c4>",
  layout = {
    -- the MID phone screen: x 336-686 under the status bar (y 20) down to the buttons (616);
    -- SEA's numbers were the DED-era phone's
    leftTop = Point:New(336, 28),
    buffers = {line = 25, sequence = 60},
    size = Point:New(350, 580),
    textWidth = 230,
    lineMinHeight = 72,
    -- Nancy on the right (the template's lower bubble, avatar slot at the right), the
    -- contact on the left (upper bubble, avatar slot at the left), like a real phone.
    PC = {
      textOffset = Point:New(42, 15), -- bubble from x+28, avatar slot (292,2)-(346,56)
      bubbleOffset = Point.origin,
      thumbnailOffset = Point:New(294, 4)
    },
    NPC = {
      textOffset = Point:New(66, 15), -- bubble from x+8, avatar slot (4,2)-(58,56)
      bubbleOffset = Point.origin,
      thumbnailOffset = Point:New(6, 4)
    }
  },
  thumbnails = {
    PC = contacts.default,
    NPC = contacts[StrTable.UI_PhoneTextContact_ST] or contacts.default
  },
  bubbles = {
    PC = {
      top = {
        ovl = "UI_Phone_OVL",
        source = Rect:New(354, 449, 704, 507)
      },
      middle = {
        ovl = "UI_Phone_OVL",
        source = Rect:New(354, 509, 704, 516)
      },
      bottom = {
        ovl = "UI_Phone_OVL",
        source = Rect:New(354, 518, 704, 531)
      }
    },
    NPC = {
      top = {
        ovl = "UI_Phone_OVL",
        source = Rect:New(354, 365, 704, 423)
      },
      middle = {
        ovl = "UI_Phone_OVL",
        source = Rect:New(354, 425, 704, 432)
      },
      bottom = {
        ovl = "UI_Phone_OVL",
        source = Rect:New(354, 434, 704, 447)
      }
    }
  },
  touchscreen = {
    startCursor = "Manipulate",
    downCursor = "Grab",
    area = Rect:LTWH(336, 24, 350, 588)
  },
  slider = AR:Slider({
    z = 5,
    hs = AR:Hotspot({
      onScreen = Rect:New(-2, -2, -1, -1)
    }),
    knobOvl = AR:Overlay({
      -- a translucent white knob, drawn over the bubbles (they run the full screen width)
      ovl = "UI_PhoneScroll_OVL",
      source = Rect:New(0, 0, 8, 113)
    }),
    knobArea = Rect:New(676, 24, 684, 612),
    scrollPixels = 30
  })
})
AR:Override({
  RunOnce = function(this)
    this.cc = TextManager:ChangeCount(StrTable.UI_PhoneTextContact_ST)
    TextManager:MarkAsRead(StrTable.UI_PhoneTextContact_ST)
  end,
  Run = function(this)
    if this.cc ~= TextManager:ChangeCount(StrTable.UI_PhoneTextContact_ST) then
      Scene:Change(Scene.name)
    end
  end
})
