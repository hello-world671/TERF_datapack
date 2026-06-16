kill @e[type=item_display,tag=terf_stfr_startup_overload_beam,distance=..1]

#get coords of stfr
execute store result score x terf_states run data get entity @s Pos[0] 100
execute store result score y terf_states run data get entity @s Pos[1] 100
execute store result score z terf_states run data get entity @s Pos[2] 100

#summon temp entity
summon marker ~ ~ ~ {UUID:[I;1101100,1101101,1100001,1101111]}
#summon a second non-standard temp entity to mark center
execute at @s run summon marker ~ ~ ~ {UUID:[I;1101100,1101101,1100011,1101111]}

#set args
data modify storage terf:temp args set value {array:[0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,1f]}

#check every block of case
execute align xyz run function terf:entity/machines/stfr/visuals/volumetric_flare/check_case

#kill temp entites
kill 0010cd2c-0010-cd2d-0010-c8e10010cd37
kill 0010cd2c-0010-cd2d-0010-c8eb0010cd37