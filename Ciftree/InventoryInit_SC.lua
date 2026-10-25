-- Midnight in Salem: the engine's InventoryInit_SC (decompiled SEA data) + MID items.
invTable = {}
local invDefaults = {
  equipPoint = "hand",
  isViewable = false,
  ovl = "White_OVL",
  reg = Rect:New(0, 0, 50, 50),
  highlight = Rect:New(0, 0, 50, 50),
  activePt = Point:New(40, 40)
}
local invOvl = {
  ovl = "UI_Inventory_OVL",
  origin = Point:New(2, 2),
  tileSize = Point:New(50, 50),
  tileSpacing = Point:New(104, 52),
  highlightOffset = Point:New(52, 0),
  xLength = 5
}

local function AddInv(name, item)
  for k, v in pairs(invDefaults) do
    if item[k] == nil then
      item[k] = v
    end
  end
  invTable[name] = item
end

local function AddPlaceholderInv(items)
  for _, item in ipairs(items) do
    function item.text()
      return "<vc><hc><f2><c4><b>" .. item[2]
    end
    
    AddInv(item[1], item)
  end
end

local function AddRegularInv(items)
  for idx, item in ipairs(items) do
    if item[1] ~= nil then
      local zeroBaseIdx = idx - 1
      local y = math.floor(zeroBaseIdx / invOvl.xLength)
      local idx2D = Point:New(zeroBaseIdx - y * invOvl.xLength, y):Rounded()
      item.ovl = invOvl.ovl
      item.reg = Rect:LTWH(invOvl.origin + idx2D * invOvl.tileSpacing, invOvl.tileSize)
      item.highlight = item.reg:Offset(invOvl.highlightOffset)
      AddInv(item[1], item)
    end
  end
end

AddPlaceholderInv({
  {
    "TUT_INV_BOXCUTTER",
    "",
    ovl = "TUT_Inventory_OVL",
    reg = Rect:New(2, 2, 52, 52),
    highlight = Rect:New(54, 2, 104, 52)
  },
  {
    "INV_FLASHLIGHT_DUMMY",
    "",
    ovl = "UI_Inventory_OVL",
    reg = Rect:New(106, 522, 156, 572),
    highlight = Rect:New(158, 522, 208, 572)
  }
})
AddRegularInv({
  {
    "INV_BATTERIES"
  },
  {"INV_BOX_V", isViewable = true},
  {"INV_BUTTON"},
  {
    "INV_CARVING"
  },
  {
    "INV_CHART_V",
    isViewable = true
  },
  {
    "INV_CLUES_V",
    isViewable = true
  },
  {"INV_DISK"},
  {"INV_EGG1"},
  {"INV_EGG2"},
  {"INV_EGG3"},
  {"INV_EGG4"},
  {
    "INV_FLASHLIGHT_BROKEN"
  },
  {},
  {"INV_GAS"},
  {"INV_GEAR"},
  {
    "INV_HISTORY_V",
    isViewable = true
  },
  {"INV_HOOK"},
  {
    "INV_ICELAND_V",
    isViewable = true
  },
  {
    "INV_IMAGES",
    text = function()
      return string.format("<vb><hc><f2><c20><b>%i/10", VarTable.INV_IMAGES_VT)
    end
  },
  {
    "INV_INSTRUCTIONS_V",
    isViewable = true
  },
  {
    "INV_KEY_BONE"
  },
  {
    "INV_KEY_CABIN"
  },
  {
    "INV_KEY_LIGHTHOUSE"
  },
  {
    "INV_KEY_LUGGAGE"
  },
  {
    "INV_KEY_RADIO"
  },
  {
    "INV_KEY_SNOWMOBILE"
  },
  {
    "INV_KNITS_V",
    isViewable = true
  },
  {
    "INV_LOCATOR"
  },
  {
    "INV_LOCATOR1"
  },
  {
    "INV_LOCATOR2"
  },
  {"INV_MAP_V", isViewable = true},
  {
    "INV_NOTES_V",
    isViewable = true
  },
  {},
  {"INV_SHOVEL"},
  {
    "INV_SITES_V",
    isViewable = true
  },
  {},
  {},
  {
    "INV_SKETCH1"
  },
  {
    "INV_SKETCH2"
  },
  {
    "INV_SKETCH3"
  },
  {
    "INV_SKETCH4"
  },
  {
    "INV_SKETCH5"
  },
  {
    "INV_SOUNDING_V",
    isViewable = true
  },
  {
    "INV_SOUVENIRS_V",
    isViewable = true
  },
  {},
  {"INV_TACKS"},
  {
    "INV_TIDAL_V",
    isViewable = true
  },
  {"INV_TOKEN"},
  {
    "INV_TRACE_V",
    isViewable = true
  },
  {"INV_WHEEL"},
  {"INV_WINDER"},
  {
    "INV_FLASHLIGHT",
    equipPoint = "face",
    forceOnFlag = "Flashlight_On_BR"
  },
  {
    "INV_MONEY",
    onlyDisplay = true,
    text = function()
      return string.format("<vc><hc><f2><c20><b>%i", VarTable.UI_MONEY_Count_VT)
    end
  }
})
-- Midnight in Salem items. `inspect` = the scene a right-click on the item
-- opens (UI_Inventory_SC, Temp) — a 3D inspector over the current scene.
AddPlaceholderInv({
  {
    "INV_SPRAYCAN",
    "",
    ovl = "MID_SprayCan_OVL",
    reg = Rect:New(2, 2, 52, 52),
    highlight = Rect:New(54, 2, 104, 52),
    inspect = "INV_SprayCan_I_SC"
  }
})
if InventoryInit ~= nil then
  InventoryInit:Create(invTable)
end
