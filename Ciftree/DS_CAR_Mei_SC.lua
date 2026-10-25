-- Midnight in Salem: question topic "Mei" (game: CAR_Day1_Dialogue_CaseDownload, conv_2_1) - part 1/4.
Scene:Include("DS_CAR_Global_SC")
Scene:Include("Eddy_Include_SC")
StartEddy():Env({"CAR"}):Scene({
  "DS_CAR_Mei_SC"
}):Sum({"CAR_Convertible_BG"}):Flagset({
  "DS_CAR_Mei_Done_BR",
  "start"
}):Convo({
  {
    "DS_CAR_CaseDownload06_N_SFX",
    "DS_CAR_CaseDownload11_XS"
  },
  "DS_CAR_MeiB_SC",
  fidget = DSCarConvoFidget
})
