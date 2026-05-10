scoreboard players remove temp terf_states 1
scoreboard players add rotation terf_states 9
$summon marker ~ ~ ~ {Tags:["terf_related_$(arg2)","terf_axuillery_shield_formation","terf_currententity"],Rotation:[$(arg1),0f]}
execute store result score @e[type=marker,tag=terf_currententity,limit=1] terf_data_A run random value 0..45
scoreboard players operation pitch terf_states = @e[type=marker,tag=terf_currententity,limit=1] terf_data_A
scoreboard players operation pitch terf_states *= 4 terf_states
scoreboard players remove pitch terf_states 90
execute store result entity @e[type=marker,tag=terf_currententity,limit=1] Rotation[1] float 1 run scoreboard players get pitch terf_states
tag @e[type=marker,tag=terf_currententity] remove terf_currententity
execute store result storage terf:temp args.arg1 float 1 run scoreboard players get rotation terf_states
execute if score temp terf_states matches 1.. run function terf:entity/machines/stfr/states/manual_restabilization/axuillery_shield_formation/summon with storage terf:temp args
