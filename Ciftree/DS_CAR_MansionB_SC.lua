-- Midnight in Salem: question topic "Mansion" (game: CAR_Day1_Dialogue_CaseDownload, conv_3_1) - part 2/3.
Scene:Include("DS_CAR_Global_SC")
Scene:Include("Eddy_Include_SC")
StartEddy():Env({"CAR"}):Scene({
  "DS_CAR_MansionB_SC"
}):Sum({"CAR_Convertible_BG"}):Convo({
  {
    "DS_CAR_CaseDownload26_N_SFX",
    "DS_CAR_CaseDownload27_XS",
    "DS_CAR_CaseDownload28_XS"
  },
  "DS_CAR_MansionC_SC",
  fidget = DSCarConvoFidget
})
