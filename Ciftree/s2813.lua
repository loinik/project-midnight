-- Midnight in Salem (Project Midnight): s2813
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"NBH"}):Scene({"s2813"}):Sum({"NBH_NavB" .. N .. "_BG"})
  :Nav({"uTurn", RectB(560), "s2814"})
