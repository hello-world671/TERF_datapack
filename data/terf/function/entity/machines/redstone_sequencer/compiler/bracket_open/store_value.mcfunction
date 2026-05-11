#if value is empty, make it 0
data modify storage terf:temp temp set from storage terf:temp args.value
execute store success score succeeded terf_states run data modify storage terf:temp temp set value ""
execute if score succeeded terf_states matches 0 run data modify storage terf:temp args.value set value 0

#add to instruction string
$data modify storage terf:temp args.content set value '$(content)$(value),['

#reset
data modify storage terf:temp args.value set value ''
scoreboard players set compiler_mode terf_states 0
