scoreboard players remove staff_terminated terf_states 1
execute if score staff_terminated terf_states matches ..0 run return fail

particle trail{color:[1,1,1],duration:1,target:[0,0,0]}
execute positioned ~-.5 ~-.5 ~-.5 as @e[dx=0,dy=0,dz=0,tag=!terf_cmd_staff] positioned ~.5 ~.5 ~.5 run return run function terf:entity/player/tool/command_block_staff/run_command with storage terf:temp args
execute positioned ^ ^ ^.2 if block ~ ~ ~ #minecraft:air run function terf:entity/player/tool/command_block_staff/raycast_entity
