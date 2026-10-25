function CreateTutorialTextWithButtons(input)
  local anchor
  
  if input.offset then
    anchor = Viewport.size.center + input.offset
  else
    anchor = Viewport.size.center
  end
  local text = AR:Text({
    text = "<vc><hc><c4>" .. Autotext:SafeGet(input[1]),
    onScreen = Rect:LTWH(0, 0, 370, 0):Align(anchor, "center", "center"),
    useAutotext = false,
    z = 2
  })
  local ovls = input[2]
  local pictures = {}
  local picHeight = 0
  if type(ovls) == "table" then
    local function GetX(index, padding)
      local prevWidths = 0
      
      for i = 1, index - 1 do
        prevWidths = prevWidths + input.source[i].width
      end
      return text.onScreen.left + prevWidths + index * padding + input.source[index].width / 2
    end
    
    local totalWidth = 0
    for _, rect in ipairs(input.source) do
      totalWidth = totalWidth + rect.width
      if picHeight < rect.height then
        picHeight = rect.height
      end
    end
    local leftOvers = 370 - totalWidth
    local padding = leftOvers / (#ovls + 1)
    for i, _ in ipairs(ovls) do
      local onScreen = input.source[i]:Align(Point:New(GetX(i, padding), text.bounds.bottom + 10 + input.source[i].height / 2), "center", "center")
      pictures[i] = onScreen
    end
  else
    pictures[1] = input.source:Align(Point:New(text.onScreen.center.x, text.bounds.bottom + input.source.height / 2), "center", "center")
    picHeight = input.source.height
  end
  local topOvl = AR:Overlay({
    ovl = "TUT_TextBox_OVL",
    source = Rect:New(2, 2, 408, 41),
    onScreen = Rect:New(2, 2, 408, 41):Align(Point:New(text.onScreen.left - 15, text.onScreen.top - 30), "left", "top")
  })
  local contentBottom = math.max(text.bounds.height + text.onScreen.top + 10 + picHeight, topOvl.onScreen.bottom)
  local bottomOvl = AR:Overlay({
    ovl = "TUT_TextBox_OVL",
    source = Rect:New(2, 66, 408, 108),
    onScreen = Rect:LTWH(topOvl.onScreen.left, contentBottom, 406, 42)
  })
  local middleOvl = AR:Overlay({
    ovl = "TUT_TextBox_OVL",
    source = Rect:New(2, 44, 408, 63),
    onScreen = Rect:New(2, 44, 408, 63):Align(Point.origin, "left", "top")
  })
  local diff = bottomOvl.onScreen.top - topOvl.onScreen.bottom + 2
  middleOvl.animator[1].s:Set(1, diff / middleOvl.source.height)
  middleOvl.animator[1].t:Set(topOvl.onScreen.left, topOvl.onScreen.bottom - 1)
  if input.z then
    text.z = input.z + 0.5
  end
  return pictures
end
