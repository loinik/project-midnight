-- Midnight in Salem: PHG ambience — Nancy's bedroom in the Parry house
-- (s2900-s2903). Area medley (House, day/night) + MID_Bedroom_AREA, which
-- enables the phone Clock app's "sleep" control (MID_Time_SC).
sum = AR:Summary({env = "PHG", bg = ""})
AreaTag("MID_Bedroom_AREA")
Brain.MID_BedroomVisited_BR = true
Scene:Include("MID_MedleyTag_SC")
medleyTag = MakeMedleyTag("House")
