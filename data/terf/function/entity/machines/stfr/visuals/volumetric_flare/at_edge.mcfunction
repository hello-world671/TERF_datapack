##check if both vertexes are clear
execute if function terf:entity/machines/stfr/visuals/volumetric_flare/is_vertex_clear run return fail
execute positioned ^ ^ ^1 if function terf:entity/machines/stfr/visuals/volumetric_flare/is_vertex_clear run return fail

##corner 1 extruded relative position
execute facing entity 0010cd2c-0010-cd2d-0010-c8eb0010cd37 feet run tp 0010cd2c-0010-cd2d-0010-c8e10010cd37 ^ ^ ^-32
data modify storage terf:temp temp set from entity 0010cd2c-0010-cd2d-0010-c8e10010cd37
execute store result score x2 terf_states run data get storage terf:temp temp.Pos[0] 100
execute store result score y2 terf_states run data get storage terf:temp temp.Pos[1] 100
execute store result score z2 terf_states run data get storage terf:temp temp.Pos[2] 100

execute store result storage terf:temp args.array[0] float 0.01 run scoreboard players operation x2 terf_states -= x terf_states
execute store result storage terf:temp args.array[4] float 0.01 run scoreboard players operation y2 terf_states -= y terf_states
execute store result storage terf:temp args.array[8] float 0.01 run scoreboard players operation z2 terf_states -= z terf_states

##corner 2 extruded relative position
execute positioned ^ ^ ^1 facing entity 0010cd2c-0010-cd2d-0010-c8eb0010cd37 feet run tp 0010cd2c-0010-cd2d-0010-c8e10010cd37 ^ ^ ^-32
data modify storage terf:temp temp set from entity 0010cd2c-0010-cd2d-0010-c8e10010cd37
execute store result score x2 terf_states run data get storage terf:temp temp.Pos[0] 100
execute store result score y2 terf_states run data get storage terf:temp temp.Pos[1] 100
execute store result score z2 terf_states run data get storage terf:temp temp.Pos[2] 100

execute store result storage terf:temp args.array[1] float 0.01 run scoreboard players operation x2 terf_states -= x terf_states
execute store result storage terf:temp args.array[5] float 0.01 run scoreboard players operation y2 terf_states -= y terf_states
execute store result storage terf:temp args.array[9] float 0.01 run scoreboard players operation z2 terf_states -= z terf_states

scoreboard players operation temp terf_states = @s terf_data_Af
execute at 0010cd2c-0010-cd2d-0010-c8eb0010cd37 summon item_display run function terf:entity/machines/stfr/visuals/volumetric_flare/triangle_summon with storage terf:temp args