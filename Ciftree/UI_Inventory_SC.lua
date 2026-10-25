-- Midnight in Salem: the engine's UI_Inventory_SC (decompiled stock, no Temp
-- touch layout) + right-click inspect: an item with `inspect` in
-- InventoryInit_SC opens that scene (the 3D spray can inspector).
Scene:Include("InventoryInit_SC")
local input = {
  inv = {
    area = Rect:New(133, 705, 742, 755),
    messagingName = "InventoryUI"
  },
  slider = {
    ovl = "UI_Frame_OVL",
    knobSource = Rect:New(942, 130, 1015, 146),
    cursor = "MenuHot",
    onScreen = Rect:New(158, 685, 722, 701),
    disabledColor = Color:New(255, 255, 255, 255),
    scrollPixels = 15
  },
  item = {
    size = Point:New(50, 50),
    padding = Point:New(7, 0),
    origin = Point:New(135, 705),
    selectedAlpha = 0.5,
    cursor = "MenuHot",
    flashDuration = 0.7,
    defaultFlashCount = 3
  },
  items = invTable,
  equipPoints = {
    hand = {
      viewableStreamName = "ViewableInv"
    },
    face = {
      unequipFailSound = AR:Sound({
        sounds = {
          "silence_sfx"
        },
        channel = "PlayerVoice",
        active = false
      }),
      messagingName = "SelectedFaceInvItem"
    }
  }
}
Scene:Include("QueryTable_SC")
local invMaster = AR:Transformer({})
if not invMaster:RegisterAlias(input.inv.messagingName) then
  error("Inventory UI could not register its required alias")
end
uiFrame:Attach(invMaster)
local buttons = {}
local equipPoints = QT({})
equipPoints.hand = {changeCount = nil}

function equipPoints.hand.StreamMaintenance()
  local itemInHand = Inventory.inHand
  local viewableStreamIsRunning = Scene:IsStreamRunning(input.equipPoints.hand.viewableStreamName)
  local itemIsInHand = itemInHand ~= ""
  local viewableStreamShouldBeRunning = itemIsInHand and input.items[itemInHand].isViewable
  local sceneViewableStreamShouldBeIn = viewableStreamShouldBeRunning and itemInHand .. "_SC"
  local isFirstRun = math.abs(Scene.time - Scene.elapsedTime) < 1.0E-5
  if viewableStreamIsRunning and not viewableStreamShouldBeRunning then
    invMaster:SendAsAlias(input.inv.messagingName, "ViewedInv", "Close")
  elseif viewableStreamIsRunning and viewableStreamShouldBeRunning and not isFirstRun then
    Scene:Change(input.equipPoints.hand.viewableStreamName, sceneViewableStreamShouldBeIn)
  elseif not viewableStreamIsRunning and viewableStreamShouldBeRunning then
    Scene:BeginStream({
      stream = input.equipPoints.hand.viewableStreamName,
      scene = sceneViewableStreamShouldBeIn,
      inVP = true,
      captureInput = true
    })
  end
end

function equipPoints.hand.UpdateButtons()
  local itemInHand = Inventory.inHand
  for _, button in ipairs(buttons) do
    if button.equipPoint == equipPoints.hand then
      if button.itemName == itemInHand then
        button:Select()
      else
        button:Deselect()
      end
    end
  end
end

function equipPoints.hand.UpdateSelection()
  if equipPoints.hand.changeCount == Inventory.inHandChangeCount then
    return
  end
  equipPoints.hand.changeCount = Inventory.inHandChangeCount
  equipPoints.hand:StreamMaintenance()
  equipPoints.hand:UpdateButtons()
end

function equipPoints.hand.OnClick(_, itemName)
  local specificItem = input.items[itemName]
  if specificItem.onlyDisplay then
    return
  end
  if Inventory.inHand == itemName then
    Inventory.inHand = ""
  else
    Inventory.inHand = itemName
  end
end

local putBackOvr = AR:Override({
  z = -1,
  TryReplace = function(this)
    local isOver = input.inv.area:Contains(TransformedCursorPoint())
    if isOver and Inventory.inHand ~= "" then
      if input.items[Inventory.inHand].isViewable then
        return false
      else
        Inventory.inHand = ""
        return true
      end
    else
      return false
    end
  end
})
putBackOvr.OnLeftDown = putBackOvr.TryReplace
putBackOvr.OnRightDown = putBackOvr.TryReplace
invMaster:Attach(putBackOvr)
-- Right-click on an item with an `inspect` scene (InventoryInit_SC) opens
-- its inspector over the current scene (InspectInv stream) — on touch, the
-- long-press right click. The hovered item is tracked by the buttons'
-- OnMouseOver/OnMouseLeave (right clicks only fan out to Overrides).
local hoveredButton = nil
local inspectOvr = AR:Override({
  z = -1,
  OnRightUp = function(this)
    local button = hoveredButton
    if not button or not button.active or not button.itemName or Inventory.inHand ~= "" then
      return
    end
    local def = input.items[button.itemName]
    if not def or not def.inspect then
      return
    end
    if Scene:IsStreamRunning("InspectInv") then
      Scene:Change("InspectInv", def.inspect)
    else
      Scene:BeginStream({
        stream = "InspectInv",
        scene = def.inspect,
        inVP = true,
        captureInput = true
      })
    end
  end
})
invMaster:Attach(inspectOvr)
equipPoints.face = {changeCount = nil}

