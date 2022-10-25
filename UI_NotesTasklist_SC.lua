Scene:Include("UI_Notes_SC")
Scene:Include("UI_Tasklist_SC")
local ntMaster = AR:Transformer({
  collapsed = Point:New(0, 400),
  expanded = Point:New(0, 0),
  animTime = 0.2,
  z = -3,
  alias = "NotesTasklist"
})
local showTasklistHotspot = AR:Hotspot({
  ref = "UI_Frame_OVL",
  source = Rect:LTWH(13, 171, 122, 40),
  onScreen = Rect:LTWH(744, 242, 122, 40),
  cursor = "MenuHot",
  active = false
})
local showNotesHotspot = AR:Hotspot({
  ref = "UI_Frame_OVL",
  source = Rect:LTWH(175, 171, 122, 40),
  onScreen = Rect:LTWH(906, 242, 122, 40),
  cursor = "MenuHot",
  active = false
})
local expandSound = AR:Sound({
  sounds = "TaskListOpen_SFX",
  channel = "UIFX",
  volume = 0.75,
  active = false
})
local collapseSound = AR:Sound({
  sounds = "TaskListClsd_SFX",
  channel = "UIFX",
  volume = 0.75,
  active = false
})
local resizeTasklistButton = AR:Button({
  hs = AR:Hotspot({
    ref = "UI_Frame_OVL",
    source = Rect:LTWH(13, 171, 162, 40),
    onScreen = Rect:LTWH(744, 242, 162, 40),
    cursor = "MenuHot"
  }),
  overOvl = AR:Overlay({
    ovl = "UI_Frame_OVL",
    source = Rect:New(969, 175, 994, 200),
    onScreen = Rect:New(836, 254, 861, 279)
  }),
  collapseSource = Rect:New(942, 175, 967, 200),
  expandSource = Rect:New(969, 175, 994, 200),
  z = 2,
  active = false
})
local resizeNotesButton = AR:Button({
  hs = AR:Hotspot({
    ref = "UI_Frame_OVL",
    source = Rect:LTWH(135, 171, 162, 40),
    onScreen = Rect:LTWH(866, 242, 162, 40),
    cursor = "MenuHot"
  }),
  overOvl = AR:Overlay({
    ovl = "UI_Frame_OVL",
    source = Rect:New(969, 175, 994, 200),
    onScreen = Rect:New(989, 252, 1014, 277)
  }),
  collapseSource = Rect:New(942, 175, 967, 200),
  expandSource = Rect:New(969, 175, 994, 200),
  z = 2,
  active = false
})
local collapseButton = AR:Button({
  hs = AR:Hotspot({
    onScreen = Rect:New(764, 729, 999, 759),
    cursor = "MenuHot"
  }),
  overOvl = AR:Overlay({
    ovl = "UI_Frame_OVL",
    source = Rect:New(942, 175, 967, 200),
    onScreen = Rect:New(876, 729, 901, 754)
  }),
  active = false
})
local expandedShownTasklistArrowOvl = AR:Overlay({
  ovl = "UI_Frame_OVL",
  source = Rect:New(942, 148, 967, 173),
  onScreen = Rect:New(836, 254, 861, 279),
  z = 1,
  active = false
})
local expandedShownNotesArrowOvl = AR:Overlay({
  ovl = "UI_Frame_OVL",
  source = Rect:New(942, 148, 967, 173),
  onScreen = Rect:New(989, 252, 1014, 277),
  z = 1,
  active = false
})
local expandedHiddenTasklistArrowOvl = AR:Overlay({
  ovl = "UI_Frame_OVL",
  source = Rect:New(969, 148, 994, 166),
  onScreen = Rect:New(836, 252, 861, 270),
  z = 1,
  active = false
})
local expandedHiddenNotesArrowOvl = AR:Overlay({
  ovl = "UI_Frame_OVL",
  source = Rect:New(969, 148, 994, 166),
  onScreen = Rect:New(989, 250, 1014, 268),
  z = 1,
  active = false
})
local backdropOvl = AR:Overlay({
  ovl = "UI_Frame_OVL",
  source = Rect:New(686, 130, 940, 215),
  onScreen = Rect:New(763, 676, 1017, 761),
  z = -4,
  active = true
})
local tasklistOvl = AR:Overlay({
  ovl = "UI_Frame_OVL",
  source = Rect:New(2, 175, 297, 694),
  onScreen = Rect:New(729, 242, 1024, 761),
  z = -1,
  active = false
})
local notesOVL = AR:Overlay({
  ovl = "UI_Frame_OVL",
  source = Rect:New(299, 175, 594, 694),
  onScreen = Rect:New(729, 242, 1024, 761),
  z = -1,
  active = false
})
local sink = AR:Hotspot({
  onScreen = tasklistOvl.onScreen,
  watchRight = true,
  cursor = "Menu",
  ref = tasklistOvl.ovl,
  source = tasklistOvl.source,
  z = -10
})
local activeARs = {}
local puzzleFlashOvl = AR:Overlay({
  ovl = "UI_Frame_OVL",
  source = Rect:New(686, 487, 935, 593),
  onScreen = Rect:New(764, 652, 1013, 758),
  active = false
})
local puzzleFlashTimer = AR:Timer({
  flash = false,
  duration = 0.33,
  flashCount = 0,
  flashMax = 3,
  active = false,
  RunOnce = function(this)
    if this.flash then
      puzzleFlashOvl.active = true
      this.flash = false
    else
      this.flash = true
    end
  end,
  OnDone = function(this)
    puzzleFlashOvl.active = false
    this.flashCount = this.flashCount + 1
    if this.flashCount <= this.flashMax and Flags.UI_PuzzleFlash_FL then
      this:Restart()
    end
  end
})
local function Expand(this)
  ntMaster.animator[1].t:AddBlendSlerp(ntMaster.animTime, ntMaster.expanded)
  ntMaster.animator[1].OnDone = nil
  ntMaster:SendAsAlias(ntMaster.alias, "NotesUI", "Expand")
  ntMaster:SendAsAlias(ntMaster.alias, "TasklistUI", "Expand")
  resizeTasklistButton.overOvl.source = resizeTasklistButton.collapseSource
  resizeNotesButton.overOvl.source = resizeNotesButton.collapseSource
  expandSound:Restart()
