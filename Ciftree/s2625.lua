-- Midnight in Salem (Project Midnight): s2625 — the fans. (The web build
-- switched day/night here; time now changes only in the bedroom, s2646.)
Scene:Include("Eddy_Include_SC")
local N = Flags.Night_FL and "Night" or ""
StartEddy():Env({"PHL"}):Scene({"s2625"}):Sum({"PHL_Fans" .. N .. "_BG"})
  :Nav({"back", RectB(560), "s2623"})
