-- Midnight in Salem (Project Midnight): s2800
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"NBH"}):Scene({"s2800"}):Sum({"NBH_Node" .. N .. "0000_BG"})
  :Nav({"right", RectM(824, 0, 1024, 690), "s2801"})
  :Nav({"left", RectM(0, 0, 200, 690), "s2803"})
  :Nav({"uTurn", RectB(560), "s2802"})
