-- Midnight in Salem: the conversation on the way (game: CAR_Day1_Cutscene_Convertible + the HathorneHouse lines) - part 10/10.
Scene:Include("DS_CAR_Global_SC")
Scene:Include("Eddy_Include_SC")
StartEddy():Env({"CAR"}):Scene({
  "DS_CAR_ConvertibleJ_SC"
}):Sum({"CAR_Convertible_BG"}):Convo({
  {
    "DS_CAR_Convertible30_N_SFX",
    "DS_CAR_Convertible31_XS"
  },
  "DS_CAR_CaseDownload_SC",
  fidget = DSCarConvoFidget
})
