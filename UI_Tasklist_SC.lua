tasklistMaster = AR:Transformer({active = false})
if not tasklistMaster:RegisterAlias("TasklistUI") then
  error("Tasklist UI could not register its required alias")
end
local input = {}
input.clip = {
  origin = Point:New(776, 282),
  size = {
    expanded = Point:New(212, 439),
    collapsed = Point:New(212, 72)
  }
}
input.slider = AR:Slider({
  scrollPixels = 15,
  scrollArea = Rect:New(776, 282, 988, 756),
  hs = AR:Hotspot({
    cursor = "MenuHot",
    onScreen = Rect:New(996, 297, 1004, 746)
  }),
  knobOvl = AR:Overlay({
    ovl = "UI_Frame_OVL",
    source = Rect:New(972, 202, 980, 396),
    onScreen = Rect.empty
  }),
  baseOvl = AR:Overlay({
    ovl = "UI_Frame_OVL",
    source = Rect:New(962, 202, 970, 651),
    onScreen = Rect:New(996, 297, 1004, 746)
  })
})
input.text = {
  width = 174,
  xOffset = 18,
  padding = 9,
  preamble = "<f14><c4>"
}
input.check = {
  yOffset = 2,
  selectedAlpha = 0.5,
  unselectedAlpha = 1,
  hs = {
    cursor = "MenuHot",
    onScreen = Rect.empty
  },
  baseOvl = {
    ovl = "UI_Frame_OVL",
    source = Rect:New(996, 148, 1011, 163),
    onScreen = Rect.empty
  },
  overOvl = {
    ovl = "UI_Frame_OVL",
    source = Rect:New(996, 165, 1011, 180),
    onScreen = Rect.empty,
    localAlpha = 0.33
  },
  downOvl = {
    ovl = "UI_Frame_OVL",
    source = Rect:New(996, 165, 1011, 180),
    onScreen = Rect.empty,
    localAlpha = 0.66
  },
  selectedOvl = {
    ovl = "UI_Frame_OVL",
    source = Rect:New(996, 165, 1011, 180),
    onScreen = Rect.empty
  }
}
input.button = {
  hs = {
    cursor = "MenuHot",
    onScreen = Rect:LTWH(194, 2, 20, 18)
  },
  ovl = {
    ovl = "UI_Frame_OVL",
    source = Rect:New(777, 467, 795, 485),
    onScreen = Rect:LTWH(194, 2, 18, 18),
    localAlpha = 0.33
  },
  overOvl = {
    ovl = "UI_Frame_OVL",
    source = Rect:New(777, 467, 795, 485),
    onScreen = Rect:LTWH(194, 2, 18, 18),
    localAlpha = 0.66
  },
  alphas = {
    collapsed = {
      up = 0.33,
      over = 0.66,
      down = 0.83
    },
    expanded = {
      up = 1,
      over = 0.66,
      down = 0.5
    }
  }
}
input.canCompleteSound = AR:Sound({
  sounds = {
    "Yes_Task1_SFX",
    "Yes_Task2_SFX",
    "Yes_Task3_SFX"
  },
  volume = 0.75,
  channel = "UIVoice",
  active = false
})
input.cantCompleteSound = AR:Sound({
  sounds = {
    "No_Task1_SFX",
    "No_Task2_SFX",
    "No_Task3_SFX"
  },
  volume = 0.75,
  channel = "UIVoice",
  active = false
})
Scene:Include("Recycler_SC")
Scene:Include("Window_SC")
Scene:Include("TopDownLayout_SC")
Scene:Include("UI_Hints_SC")
local _updater = AR:Override({})
local _sampleText = AR:Text({
  text = "",
  onScreen = Rect:LTWH(0, 0, input.text.width, 1),
  useAutotext = false,
  active = false
})
local _recycler = MakeRecycler({})
local _layout = MakeTopDownLayout({})
local _window = MakeWindow({
  location = input.clip.origin,
  size = input.clip.size.collapsed,
  parent = tasklistMaster,
  layout = _layout,
  recycler = _recycler,
  vertSlider = input.slider
})
local _hints = MakeHintsUI({
  recycler = _recycler,
  window = _window,
  parent = tasklistMaster
})
local _justCompleted
local _cachedTextHeights = {}
local _visibleTasks = {}
local function _GetAutotext(ref)
  return input.text.preamble .. (Autotext[ref] or string.format("Missing autotext for %s", Stringify(ref)))
end
local function _GetTaskHeight(taskID)
  if not _cachedTextHeights[taskID] then
    _sampleText.text = _GetAutotext(taskID)
    _cachedTextHeights[taskID] = _sampleText.bounds.height
  end
  return _cachedTextHeights[taskID]
