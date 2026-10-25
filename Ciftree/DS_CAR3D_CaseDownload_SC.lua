-- Midnight in Salem (3D Deirdre): Nancy's questions, the original 3-choice structure.
Scene:Include("DS_CAR3D_Global_SC")
Scene:Include("Eddy_Include_SC")
StartEddy():Env({"CAR"}):Scene({"DS_CAR3D_CaseDownload_SC"}):Sum({"CAR_Convertible_BG"})
local responses = {}
local function ask(sound, sceneName, order)
  responses[sound] = {
    OnDone = function()
      Scene:Change(sceneName)
    end,
    order = order
  }
end
if not Brain.DS_CAR3D_Family_Done_BR then
  ask("DS_CAR_CaseDownload01_N_SFX", "DS_CAR3D_Family_SC", -1)
elseif not (Brain.DS_CAR3D_Mei_Done_BR and Brain.DS_CAR3D_Teegan_Done_BR) then
  if not Brain.DS_CAR3D_Mei_Done_BR then
    ask("DS_CAR_CaseDownload06_N_SFX", "DS_CAR3D_Mei_SC", -1)
  end
  if not Brain.DS_CAR3D_Teegan_Done_BR then
    ask("DS_CAR_CaseDownload07_N_SFX", "DS_CAR3D_Teegan_SC", -2)
  end
else
  ask("DS_CAR_CaseDownload24_N_SFX", "DS_CAR3D_Mansion_SC", -1)
end
MakeConvo({
  stages = {},
  responses = responses
})
