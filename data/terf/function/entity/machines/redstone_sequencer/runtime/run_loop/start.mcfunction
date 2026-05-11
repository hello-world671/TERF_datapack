#get amount of repeats
execute store result score repeats terf_states run data get storage terf:temp array[0][1]

#if out of repeats, continue iterating
execute if score repeats terf_states matches ..0 run return run function terf:entity/machines/redstone_sequencer/runtime/skip_and_continue

#otherwise, decrement repeats and prepend all stored instructions to the stack
execute store result storage terf:temp array[0][1] int 1 run scoreboard players remove repeats terf_states 1
data modify storage terf:temp array prepend from storage terf:temp array[0][2][]

#continue without skipping
execute if data storage terf:temp array[0] run return run function terf:entity/machines/redstone_sequencer/runtime/iterate