end
local function _InsertPadding(sortedItems)
  if #sortedItems == 0 then
    return
  end
  local item = sortedItems[#sortedItems]
  item.size.y = item.size.y + input.text.padding
end
local function _InsertTask(sortedItems, taskID)
  _InsertPadding(sortedItems)
  table.insert(sortedItems, {
    type = "TaskXform",
    params = {taskID},
    size = Point:New(input.text.width + input.text.xOffset, _GetTaskHeight(taskID))
  })
  _hints:Insert(sortedItems, taskID)
end
local function _GenerateOrder()
  local unsortedTasks = TaskManager:All()
  local completedTaskIDs = {}
  local sortedItems = {}
  for _, unsortedTask in ipairs(unsortedTasks) do
    if not unsortedTask.complete or unsortedTask.id == _justCompleted then
      _InsertTask(sortedItems, unsortedTask.id)
    else
      table.insert(completedTaskIDs, unsortedTask.id)
    end
  end
  for _, taskID in ipairs(completedTaskIDs) do
    _InsertTask(sortedItems, taskID)
  end
  return sortedItems
end
local function _Reorder()
  _window:Clear()
  _hints:Reload()
  _layout:Rebuild(_GenerateOrder())
  _window:Update()
end
local function _UpdateTaskButton(button, taskID)
  button.active = not TaskManager:IsComplete(taskID) and _hints:IsExpandable(taskID)
end
local function _TryCheck(checkbox, taskID)
  if TaskManager:TryToComplete(taskID) then
    checkbox.localEnabled = false
    if not Brain.TUT_InTutorial_BR then
      input.canCompleteSound:Restart()
    end
    _justCompleted = taskID
    if _hints:TryCollapse(taskID) then
      _Reorder()
    end
  else
    checkbox.isSelected = false
    input.cantCompleteSound:Restart()
  end
end
local function _ToggleExpand(taskID)
  _hints:ToggleCollapsed(taskID)
  _Reorder()
end
_recycler:DefineType({
  name = "TaskCheckBox",
  Generate = function()
    local ar = AR:CheckBox({
      hs = AR:Hotspot(input.check.hs),
      baseOvl = AR:Overlay(input.check.baseOvl),
      downOvl = AR:Overlay(input.check.downOvl),
      overOvl = AR:Overlay(input.check.overOvl),
      selectedOvl = AR:Overlay(input.check.selectedOvl),
      text = AR:Text({
        text = "",
        onScreen = Rect.empty,
        useAutotext = false
      })
    })
    local ovlDest = ar.baseOvl.source:LeftTopSet(0, input.check.yOffset)
    ar.baseOvl.onScreen = ovlDest
    ar.downOvl.onScreen = ovlDest
    ar.overOvl.onScreen = ovlDest
    ar.selectedOvl.onScreen = ovlDest
    ar.text.onScreen = Rect:LTWH(input.text.xOffset, 0, input.text.width, 0)
    return ar
  end,
  Skin = function(ar, order, taskID)
    ar.isSelected = TaskManager:IsComplete(taskID) or false
    ar.localEnabled = not ar.isSelected
    ar.localAlpha = ar.isSelected and input.check.selectedAlpha or input.check.unselectedAlpha
    ar.hs.onScreen = Rect:LTWH(0, 0, _layout:SizeOf(order).x, _layout:SizeOf(order).y)
    ar.text.text = _GetAutotext(taskID)
    function ar.OnSelect()
      _TryCheck(ar, taskID)
    end
  end,
  Recycle = function(ar)
  end
})
_recycler:DefineType({
  name = "TaskButton",
  Generate = function()
    return AR:Button({
      hs = AR:Hotspot(input.button.hs),
      upOvl = AR:Overlay(input.button.ovl),
      downOvl = AR:Overlay(input.button.ovl),
      overOvl = AR:Overlay(input.button.ovl)
    })
  end,
  Skin = function(ar, taskID, checkbox)
    ar.taskID = taskID
    _visibleTasks[taskID] = ar
    _UpdateTaskButton(ar, taskID)
    if _hints:IsExpanded(taskID) then
      ar.upOvl.localAlpha = input.button.alphas.expanded.up
      ar.overOvl.localAlpha = input.button.alphas.expanded.over
      ar.downOvl.localAlpha = input.button.alphas.expanded.down
    else
      ar.upOvl.localAlpha = input.button.alphas.collapsed.up
      ar.overOvl.localAlpha = input.button.alphas.collapsed.over
      ar.downOvl.localAlpha = input.button.alphas.collapsed.down
    end
    ar.hs.onScreen = Rect:LTWH(ar.hs.onScreen.left, 0, ar.hs.onScreen.width, checkbox.hs.onScreen.height)
    function ar.OnUp()
      _ToggleExpand(taskID)
    end
  end,
  Recycle = function(ar)
    _visibleTasks[ar.taskID] = nil
  end
})
_recycler:DefineType({
  name = "TaskXform",
  Generate = function()
    return AR:Transformer({})
  end,
  Skin = function(ar, order, taskID)
    ar.check = _recycler:GenerateTaskCheckBox(order, taskID)
    ar:Attach(ar.check)
    if not TaskManager:IsComplete(taskID) then
      ar.button = _recycler:GenerateTaskButton(taskID, ar.check)
      ar:Attach(ar.button)
    end
  end,
  Recycle = function(ar)
    _recycler:RecycleTaskCheckBox(ar.check)
    if ar.button then
      _recycler:RecycleTaskButton(ar.button)
    end
  end
})
tasklistMaster:Attach(_updater)
_window:HideSlider()
function _updater.Run(this)
  for taskID, button in pairs(_visibleTasks) do
    _UpdateTaskButton(button, taskID)
  end
  local newChangeCount = TaskManager:ChangeCount()
  if newChangeCount ~= this.changeCount then
    this.changeCount = newChangeCount
    _justCompleted = nil
    _window:ScrollToStart()
    _Reorder()
  end
end
_hints.OnChange = _Reorder
function tasklistMaster.Receive(this, sender, action)
  if sender == "NotesTasklist" and action == "Collapse" then
    _hints:CollapseAll()
    _Reorder()
    _window:SetSize(input.clip.size.collapsed)
    _window:HideSlider()
    _window:ScrollToStart()
  elseif sender == "NotesTasklist" and action == "Expand" then
    _window:SetSize(input.clip.size.expanded)
    _window:ShowSlider()
  end
end
function input.canCompleteSound.OnDone()
  _justCompleted = nil
  _Reorder()
end
