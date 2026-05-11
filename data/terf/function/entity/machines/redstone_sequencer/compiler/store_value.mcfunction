#if the character is a ;
execute unless function terf:entity/machines/redstone_sequencer/compiler/semicolon/check run return run function terf:entity/machines/redstone_sequencer/compiler/semicolon/store_value with storage terf:temp args
#if the character is a [
execute unless function terf:entity/machines/redstone_sequencer/compiler/bracket_open/check run return run function terf:entity/machines/redstone_sequencer/compiler/bracket_open/store_value with storage terf:temp args

#if the character is not any of the above, store it
scoreboard players set succeeded terf_states 0
function terf:entity/machines/redstone_sequencer/compiler/store_value_args with storage terf:temp args
execute if score succeeded terf_states matches 0 run function terf:entity/machines/redstone_sequencer/compiler/throw {code:"Not a number"}