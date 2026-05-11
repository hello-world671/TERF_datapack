#store which bulb needs to be turned on
execute store result score target_bulb terf_states run data get storage terf:temp array[0][1]

scoreboard players set terminated terf_states 100
scoreboard players set current_bulb terf_states 1
execute if score target_bulb terf_states matches 0 positioned ^ ^ ^1 run function terf:entity/machines/redstone_sequencer/runtime/turn_on_bulb/raycast_all
execute if score target_bulb terf_states matches 1.. positioned ^ ^ ^1 run function terf:entity/machines/redstone_sequencer/runtime/turn_on_bulb/raycast

#continue iterating
function terf:entity/machines/redstone_sequencer/runtime/skip_and_continue