-- Midnight in Salem: area medley for an <ENV>_AMB_SC. Tags Medley_<area> by
-- day and Medley_<area>Night at night, retagging live when Flags.Night_FL flips.
function MakeMedleyTag(area)
  -- Tag right away, not on the first Run: moving between house zones swaps the ENVAMB
  -- script, and a tick with no Medley_House tag made the medley restart the song.
  local current = "Medley_" .. area .. (Flags.Night_FL and "Night" or "")
  AreaTag(current)
  return AR:Override({
    Run = function(this)
      local want = "Medley_" .. area .. (Flags.Night_FL and "Night" or "")
      if want ~= current then
        if current ~= nil then
          AreaUntag(current)
        end
        AreaTag(want)
        current = want
      end
    end
  })
end
