-- Midnight in Salem: SEA's PhoneTextsDetailsLogic_SC (decompiled); the thread opens
-- scrolled to the newest message.
Scene:Include("List_SC")
Scene:Include("Recycler_SC")
Scene:Include("Window_SC")
Scene:Include("TopDownLayout_SC")

function MakePhoneMessages(input)
  local _sampleText = AR:Text({
    text = "",
    useAutotext = false,
    onScreen = Rect:LTWH(0, 0, input.layout.textWidth, 0),
    active = false
  })
  local _master = AR:Transformer({})
  local _recycler = MakeRecycler({})
  local _layout = MakeTopDownLayout({})
  local _window = MakeWindow({
    location = input.layout.leftTop,
    size = input.layout.size,
    parent = _master,
    layout = _layout,
    recycler = _recycler,
    vertSlider = input.slider
  })
  
  local function _TextHeight(text)
    _sampleText.text = text
    return _sampleText.bounds.height
  end
  
  local function _InsertPadding(items, type)
    if #items == 0 then
      return
    end
    local item = items[#items]
    item.size.y = item.size.y + input.layout.buffers[type]
  end
  
  local function _InsertText(items, text)
    local tag = "PC:"
    local isPC = string.sub(text, 1, #tag) == tag
    if isPC then
      text = string.sub(text, #tag + 1, -1)
    end
    text = input.textPreamble .. text
    local offset = isPC and input.layout.PC.textOffset or input.layout.NPC.textOffset
    table.insert(items, {
      type = "Text",
      params = {
        isPC,
        offset,
        text
      },
      size = Point:New(input.layout.textWidth, math.max(input.layout.lineMinHeight, _TextHeight(text) + offset.y))
    })
  end
  
  local function _InsertSequence(sortedItems, sequence)
    _InsertPadding(sortedItems, "sequence")
    local fullTexts = List({})
    while true do
      local fullText = Autotext[sequence .. string.format("_%02i", fullTexts.count + 1)]
      if fullText then
        fullTexts:Append(fullText)
      else
        break
      end
    end
    if fullTexts.count == 0 then
      fullTexts:Append("Missing autotext for sequence \"" .. sequence .. "\"")
    end
    _InsertText(sortedItems, fullTexts[1])
    for idx in RangeView(2, fullTexts.count):Iter(0) do
      _InsertPadding(sortedItems, "line")
      _InsertText(sortedItems, fullTexts[idx])
    end
  end
  
  local _touch = AR:Override({
    v = Point.origin
  })
  
  function _touch.Up()
    _touch.down = false
  end
  
  function _touch.Move()
    local newDownPt = TransformedCursorPoint()
    local diff = newDownPt - _touch.downPt
    if diff.len ~= 0 then
      _window:Scroll(diff)
      _touch.downPt = newDownPt
      _touch.v = math.lerp(_touch.v, diff / Scene.elapsedTime, 0.5)
    end
  end
  
  function _touch.Slide()
    _touch.v = _touch.v * 0.7
    _touch.slide = _touch.v.len > 1
    if _touch.slide then
      _window:Scroll(_touch.v * Scene.elapsedTime)
    end
  end
  
  function _touch.Fade()
    if _touch.down or _touch.slide then
      input.slider.localAlpha = math.min(input.slider.localAlpha + 2 * Scene.elapsedTime, 1)
    else
      input.slider.localAlpha = math.max(input.slider.localAlpha - 2 * Scene.elapsedTime, 0)
    end
  end
  
  function _touch.Down()
    _touch.down = true
    _touch.downPt = TransformedCursorPoint()
    _touch.v = Point.origin
  end
  
  function _touch.OnMouseMove()
    _touch.mouseMoved = true
  end
  
  function _touch.ChangeCursor()
    if _touch.down then
      return input.touchscreen.downCursor
    elseif _touch.over then
      return input.touchscreen.startCursor
    end
  end
  
  function _touch.OnLeftDown()
    if _touch.over then
      _touch:Down()
    end
  end
  
  _touch.OnLeftUp = _touch.Up
  
  function _touch.OnMouseScroll(_, delta)
    if _touch.over and not _touch.down then
      _touch.v = Point:New(0, delta * -1500)
    end
  end
  
  function _touch.Run()
    local canHaveFocus = _touch.mouseMoved
    _touch.mouseMoved = false
    if not canHaveFocus or not input.slider.enabled then
      _touch:Up()
    else
      _touch.over = input.touchscreen.area:Contains(TransformedCursorPoint())
      if _touch.down then
        _touch:Move()
      else
        _touch:Slide()
      end
    end
    _touch:Fade()
  end
  
  _recycler:DefineType({
    name = "Text",
    Generate = function()
      local anchor = AR:Transformer({
        skipClean = true,
        bubbleTop = AR:Overlay({
          ovl = DefaultOVL()
        }),
        bubbleMiddle = AR:Overlay({
          ovl = DefaultOVL(),
          z = -0.1
        }),
        bubbleBottom = AR:Overlay({
          ovl = DefaultOVL()
        }),
        thumbnail = AR:Overlay({
          ovl = DefaultOVL()
        }),
        text = AR:Text({
          text = "",
          useAutotext = false,
          onScreen = Rect:LTWH(0, 0, input.layout.textWidth, 0)
        })
      })
      anchor:Attach(anchor.bubbleTop, anchor.bubbleMiddle, anchor.bubbleBottom, anchor.thumbnail, anchor.text)
      return anchor
    end,
    Skin = function(ar, order, isPC, offset, text)
      ar.text.onScreen = Rect:LTWH(offset, Point:New(input.layout.textWidth, 0))
      ar.text.text = text
      local thumbnailOffset = isPC and input.layout.PC.thumbnailOffset or input.layout.NPC.thumbnailOffset
      local thumbnailInput = isPC and input.thumbnails.PC or input.thumbnails.NPC
      ar.thumbnail.ovl = thumbnailInput.ovl
      ar.thumbnail.source = thumbnailInput.source
      ar.thumbnail.onScreen = thumbnailInput.source:Align(thumbnailOffset, "left", "top")
      local bubbleOffset = isPC and input.layout.PC.bubbleOffset or input.layout.NPC.bubbleOffset
      local topInput = isPC and input.bubbles.PC.top or input.bubbles.NPC.top
      ar.bubbleTop.ovl = topInput.ovl
      ar.bubbleTop.source = topInput.source
      ar.bubbleTop.onScreen = topInput.source:Align(bubbleOffset, "left", "top")
      local contentBottom = math.max(ar.text.bounds.height + ar.text.onScreen.top, ar.bubbleTop.onScreen.bottom)
      local bottomInput = isPC and input.bubbles.PC.bottom or input.bubbles.NPC.bottom
      ar.bubbleBottom.ovl = bottomInput.ovl
      ar.bubbleBottom.source = bottomInput.source
      ar.bubbleBottom.onScreen = Rect:LTWH(ar.bubbleTop.onScreen.left, contentBottom, bottomInput.source.width, bottomInput.source.height)
      local middleInput = isPC and input.bubbles.PC.middle or input.bubbles.NPC.middle
      ar.bubbleMiddle.ovl = middleInput.ovl
      ar.bubbleMiddle.source = middleInput.source
      ar.bubbleMiddle.onScreen = middleInput.source:Align(Point.origin, "left", "top")
      local diff = ar.bubbleBottom.onScreen.top - ar.bubbleTop.onScreen.bottom + 2
      ar.bubbleMiddle.animator[1].s:Set(1, diff / ar.bubbleMiddle.source.height)
      ar.bubbleMiddle.animator[1].t:Set(ar.bubbleTop.onScreen.left, ar.bubbleTop.onScreen.bottom - 1)
    end,
    Recycle = function(ar)
    end
  })
  local sortedItems = {}
  for _, sequence in ipairs(input.sequences) do
    _InsertSequence(sortedItems, sequence)
  end
  _InsertPadding(sortedItems, "line")
  _layout:Rebuild(sortedItems)
  _window:Update()
  -- MID: a thread opens at its newest message, like a real phone
  _window:ScrollToEnd()
  _window:HideSlider()
end
