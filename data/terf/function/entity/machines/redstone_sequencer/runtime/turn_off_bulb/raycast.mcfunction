scoreboard players remove terminated terf_states 1
execute if score terminated terf_states matches ..0 run return fail
execute if block ~ ~ ~ #minecraft:air run return fail

execute if block ~ ~ ~ waxed_copper_bulb run scoreboard players add current_bulb terf_states 1
execute if score current_bulb terf_states > target_bulb terf_states run return run execute if block ~ ~ ~ waxed_copper_bulb[lit=true] run setblock ~ ~ ~ waxed_copper_bulb[lit=false]

execute unless block ~ ~ ~ observer positioned ^ ^ ^1 run return run function terf:entity/machines/redstone_sequencer/runtime/turn_off_bulb/raycast
execute if block ~ ~ ~ observer[facing=south] rotated 180 0 positioned ^ ^ ^1 run return run function terf:entity/machines/redstone_sequencer/runtime/turn_off_bulb/raycast
execute if block ~ ~ ~ observer[facing=north] rotated 0 0 positioned ^ ^ ^1 run return run function terf:entity/machines/redstone_sequencer/runtime/turn_off_bulb/raycast
execute if block ~ ~ ~ observer[facing=west] rotated -90 0 positioned ^ ^ ^1 run return run function terf:entity/machines/redstone_sequencer/runtime/turn_off_bulb/raycast
execute if block ~ ~ ~ observer[facing=east] rotated 90 0 positioned ^ ^ ^1 run return run function terf:entity/machines/redstone_sequencer/runtime/turn_off_bulb/raycast
execute if block ~ ~ ~ observer[facing=up] rotated 0 90 positioned ^ ^ ^1 run return run function terf:entity/machines/redstone_sequencer/runtime/turn_off_bulb/raycast
execute rotated 0 -90 positioned ^ ^ ^1 run function terf:entity/machines/redstone_sequencer/runtime/turn_off_bulb/raycast
