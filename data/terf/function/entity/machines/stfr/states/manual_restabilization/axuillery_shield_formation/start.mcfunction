scoreboard players set temp terf_states 20
scoreboard players set rotation terf_states 0
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
execute store result storage terf:temp args.arg1 float 1 run scoreboard players get rotation terf_states
function terf:entity/machines/stfr/states/manual_restabilization/axuillery_shield_formation/summon with storage terf:temp args