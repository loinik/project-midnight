-- Midnight in Salem: achievement list (include). Story achievements are the
-- original game's (Steam: id, title, description, hidden); the "standard" ones
-- follow SEA's meta awards (Spoiler Free, Trivia Tamer, Egged) plus the Bonus
-- Edition phone-games award. Art is a placeholder — the awards screen
-- (MetaAwardsCore_SC) still has SEA's 13 numbered slots; MetaAwardsData_SC
-- picks which achievements show there until the MID art exists.
-- brain = the Brain flag a scene sets when the achievement is earned.
MIDAchievements = {
  -- story (original Steam achievements, most to least common)
  {id = "AW", brain = "MID_Ach_AW_BR", title = "\"AW\"", desc = "Find a strange key."},
  {id = "WelcomeToSalem", brain = "MID_Ach_WelcomeToSalem_BR", title = "Welcome to Salem", desc = "Complete the tour."},
  {id = "CurseNotTheDarkness", brain = "MID_Ach_CurseNotTheDarkness_BR", title = "Curse not the darkness!", desc = "Nancy's beliefs are challenged."},
  {id = "InvestigateEverything", brain = "MID_Ach_InvestigateEverything_BR", title = "Investigate everything", desc = "Read every piece of evidence.", hidden = true},
  {id = "InvestigateEveryone", brain = "MID_Ach_InvestigateEveryone_BR", title = "Investigate everyone", desc = "Gather alibis from everyone for every crime."},
  {id = "GetStockFromL", brain = "MID_Ach_GetStockFromL_BR", title = "Get stock from L.", desc = "Decipher the coded note.", hidden = true},
  {id = "ItsRightThere", brain = "MID_Ach_ItsRightThere_BR", title = "It's right there!", desc = "Have your tea time interrupted."},
  {id = "Observant", brain = "MID_Ach_Observant_BR", title = "Observant", desc = "Complete the CCTV timeline.", hidden = true},
  {id = "ErgoErgot", brain = "MID_Ach_ErgoErgot_BR", title = "Ergo ergot", desc = "Discover the plot behind the hauntings.", hidden = true},
  {id = "OpenSesame", brain = "MID_Ach_OpenSesame_BR", title = "Open Sesame", desc = "Open a secret passage."},
  {id = "Family", brain = "MID_Ach_Family_BR", title = "Family", desc = "Solve the circle riddle.", hidden = true},
  {id = "ANarrowEscape", brain = "MID_Ach_ANarrowEscape_BR", title = "A narrow escape", desc = "Flee the ghostly terrors."},
  {id = "AnotherCaseSolved", brain = "MID_Ach_AnotherCaseSolved_BR", title = "Another case solved", desc = "Finish Midnight in Salem."},
  {id = "Breakfast", brain = "MID_Ach_Breakfast_BR", title = "Breakfast", desc = "Make way too many Johnny Cakes.", hidden = true},
  {id = "EveryonesChores", brain = "MID_Ach_EveryonesChores_BR", title = "Everyone's chores", desc = "Help Lauren in her shop.", hidden = true},
  {id = "CreepyMessage", brain = "MID_Ach_CreepyMessage_BR", title = "Creepy Message", desc = "Repair the shredded letter in Parry House.", hidden = true},
  {id = "Heritage", brain = "MID_Ach_Heritage_BR", title = "Heritage", desc = "Lauren and Teegan share the Hathorne Estate.", hidden = true},
  {id = "TheWill", brain = "MID_Ach_TheWill_BR", title = "The Will", desc = "The Hathorne House estate goes to Lauren.", hidden = true},
  {id = "MasterSleuth", brain = "MID_Ach_MasterSleuth_BR", title = "Master Sleuth", desc = "Solve all master puzzles."},
  {id = "HappyHalloween", brain = "MID_Ach_HappyHalloween_BR", title = "Happy Halloween", desc = "Carve a dozen pumpkins.", hidden = true},
  {id = "TheBook", brain = "MID_Ach_TheBook_BR", title = "The Book", desc = "The Hathorne House estate goes to the descendants of the accused.", hidden = true},
  -- standard (SEA meta awards)
  {id = "TriviaTamer", brain = "MID_Ach_TriviaTamer_BR", title = "Trivia Tamer", desc = "Correctly answer the trivia question at the end of the game.", standard = true},
  {id = "Egged", brain = "MID_Ach_Egged_BR", title = "Egged", desc = "Find the (literal) Easter Egg.", hidden = true, standard = true},
  {id = "SpoilerFree", brain = "MID_Ach_SpoilerFree_BR", title = "Spoiler Free", desc = "Solve the case without using a single hint.", standard = true},
  -- Bonus Edition
  {id = "Midnight", brain = "MID_Ach_Midnight_BR", title = "Project Midnight", desc = "Play every game on Nancy's phone.", standard = true, bonus = true}
}
