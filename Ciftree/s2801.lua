-- Midnight in Salem (Project Midnight): s2801
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"NBH"}):Scene({"s2801"}):Sum({"NBH_Node" .. N .. "0001_BG"})
  :Nav({"forward", RectM(200, 70, 824, 640), "s2811"})
  :Nav({"right", RectM(824, 0, 1024, 690), "s2802"})
  :Nav({"left", RectM(0, 0, 200, 690), "s2800"})
  :Nav({"uTurn", RectB(560), "s2803"})
