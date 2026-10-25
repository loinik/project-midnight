-- Midnight in Salem: the game's own Brain records, loaded after the package's Brain_SC.
-- Tasks_SC/Hints_SC/Notes_SC/DiaryEntries_SC/Texts_SC (stock) discover their entries by
-- these names: TaskNN_Ready_BR/_Done_BR, TaskNNHn_BR, NoteNN_BR, DiaryNN_BR,
-- TEXT_<SEQ>_READY_BR (+ CONTACT:/DELAY: in the logic source). Text lives in
-- TaskHint_Text_SC (TASKnn, TASKnnHn) and Notes_Text_SC (NOTEnn, DIARYnn).
-- Progress markers (plain flags) are set by the scenes:
--   MID_InSalem_BR        PHH_AMB_SC — Nancy has reached the Parry house
--   MID_MeiDoorTried_BR   s2646 — knocked on Mei's locked door
--   MID_BedroomVisited_BR PHG_AMB_SC — found her room upstairs
--   MID_FirstNight_BR     MID_Time_SC — the first evening has come
-- Later Day 1 tasks wait on flags the unported chapters will set (MID_Teegan*, MID_Tour*…).
local records = {}
local function Plain(name)
  table.insert(records, {name, false})
end
local function Logic(name, fn, src)
  -- the original record layout, so Brain:Logic(name) returns src (Texts_SC reads
  -- CONTACT:/DELAY: from it, Hints_SC looks for SPOILER)
  table.insert(records, {"mid-" .. name, true, name, "MID", false, false, fn, src, "10/25/2026"})
end

for _, name in ipairs({
  "MID_InSalem_BR", "MID_MeiDoorTried_BR", "MID_BedroomVisited_BR", "MID_FirstNight_BR",
  "MID_MeiTalked_BR", "MID_TeeganMet_BR", "MID_TourStarted_BR", "MID_TourDone_BR",
  "MID_LighterFound_BR", "MID_HathorneSearched_BR", "MID_JudgeMet_BR", "MID_JudgeDoorOpen_BR",
  "MID_PhoneLive_BR", "MID_InCar_BR"
}) do
  Plain(name)
end

-- The texts already on Nancy's phone when the game starts (the Unity PreExistingMsg threads,
-- prologue then day 1). Gated on MID_PhoneLive_BR (CAR_AMB_SC / PHH_AMB_SC set it), so
-- nothing arrives on the title screen.
for _, t in ipairs({{"PCD_DETAILS", "PCD"}, {"PNN_VACATION", "PNN"}, {"PCD_CHECKUP", "PCD"}, {"PNN_CHECKUP", "PNN"}}) do
  Logic("TEXT_" .. t[1] .. "_READY_BR", function() return Brain.MID_PhoneLive_BR end, "CONTACT:" .. t[2] .. " DELAY:0")
  Plain("TEXT_" .. t[1] .. "_DONE_BR")
end

-- The package rule (Brain_SC) holds texts back during any conversation, but the whole drive
-- into Salem is one: in the car, texts come in anyway (the area guards still apply).
Logic("CanReceiveTexts_BR", function()
  return (not Brain.InConvo_BR or Brain.MID_InCar_BR)
    and not Message:Send("AreaManager", "PlayerIsIn", "PreventAllUIButMenu_AREA")
    and not Message:Send("AreaManager", "PlayerIsIn", "PreventCellPhone_AREA")
end, "-InConvo_BR (except MID_InCar_BR) and\n-PreventAllUIButMenu_AREA and\n-PreventCellPhone_AREA")

-- Tasks (Day 1). ready/done per task; hints are available while the task is live.
-- The game starts on the drive into Salem: the prologue is behind Nancy and its tasks,
-- notes and first diary entry are there from the first scene.
local function InSalem() return true end
-- saves from before the marker existed: already night, or already past day 1
local function FirstNight()
  return Brain.MID_FirstNight_BR or Flags.Night_FL or (VarTable.MID_Day_VT or 0) > 1
