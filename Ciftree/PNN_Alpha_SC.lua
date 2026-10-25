-- Midnight in Salem: calling Ned always reaches his voicemail — MID's own greeting
-- (MCG_Prologue NedsVoicemail, phone-filtered) and the beep, captioned by the convo
-- system like SEA's PNN_AnswerMach_SC; PNN_Omega_SC ends the call.
Scene:Include("PNN_Global_SC")
Scene:Include("Eddy_Include_SC")
StartEddy():Env({"UI"}):Scene({"PNN_Alpha_SC"}):Sum({""}):Convo({
  {"PNN_AnswerMach01_SFX", "PNN_VoicemailBeep_SFX"},
  "PNN_Omega_SC"
})
