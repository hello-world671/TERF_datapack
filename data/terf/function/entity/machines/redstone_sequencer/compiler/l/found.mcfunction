#append to instruction string and switch compiler to store mode
$data modify storage terf:temp args.content set value '$(content)[3,'
scoreboard players set compiler_mode terf_states 2
