scoreboard players remove terminated terf_states 1
execute if score terminated terf_states matches ..1 run return fail
execute unless block ~ ~ ~ lectern positioned ^ ^ ^0.1 run return run function terf:entity/machines/redstone_sequencer/compiler/raycast
execute align xyz positioned ~.5 ~.5 ~.5 as @e[type=marker,tag=terf_redstone_sequencer,distance=..0.5] at @s run function terf:entity/machines/redstone_sequencer/compiler/start