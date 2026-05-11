data modify storage terf:temp args.character set string storage terf:temp args.text 0 1

#compiler mode 1 means comment mode, halt every other check until another / is found
execute if score compiler_mode terf_states matches 1 run return run execute unless function terf:entity/machines/redstone_sequencer/compiler/slash/check run function terf:entity/machines/redstone_sequencer/compiler/slash/found

#compiler mode 2 means store characters mode, store the characters in terf:temp args.value until a ; is found
execute if score compiler_mode terf_states matches 2 run return run function terf:entity/machines/redstone_sequencer/compiler/store_value

#if there is no special mode, check for all characters
execute unless function terf:entity/machines/redstone_sequencer/compiler/w/check run return run function terf:entity/machines/redstone_sequencer/compiler/w/found with storage terf:temp args
execute unless function terf:entity/machines/redstone_sequencer/compiler/plus/check run return run function terf:entity/machines/redstone_sequencer/compiler/plus/found with storage terf:temp args
execute unless function terf:entity/machines/redstone_sequencer/compiler/minus/check run return run function terf:entity/machines/redstone_sequencer/compiler/minus/found with storage terf:temp args
execute unless function terf:entity/machines/redstone_sequencer/compiler/l/check run return run function terf:entity/machines/redstone_sequencer/compiler/l/found with storage terf:temp args
execute unless function terf:entity/machines/redstone_sequencer/compiler/bracket_close/check run return run function terf:entity/machines/redstone_sequencer/compiler/bracket_close/found with storage terf:temp args

execute unless function terf:entity/machines/redstone_sequencer/compiler/slash/check run return run function terf:entity/machines/redstone_sequencer/compiler/slash/found with storage terf:temp args
