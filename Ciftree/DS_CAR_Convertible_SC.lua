-- Midnight in Salem: the conversation on the way (game: CAR_Day1_Cutscene_Convertible + the HathorneHouse lines) - part 1/10.
Scene:Include("DS_CAR_Global_SC")
Scene:Include("Eddy_Include_SC")
StartEddy():Env({"CAR"}):Scene({
  "DS_CAR_Convertible_SC"
}):Sum({"CAR_Convertible_BG"}):Convo({
  {
    "DS_CAR_Convertible01_XS",
    "DS_CAR_Convertible02_N_SFX",
    "DS_CAR_Convertible03_XS"
  },
  "DS_CAR_ConvertibleB_SC",
  fidget = DSCarConvoFidget
})
