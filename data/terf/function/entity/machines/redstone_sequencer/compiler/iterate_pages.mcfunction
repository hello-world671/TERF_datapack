scoreboard players add page terf_states 1

data modify storage terf:temp args.text set from storage terf:temp args.pages[0].raw
execute store result score page_length terf_states run data get storage terf:temp args.text
function terf:entity/machines/redstone_sequencer/compiler/iterate_text

data remove storage terf:temp args.pages[0]
execute if data storage terf:temp args.pages[0] run function terf:entity/machines/redstone_sequencer/compiler/iterate_pages