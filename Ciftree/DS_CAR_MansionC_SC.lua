-- Midnight in Salem: question topic "Mansion" (game: CAR_Day1_Dialogue_CaseDownload, conv_3_1) - part 3/3.
Scene:Include("DS_CAR_Global_SC")
Scene:Include("Eddy_Include_SC")
StartEddy():Env({"CAR"}):Scene({
  "DS_CAR_MansionC_SC"
}):Sum({"CAR_Convertible_BG"}):Convo({
  {
    "DS_CAR_CaseDownload29_N_SFX",
    "DS_CAR_CaseDownload30_XS"
  },
  "DS_CAR_End_SC",
  fidget = DSCarConvoFidget
})
