scoreboard players remove staff_terminated terf_states 1
execute if score staff_terminated terf_states matches ..0 run return fail

particle trail{color:[1,1,1],duration:1,target:[0,0,0]}
execute if block ~ ~ ~ #minecraft:air positioned ^ ^ ^.2 run return run function terf:entity/player/tool/command_block_staff/raycast_block
function terf:entity/player/tool/command_block_staff/run_command with storage terf:temp args