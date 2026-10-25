-- Midnight in Salem: calling Carson (Dad). The first call is the game's Day 1 phone call;
-- after that his answering machine picks up. PNN_Omega_SC ends the call as for Ned.
Scene:Include("PNN_Global_SC")
Scene:Include("Eddy_Include_SC")
if not Brain.PCD_Called_BR then
  Brain.PCD_Called_BR = true
  StartEddy():Env({"UI"}):Scene({"PCD_Alpha_SC"}):Sum({""}):Convo({
    {
      "PCD_Call01_SFX",
      "PCD_Call02_N_SFX",
      "PCD_Call03_SFX",
      "PCD_Call04_N_SFX",
      "PCD_Call05_SFX",
      "PCD_Call06_SFX",
      "PCD_Call07_N_SFX",
      "PCD_Call08_SFX"
    },
    "PNN_Omega_SC"
  })
else
  StartEddy():Env({"UI"}):Scene({"PCD_Alpha_SC"}):Sum({""}):Convo({
    {"PCD_AnswerMach01_SFX"},
    "PNN_Omega_SC"
  })
end
