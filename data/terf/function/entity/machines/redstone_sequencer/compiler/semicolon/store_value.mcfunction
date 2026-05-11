#add to instruction string
$data modify storage terf:temp args.content set value '$(content)$(value)],'

#reset
data modify storage terf:temp args.value set value ''
scoreboard players set compiler_mode terf_states 0
