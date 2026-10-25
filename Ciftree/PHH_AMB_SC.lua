-- Midnight in Salem: PHH ambience — area medley (House, day/night).
Flags.Cellphone_Enable_Talk_FL = true -- saves made before DS_CAR_End_SC enabled it
Flags.Cellphone_Enable_Messages_FL = true
Brain.MID_PhoneLive_BR = true
Flags.UI_SavePromptEnabled_FL = true -- "save before quitting?" (SEA sets it in its opening)
Brain.MID_InCar_BR = false
Flags.Cellphone_Enable_Games_FL = true
Brain.MID_InSalem_BR = true -- unlocks Carson's texts, Day 1 tasks, notes and diary (ProjectX_Brain_SC)
sum = AR:Summary({env = "PHH", bg = ""})
Scene:Include("MID_MedleyTag_SC")
medleyTag = MakeMedleyTag("House")
