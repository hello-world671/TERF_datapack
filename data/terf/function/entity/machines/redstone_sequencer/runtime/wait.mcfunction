#set the timer to the amount of ticks
execute store result score @s terf_data_A run data get storage terf:temp array[0][1]

#save instruction stream to run when the timer is over
data remove storage terf:temp array[0]
data modify entity @s data.terf.instruction_stream set from storage terf:temp array
