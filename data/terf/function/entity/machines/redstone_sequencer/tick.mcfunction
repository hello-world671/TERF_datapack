execute if block ^ ^ ^-1 redstone_lamp[lit=false] run return run tag @s remove terf_powered
data modify entity @s[tag=!terf_powered] data.terf.instruction_stream set from entity @s data.terf.instructions
tag @s add terf_powered

#wait timer
execute if score @s terf_data_A matches 2.. run return run scoreboard players remove @s terf_data_A 1

scoreboard players set concurrent_instructions terf_states 0
data modify storage terf:temp array set from entity @s data.terf.instruction_stream
execute if data storage terf:temp array[0] run return run function terf:entity/machines/redstone_sequencer/runtime/iterate

# [ [1,0], [1,0], [1,0], [1,0], [1,0], [1,0], [4,4,[ [1,0], [1,0] ] ] ]