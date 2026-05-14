scoreboard players set @s terf_data_A 1
scoreboard players set @s terf_data_E 0

function terf:require/run_n_times {command:'playsound terf:charge_up.rocketlaunch master @a[distance=0..] ~ ~ ~ 10 1',n:10}

data modify storage terf:temp args set value {}

data modify storage terf:temp args.machine_id set from entity @s data.terf.machine_id

execute store result storage terf:temp args.size_x int 1 run scoreboard players get @s terf_data_U
execute store result storage terf:temp args.size_y int 1 run scoreboard players get @s terf_data_V
execute store result storage terf:temp args.size_z int 1 run scoreboard players get @s terf_data_W

execute store result storage terf:temp args.Hsize_x float 0.5 run scoreboard players get @s terf_data_U
execute store result storage terf:temp args.Hsize_y float 0.5 run scoreboard players get @s terf_data_V
execute store result storage terf:temp args.Hsize_z float 0.5 run scoreboard players get @s terf_data_W

scoreboard players operation x terf_states = @s terf_data_U
scoreboard players operation y terf_states = @s terf_data_V
scoreboard players operation z terf_states = @s terf_data_W
execute store result storage terf:temp args.size_x_add int 1 run scoreboard players add x terf_states 1
execute store result storage terf:temp args.size_y_add int 1 run scoreboard players add y terf_states 1
execute store result storage terf:temp args.size_z_add int 1 run scoreboard players add z terf_states 1

data modify storage terf:temp args2 set value {command:'function terf:entity/machines/warp_core/visuals/summon_text_displays with storage terf:temp args'}
execute store result storage terf:temp args2.x int -1 run scoreboard players get @s terf_data_R
execute store result storage terf:temp args2.y int -1 run scoreboard players get @s terf_data_S
execute store result storage terf:temp args2.z int -1 run scoreboard players get @s terf_data_T
function datapipes_lib:require/run_relative with storage terf:temp args2

scoreboard players set @s terf_data_B 0
scoreboard players set @s terf_data_C 0

playsound terf:alarms.beep5 master @a[distance=0..] ~ ~ ~ 10 1

tag @s add terf_indestructible