function equipPoints.face.UpdateButtons()
  local itemOnFace = Inventory.onFace
  for _, button in ipairs(buttons) do
    if button.equipPoint == equipPoints.face then
      if button.itemName == itemOnFace then
        button:Select()
      else
        button:Deselect()
      end
    end
  end
end

function equipPoints.face.UpdateSelection()
  if equipPoints.face.changeCount == Inventory.onFaceChangeCount then
    return
  end
  equipPoints.face.changeCount = Inventory.onFaceChangeCount
  invMaster:SendAsAlias(input.inv.messagingName, input.equipPoints.face.messagingName, "Hide")
  if Inventory.onFace ~= "" then
    invMaster:SendAsAlias(input.inv.messagingName, Inventory.onFace, "Show")
  end
  equipPoints.face:UpdateButtons()
end

function equipPoints.face.OnClick(_, itemName)
  if Inventory.onFace == itemName then
    Inventory.onFace = ""
    if Inventory.onFace == itemName then
      input.equipPoints.face.unequipFailSound:Restart()
    end
  else
    Inventory.onFace = itemName
  end
end

local slider = AR:Slider({
  z = 1,
  scrollArea = input.inv.area,
  knobArea = input.slider.onScreen,
  hs = AR:Hotspot({
    cursor = input.slider.cursor,
    onScreen = input.slider.onScreen
  }),
  knobOvl = AR:Overlay({
    ovl = input.slider.ovl,
    source = input.slider.knobSource,
    onScreen = Rect.empty
  }),
  disabledColor = input.slider.disabledColor
})
invMaster:Attach(slider)
local itemOrigin = AR:Transformer({
  localTransform = Matrix:Translate(input.item.origin.x, input.item.origin.y),
  clip = Rect:LTWH(0, 0, input.inv.area.width, input.inv.area.height)
})
invMaster:Attach(itemOrigin)
local itemPanel = AR:Transformer({
  size = Point.origin
})
itemPanel.animator[1].t = Point.origin
itemOrigin:Attach(itemPanel)

local function OvlForItem(itemName)
  return input.items[itemName].ovl
end

local function SourceForItem(itemName, sourceType)
  return input.items[itemName][sourceType]
end

local function TextForItem(itemName)
  if input.items[itemName] and type(input.items[itemName].text) == "function" then
    return input.items[itemName].text()
  else
    return ""
  end
end

local function GetButtonForItem(itemName)
  for _, button in ipairs(buttons) do
    if button.localVisible and button.itemName == itemName then
      return button
    end
  end
end

local function CreateIfNecessary()
  local current = Inventory.current
  if #buttons >= #current then
    return
  end
  local start = #buttons == 0 and Point.origin or buttons[#buttons].hs.onScreen.rightTop + input.item.padding
  for i = 1, #current - #buttons do
    local itemDest = Rect:LTWH(start.x, start.y, input.item.size.x, input.item.size.y)
    local itemHighlightOvl = AR:Overlay({
      ovl = DefaultOVL(),
      source = Rect.empty,
      onScreen = itemDest
    })
    local button = AR:Button({
      active = false,
      hs = AR:Hotspot({
        onScreen = itemDest,
        cursor = input.item.cursor
      }),
      upOvl = AR:Overlay({
        ovl = DefaultOVL(),
        source = Rect.empty,
        onScreen = itemDest
      }),
      overOvl = itemHighlightOvl,
      downOvl = itemHighlightOvl,
      text = AR:Text({
        text = "",
        useAutotext = false,
        onScreen = itemDest
      })
    })
    
    function button.OnUp()
      button.equipPoint:OnClick(button.itemName)
    end

    -- Hover edges arrive on the Button node itself (engine hovButton).
    local baseOver, baseLeave = button.OnMouseOver, button.OnMouseLeave
    function button.OnMouseOver(this, ...)
      hoveredButton = button
      if baseOver then return baseOver(this, ...) end
    end
    function button.OnMouseLeave(this, ...)
      if hoveredButton == button then hoveredButton = nil end
      if baseLeave then return baseLeave(this, ...) end
    end
    
    function button.Select()
      if not button.localVisible then
        return
      end
      button.hs.tooltip = nil
      button.upOvl.localAlpha = input.item.selectedAlpha
      button.overOvl.localAlpha = input.item.selectedAlpha
    end
    
    function button.Deselect()
      if not button.localVisible then
        return
      end
      button.hs.tooltip = button.itemName
      button.upOvl.localAlpha = 1
      button.overOvl.localAlpha = 1
    end
    
    itemPanel:Attach(button)
    table.insert(buttons, button)
    start.x = start.x + input.item.size.x + input.item.padding.x
  end
