-- Midnight in Salem: question topic "Family" (game: CAR_Day1_Dialogue_CaseDownload, conv_1_1) - part 1/2.
Scene:Include("DS_CAR_Global_SC")
Scene:Include("Eddy_Include_SC")
StartEddy():Env({"CAR"}):Scene({
  "DS_CAR_Family_SC"
}):Sum({"CAR_Convertible_BG"}):Flagset({
  "DS_CAR_Family_Done_BR",
  "start"
}):Convo({
  {
    "DS_CAR_CaseDownload01_N_SFX",
    "DS_CAR_CaseDownload02_XS"
  },
  "DS_CAR_FamilyB_SC",
  fidget = DSCarConvoFidget
})
