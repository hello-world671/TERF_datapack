#disabled until a fix is found for coordinate exploit
return 1
execute if score @s terf_connected_mainframe = calc terf_states at @s positioned ~ ~-1 ~ run function terf:entity/machines/redstone_probe/at_bulbs
