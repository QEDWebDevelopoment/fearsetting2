json.array! @challenges do |challenge|
  json.extract! challenge, :id, :challenge_descr, :acceptable, :cost_inaction_hy, :cost_inaction_yr, :cost_inaction_3y
end