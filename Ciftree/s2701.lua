-- Midnight in Salem (Project Midnight): s2701
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"PHP"}):Scene({"s2701"}):Sum({"PHP_ToNBH" .. N .. "_BG"})
  :Nav({"forward", RectM(200, 70, 824, 640), "s2800"})
  :Nav({"uTurn", RectB(560), "s2700"})
