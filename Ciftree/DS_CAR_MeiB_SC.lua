-- Midnight in Salem: question topic "Mei" (game: CAR_Day1_Dialogue_CaseDownload, conv_2_1) - part 2/4.
Scene:Include("DS_CAR_Global_SC")
Scene:Include("Eddy_Include_SC")
StartEddy():Env({"CAR"}):Scene({
  "DS_CAR_MeiB_SC"
}):Sum({"CAR_Convertible_BG"}):Convo({
  {
    "DS_CAR_CaseDownload12_N_SFX",
    "DS_CAR_CaseDownload13_XS"
  },
  "DS_CAR_MeiC_SC",
  fidget = DSCarConvoFidget
})
