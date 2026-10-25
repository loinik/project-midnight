-- Midnight in Salem: question topic "Teegan" (game: CAR_Day1_Dialogue_CaseDownload, conv_2_2) - part 1/1.
Scene:Include("DS_CAR_Global_SC")
Scene:Include("Eddy_Include_SC")
StartEddy():Env({"CAR"}):Scene({
  "DS_CAR_Teegan_SC"
}):Sum({"CAR_Convertible_BG"}):Flagset({
  "DS_CAR_Teegan_Done_BR",
  "start"
}):Convo({
  {
    "DS_CAR_CaseDownload07_N_SFX",
    "DS_CAR_CaseDownload18_XS"
  },
  "DS_CAR_CaseDownload_SC",
  fidget = DSCarConvoFidget
})
