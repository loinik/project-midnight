-- Midnight in Salem: question topic "Mei" (game: CAR_Day1_Dialogue_CaseDownload, conv_2_1) - part 3/4.
Scene:Include("DS_CAR_Global_SC")
Scene:Include("Eddy_Include_SC")
StartEddy():Env({"CAR"}):Scene({
  "DS_CAR_MeiC_SC"
}):Sum({"CAR_Convertible_BG"}):Convo({
  {
    "DS_CAR_CaseDownload14_N_SFX",
    "DS_CAR_CaseDownload15_XS"
  },
  "DS_CAR_MeiD_SC",
  fidget = DSCarConvoFidget
})