end
local function Collapse(this)
  ntMaster.animator[1].t:AddBlendSlerp(ntMaster.animTime, ntMaster.collapsed)
  ntMaster.animator[1].OnDone = function()
    ntMaster:SendAsAlias(ntMaster.alias, "NotesUI", "Collapse")
    ntMaster:SendAsAlias(ntMaster.alias, "TasklistUI", "Collapse")
  end
  resizeTasklistButton.overOvl.source = resizeTasklistButton.expandSource
  resizeNotesButton.overOvl.source = resizeNotesButton.expandSource
  collapseSound:Restart()
end
local function ShowPuzzleHelp(this)
  ntMaster:SendAsAlias(ntMaster.alias, "NotesUI", "ScrollToStart")
  puzzleFlashTimer.flashCount = 0
  puzzleFlashTimer.flash = false
  puzzleFlashTimer:Restart()
end
local function Activate(...)
  for _, ar in ipairs({
    ...
  }) do
    if ar.done then
      ar:Restart()
    else
      ar.active = true
    end
    table.insert(activeARs, ar)
  end
end
local function Deactivate()
  for _, ar in ipairs(activeARs) do
    ar.active = false
  end
  activeARs = {}
end
if not ntMaster:RegisterAlias(ntMaster.alias) then
  error("NotesTasklist could not register its alias")
end
ntMaster.animator[1].t = ntMaster.collapsed
ntMaster:Attach(showTasklistHotspot, showNotesHotspot, resizeTasklistButton, resizeNotesButton, collapseButton, expandedShownTasklistArrowOvl, expandedShownNotesArrowOvl, expandedHiddenTasklistArrowOvl, expandedHiddenNotesArrowOvl, tasklistOvl, notesOVL, sink, notesMaster, tasklistMaster)
uiFrame:Attach(ntMaster, backdropOvl)
function showTasklistHotspot.OnDone(this)
  EventManager:Raise("NT", "ShowTasklist")
end
function showNotesHotspot.OnDone(this)
  EventManager:Raise("NT", "ShowNotes")
end
function resizeTasklistButton.OnUp(this)
  EventManager:Raise("NT", "ResizeTasklist")
end
function resizeNotesButton.OnUp(this)
  EventManager:Raise("NT", "ResizeNotes")
end
function sink.OnDone(this)
  this:Reset()
end
function collapseButton.OnUp()
  EventManager:Raise("NT", "Collapse")