end

local function UpdateButtons()
  itemPanel.size = Point.origin
  local current = Inventory.current
  for i = 1, #current do
    buttons[i].active = true
    buttons[i].itemName = current[i]
    buttons[i].hs.tooltip = current[i]
    buttons[i].upOvl.ovl = OvlForItem(current[i])
    buttons[i].overOvl.ovl = OvlForItem(current[i])
    buttons[i].overOvl.source = SourceForItem(current[i], "highlight")
    buttons[i].upOvl.source = SourceForItem(current[i], "reg")
    buttons[i].text.text = TextForItem(current[i])
    buttons[i].equipPoint = equipPoints[Inventory:EquipPoint(current[i])]
    itemPanel.size = buttons[i].hs.onScreen.rightBottom
  end
  for i = #current + 1, #buttons do
    buttons[i].active = false
    buttons[i].equipPoint = nil
  end
end

local function UpdateSlider()
  local overrun = math.max(0, itemPanel.size.x - input.inv.area.width)
  
  local function OnKnobMoved()
    itemPanel.animator[1].t = Point:New(-math.round(slider.percent.x * overrun), 0)
  end
  
  slider.localEnabled = 0 < overrun
  slider.OnKnobMoved = nil
  slider.knobPos = overrun == 0 and Point.origin or slider.knobMax
  slider.OnKnobMoved = OnKnobMoved
  OnKnobMoved()
  if slider.localEnabled then
    local scrollSections = overrun / input.slider.scrollPixels
    slider.scrollAmount = Point:New(slider.knobMax.x / scrollSections, 0)
  end
end

local function UpdateFlashFor(itemName, startTime)
  local button = GetButtonForItem(itemName)
  if not button then
    return
  end
  local elapsed = Scene.time - startTime
  local flashCount = elapsed / input.item.flashDuration
  local isFlashing = math.floor(flashCount * 2) % 2 == 0
  if isFlashing then
    button.upOvl.source = SourceForItem(button.itemName, "highlight")
  else
    button.upOvl.source = SourceForItem(button.itemName, "reg")
  end
end

local function ClearFlashFor(itemName)
  local button = GetButtonForItem(itemName)
  if not button then
    return
  end
  button.upOvl.source = SourceForItem(button.itemName, "reg")
end

local updater = AR:Override({
  currentChangeCount = nil,
  flashers = {},
  Run = function(this)
    this:UpdateCurrent()
    this:UpdateEnableds()
    this:UpdateSelections()
    this:UpdateFlashers()
    this:UpdateTexts()
  end,
  UpdateCurrent = function(this)
    if this.currentChangeCount == Inventory.currentChangeCount then
      return
    end
    this.currentChangeCount = Inventory.currentChangeCount
    CreateIfNecessary()
    UpdateButtons()
    equipPoints:ForEach("v:UpdateButtons()")
    UpdateSlider()
  end,
  UpdateEnableds = function()
    for _, button in ipairs(buttons) do
      if button.localVisible then
        button.localEnabled = Inventory:IsEnabled(button.itemName)
      end
    end
  end,
  UpdateSelections = function(this)
    equipPoints:ForEach("v:UpdateSelection()")
  end,
  UpdateFlashers = function(this)
    for itemName, flashData in pairs(this.flashers) do
      if Scene.time >= flashData.start + flashData.times * input.item.flashDuration then
        ClearFlashFor(itemName)
        this.flashers[itemName] = nil
      else
        UpdateFlashFor(itemName, flashData.start)
      end
    end
  end,
  UpdateTexts = function(this)
    for _, button in ipairs(buttons) do
      local newText = TextForItem(button.itemName)
      if newText ~= button.text.text then
        button.text.text = newText
      end
    end
  end
})
invMaster:Attach(updater)

function invMaster.Receive(this, sender, action, xarg1, xarg2)
  if string.comparenocase(action, "Flash") then
    if type(xarg1) ~= "string" then
      return
    end
    if type(xarg2) ~= "number" then
      xarg2 = input.item.defaultFlashCount
    end
    xarg1 = string.upper(xarg1)
    updater.flashers[xarg1] = {
      start = Scene.time,
      times = xarg2
    }
  end
end
