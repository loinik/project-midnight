-- Midnight in Salem: question topic "Family" (game: CAR_Day1_Dialogue_CaseDownload, conv_1_1) - part 2/2.
Scene:Include("DS_CAR_Global_SC")
Scene:Include("Eddy_Include_SC")
StartEddy():Env({"CAR"}):Scene({
  "DS_CAR_FamilyB_SC"
}):Sum({"CAR_Convertible_BG"}):Convo({
  {
    "DS_CAR_CaseDownload03_N_SFX",
    "DS_CAR_CaseDownload04_XS",
    "DS_CAR_CaseDownload05_XS"
  },
  "DS_CAR_CaseDownload_SC",
  fidget = DSCarConvoFidget
})