end
local function Flag(name) return function() return Brain[name] end end
-- The original game's TODO list (MID_Tasks_SC), Prologue (Austria) + Day 1, in story order.
-- The prologue is behind Nancy when she reaches Salem: live and complete. Hints only where
-- the original has a puzzle (hint wording from nancydrew.me), the last one marked SPOILER.
local tasks = {
  {ready = InSalem, done = InSalem},                         -- Prologue_InspectArea
  {ready = InSalem, done = InSalem},                         -- Prologue_OpenWindows
  {ready = InSalem, done = InSalem},                         -- Prologue_InspectArchives
  {ready = InSalem, done = InSalem, hints = 4, spoiler = 4}, -- Prologue_OpenDesk
  {ready = InSalem, done = InSalem},                         -- Prologue_FindThief
  {ready = InSalem, done = InSalem},                         -- Day1_TalkToDeirdre (the drive in)
  {ready = Flag("MID_MeiDoorTried_BR"), done = Flag("MID_MeiTalked_BR")},   -- Day1_CheckMei
  {ready = FirstNight, done = Flag("MID_TeeganMet_BR")},                    -- Day1_TalkTeegan
  {ready = Flag("MID_TeeganMet_BR"), done = Flag("MID_TourStarted_BR")},    -- Day1_StartTour
  {ready = Flag("MID_TourStarted_BR"), done = Flag("MID_TourDone_BR")},     -- Day1_CompleteTour
  {ready = Flag("MID_TourDone_BR"), done = Flag("MID_LighterFound_BR")},    -- Day1_FindMeisLighter
  {ready = Flag("MID_TourDone_BR"), done = Flag("MID_HathorneSearched_BR")}, -- Day1_InspectHathorneHouse
  {ready = Flag("MID_TourDone_BR"), done = Flag("MID_JudgeMet_BR")},        -- Day1_TalkToJudge
  {ready = Flag("MID_JudgeMet_BR"), done = Flag("MID_JudgeDoorOpen_BR"), hints = 3, spoiler = 3}, -- Day1_UnlockDoor
}
-- Junior Detective: the detailed list above (with hints). Master Sleuth (Brain.Senior_BR):
-- SEA's SrTaskNN list, fewer and broader goals, and never any hints.
local function Junior(fn) return function() return not Brain.Senior_BR and fn() end end
local function Senior(fn) return function() return Brain.Senior_BR and fn() end end
-- TaskManager walks allTasks with pairs(), so tasks that turn ready together would join the
-- list in hash order. Each task waits until every EARLIER ready task of its list is live:
-- they arrive one by one in story order (newest on top, as in SEA).
local function IsLive(id)
  for _, task in ipairs(Message:Send("TaskManager", "All") or {}) do
    if task.id == id then return true end
  end
  return false
end
local function InOrder(prefix, list, i, fn)
  return function()
    if not fn() then return false end
    for j = 1, i - 1 do
      local id = string.format("%s%02i", prefix, j)
      if list[j].gate() and not IsLive(id) then return false end
    end
    return true
  end
end
for _, t in ipairs(tasks) do t.gate = Junior(t.ready) end
for i, t in ipairs(tasks) do
  local id = string.format("Task%02i", i)
  Logic(id .. "_Ready_BR", InOrder("Task", tasks, i, t.gate), "+" .. id .. " ready -Senior_BR")
  Logic(id .. "_Done_BR", t.done, "+" .. id .. " done")
  for h = 1, t.hints or 0 do
    Logic(id .. "H" .. h .. "_BR", Junior(t.ready), h == t.spoiler and "SPOILER" or "+" .. id .. "_Ready_BR")
    Plain(id .. "H" .. h .. "_Revealed_BR")
  end
end
local seniorTasks = {
  {ready = InSalem, done = InSalem},                                          -- the Book of Apologies
  {ready = InSalem, done = InSalem},                                          -- the thief
  {ready = Flag("MID_MeiDoorTried_BR"), done = Flag("MID_MeiTalked_BR")},     -- Mei
  {ready = InSalem, done = Flag("MID_HathorneSearched_BR")},                  -- the fire
  {ready = Flag("MID_TourDone_BR"), done = Flag("MID_JudgeDoorOpen_BR")},     -- the judge
}
for _, t in ipairs(seniorTasks) do t.gate = Senior(t.ready) end
for i, t in ipairs(seniorTasks) do
  local id = string.format("SrTask%02i", i)
  Logic(id .. "_Ready_BR", InOrder("SrTask", seniorTasks, i, t.gate), "+" .. id .. " ready +Senior_BR")
  Logic(id .. "_Done_BR", t.done, "+" .. id .. " done")
end

-- SEA-style notes: short, usable clues only (the story so far lives in the diary)
local notes = {InSalem, InSalem}
for i, fn in ipairs(notes) do
  Logic(string.format("Note%02i_BR", i), fn, "")
end
local diary = {
  InSalem,
  function() return Brain.MID_MeiDoorTried_BR end,
  FirstNight,
}
for i, fn in ipairs(diary) do
  Logic(string.format("Diary%02i_BR", i), fn, "")
end

BrainInit:Create(records)
