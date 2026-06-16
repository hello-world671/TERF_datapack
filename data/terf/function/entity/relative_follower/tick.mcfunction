#teleport to player
$execute at $(player) run tp @s ~ ~ ~

#calculate relative position
execute store result score x terf_states run data get entity @s Pos[0] 100
execute store result score y terf_states run data get entity @s Pos[1] 100
execute store result score z terf_states run data get entity @s Pos[2] 100
execute store result entity @s transformation.translation[0] float -0.01 run scoreboard players operation x terf_states -= @s terf_data_X
execute store result entity @s transformation.translation[1] float -0.01 run scoreboard players operation y terf_states -= @s terf_data_Y
execute store result entity @s transformation.translation[2] float -0.01 run scoreboard players operation z terf_states -= @s terf_data_Z
