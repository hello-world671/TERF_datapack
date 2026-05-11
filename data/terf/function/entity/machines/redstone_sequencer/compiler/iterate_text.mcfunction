function terf:entity/machines/redstone_sequencer/compiler/find_character

data modify storage terf:temp args.text set string storage terf:temp args.text 1
scoreboard players remove page_length terf_states 1
execute if score page_length terf_states matches 1.. run function terf:entity/machines/redstone_sequencer/compiler/iterate_text