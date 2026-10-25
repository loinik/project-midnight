-- Midnight in Salem (Project Midnight): day <-> night change. Flags.Night_FL is
-- already the new state (MIDTime:Sleep); plays the matching clip and returns
-- to the scene Sleep named (Nancy's bedroom, s2900).
sum = AR:Summary({env = "", bg = "toast_BG"})
AreaTag("Medley_NONE")
local back = StrTable.MID_TransitionBack_ST
if back == nil or back == "" then
  back = "s2900"
end
transitionAnim = AR:Movie({
  movie = Flags.Night_FL and "UI_TransD2N_BG" or "UI_TransN2D_BG",
  onScreen = Rect:New(0, 0, 1024, 690),
  z = 3,
  OnDone = function(this)
    Scene:Change(back)
  end
})
