execute at @s positioned ~ ~-0.01 ~ align xyz if block ~ ~ ~ #terf:command_block run return run function terf:entity/player/tool/command_block_staff/set_command

data modify storage terf:temp args set from entity @s SelectedItem.components.minecraft:custom_data.terf.cmd_staff
execute if predicate datapipes_lib:pressing_sneak run data modify storage terf:temp args.command set from storage terf:temp args.command2

scoreboard players set staff_terminated terf_states 1024

tag @s add terf_cmd_staff
execute unless data storage terf:temp args.entity_only positioned ^-.17 ^.13 ^.1 run function terf:entity/player/tool/command_block_staff/raycast_block
execute if data storage terf:temp args.entity_only positioned ^-.17 ^.13 ^.1 run function terf:entity/player/tool/command_block_staff/raycast_entity
tag @s remove terf_cmd_staff
