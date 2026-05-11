scoreboard players add concurrent_instructions terf_states 1
execute if score concurrent_instructions terf_states matches 50.. run return run function terf:entity/machines/redstone_sequencer/runtime/throw {code:"Too many instructions per tick"}

#get the instruction
execute store result score instruction terf_states run data get storage terf:temp array[0][0]

execute if score instruction terf_states matches 0 run return run function terf:entity/machines/redstone_sequencer/runtime/wait
execute if score instruction terf_states matches 1 run return run function terf:entity/machines/redstone_sequencer/runtime/turn_on_bulb/start
execute if score instruction terf_states matches 2 run return run function terf:entity/machines/redstone_sequencer/runtime/turn_off_bulb/start
execute if score instruction terf_states matches 3 run function terf:entity/machines/redstone_sequencer/runtime/run_loop/start

#the option to continue iterating without delay is within the functions above
