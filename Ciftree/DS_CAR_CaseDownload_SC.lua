-- Midnight in Salem: Nancy's questions (game: CAR_Day1_Dialogue_CaseDownload).
-- Original structure: Choice 1 = family; Choice 2 = Mei / Teegan (each once, back here
-- after each); when both are asked, Choice 3 = the mansion, which ends the drive.
-- A menu entry is Nancy's first line of the topic; its caption is the button text.
Scene:Include("DS_CAR_Global_SC")
Scene:Include("Eddy_Include_SC")
StartEddy():Env({"CAR"}):Scene({"DS_CAR_CaseDownload_SC"}):Sum({"CAR_Convertible_BG"})
local responses = {}
local function ask(sound, sceneName, order)
  responses[sound] = {
    OnDone = function()
      Scene:Change(sceneName)
    end,
    order = order
  }
end
if not Brain.DS_CAR_Family_Done_BR then
  ask("DS_CAR_CaseDownload01_N_SFX", "DS_CAR_Family_SC", -1)
elseif not (Brain.DS_CAR_Mei_Done_BR and Brain.DS_CAR_Teegan_Done_BR) then
  if not Brain.DS_CAR_Mei_Done_BR then
    ask("DS_CAR_CaseDownload06_N_SFX", "DS_CAR_Mei_SC", -1)
  end
  if not Brain.DS_CAR_Teegan_Done_BR then
    ask("DS_CAR_CaseDownload07_N_SFX", "DS_CAR_Teegan_SC", -2)
  end
else
  ask("DS_CAR_CaseDownload24_N_SFX", "DS_CAR_Mansion_SC", -1)
end
MakeConvo({
  stages = {},
  responses = responses,
  fidget = DSCarConvoFidget
})