end
function ntMaster.Receive(this, sender, action)
  if sender == "NotesUI" and action == "Expand" then
    EventManager:Raise("NT", "ExpandNotes")
  end
  if string.comparenocase(action, "TutorialExpand") then
    EventManager:Raise("NT", "ResizeTasklist")
  end
  if string.comparenocase(action, "Collapse") then
    EventManager:Raise("NT", "Collapse")
  end
  if string.comparenocase(action, "ShowPuzzleHelp") then
    EventManager:Raise("NT", "ShowPuzzleHelp")
  end
  if string.comparenocase(action, "ShowTasklist") then
    EventManager:Raise("NT", "ShowTasklist")
  end
end
Scene:Include("Actor_SC")
local ntActor = MakeActor({name = "NT"})
ntActor:AddState({
  name = "collapsedTasklist",
  OnBegin = function(this)
    Activate(showNotesHotspot, resizeTasklistButton, tasklistOvl, tasklistMaster)
  end,
  OnEvent("NT", "ShowNotes", function(this)
    this.state = "collapsedNotes"
  end),
  OnEvent("NT", "ResizeTasklist", function(this)
    Expand()
    this.state = "expandedTasklist"
    Flags.UI_TasklistExpanded_FL = true
  end),
  OnEvent("NT", "ShowPuzzleHelp", function(this)
    ShowPuzzleHelp()
    this.state = "collapsedNotes"
  end),
  OnEnd = function(this)
    Deactivate()
  end
})
ntActor:AddState({
  name = "collapsedNotes",
  OnBegin = function(this)
    Activate(showTasklistHotspot, resizeNotesButton, notesOVL, notesMaster)
  end,
  OnEvent("NT", "ShowTasklist", function(this)
    this.state = "collapsedTasklist"
  end),
  OnEvent("NT", "ResizeNotes", function(this)
    Expand()
    this.state = "expandedNotes"
  end),
  OnEvent("NT", "ExpandNotes", function(this)
    Expand()
    this.state = "expandedNotes"
  end),
  OnEvent("NT", "ShowPuzzleHelp", function(this)
    ShowPuzzleHelp()
  end),
  OnEnd = function(this)
    Deactivate()
  end
})
ntActor:AddState({
  name = "expandedTasklist",
  OnBegin = function(this)
    Activate(showNotesHotspot, resizeTasklistButton, expandedShownTasklistArrowOvl, expandedHiddenNotesArrowOvl, collapseButton, tasklistOvl, tasklistMaster)
  end,
  OnEvent("NT", "ShowNotes", function(this)
    this.state = "expandedNotes"
    Flags.UI_TasklistExpanded_FL = false
  end),
  OnEvent("NT", "ResizeTasklist", function(this)
    Collapse()
    this.state = "collapsedTasklist"
    Flags.UI_TasklistExpanded_FL = false
  end),
  OnEvent("NT", "Collapse", function(this)
    EventManager:Raise("NT", "ResizeTasklist")
  end),
  OnEvent("NT", "ShowPuzzleHelp", function(this)
    Collapse()
    ShowPuzzleHelp()
    this.state = "collapsedNotes"
    Flags.UI_TasklistExpanded_FL = false
  end),
  OnEnd = function(this)
    Deactivate()
  end
})
ntActor:AddState({
  name = "expandedNotes",
  OnBegin = function(this)
    Activate(showTasklistHotspot, resizeNotesButton, expandedShownNotesArrowOvl, expandedHiddenTasklistArrowOvl, collapseButton, notesOVL, notesMaster)
  end,
  OnEvent("NT", "ShowTasklist", function(this)
    this.state = "expandedTasklist"
    Flags.UI_TasklistExpanded_FL = true
  end),
  OnEvent("NT", "ResizeNotes", function(this)
    Collapse()
    this.state = "collapsedNotes"
  end),
  OnEvent("NT", "Collapse", function(this)
    EventManager:Raise("NT", "ResizeNotes")
  end),
  OnEvent("NT", "ShowPuzzleHelp", function(this)
    Collapse()
    ShowPuzzleHelp()
    this.state = "collapsedNotes"
  end),
  OnEnd = function(this)
    Deactivate()
  end
})
if Flags.UI_PuzzleFlash_FL then
  ntActor.state = "collapsedNotes"
else
  ntActor.state = "collapsedTasklist"
end
