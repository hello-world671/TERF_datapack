#reseting args and page length halts the compiler
$data modify storage terf:temp args set value {code:'$(code)'}

execute store result storage terf:temp args.character int 1 run scoreboard players get page_length terf_states
scoreboard players set page_length terf_states -1
scoreboard players set compiler_mode terf_states -1

execute store result storage terf:temp args.page int 1 run scoreboard players get page terf_states

function terf:entity/machines/redstone_sequencer/compiler/throw_args with storage terf:temp args