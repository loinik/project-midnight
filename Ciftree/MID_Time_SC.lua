-- Midnight in Salem: the time system (include). Time only moves from the phone
-- Clock app's alarm while Nancy is in her bedroom (PHG, s2900-s2903:
-- MID_Bedroom_AREA, tagged by PHG_AMB_SC) — never by a click elsewhere.
-- Saved with the game: VarTable.MID_Day_VT (1-based), Flags.Night_FL and the
-- time Nancy woke/rested to (MID_Hour_VT / MID_Minute_VT; 0:00 = phase default).
MIDTime = {
  phases = {
    day = {hours = 9, minutes = 0},
    night = {hours = 22, minutes = 30}
  },
  -- the two alarm choices: morning and evening
  alarms = {{hours = 9, minutes = 0}, {hours = 22, minutes = 30}}
}

function MIDTime:Day()
  local d = VarTable.MID_Day_VT or 0
  if d < 1 then
    d = 1
  end
  return d
end

function MIDTime:Now()
  local h, m = VarTable.MID_Hour_VT or 0, VarTable.MID_Minute_VT or 0
  if h == 0 and m == 0 then
    local p = Flags.Night_FL and self.phases.night or self.phases.day
    return {hours = p.hours, minutes = p.minutes}
  end
  return {hours = h, minutes = m}
end

-- the alarm times Nancy can pick: morning, evening
function MIDTime:AlarmChoices()
  return self.alarms
end

function MIDTime:InBedroom()
  return AreaManager:PlayerIsIn("MID_Bedroom_AREA") and true or false
end

-- Sleeps until `time` (one of AlarmChoices). Morning = the next morning;
-- evening = this evening from the day, the next evening from the night. Plays
-- the transition clip (UI_Transition_SC) in MAIN, which returns to `back`
-- (default: the bedroom).
function MIDTime:Sleep(time, back)
  local toNight = time.hours >= 12
  if not toNight or Flags.Night_FL then
    VarTable.MID_Day_VT = self:Day() + 1
  else
    VarTable.MID_Day_VT = self:Day()
  end
  Flags.Night_FL = toNight
  if toNight then Flags.Switch_toPHG = true end -- evening starts with the bedroom light on
  if toNight or Flags.Night_FL then Brain.MID_FirstNight_BR = true end -- diary/tasks (ProjectX_Brain_SC)
  if time then
    VarTable.MID_Hour_VT = time.hours
    VarTable.MID_Minute_VT = time.minutes
  end
  StrTable.MID_TransitionBack_ST = back or "s2900"
  Scene:Change("MAIN", "UI_Transition_SC")
end
