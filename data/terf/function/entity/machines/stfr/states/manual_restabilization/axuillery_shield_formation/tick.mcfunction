# terf_data_A = animation sequence
scoreboard players add @s terf_data_A 1
rotate @s ~ ~-4
particle electric_spark ^ ^ ^2.5 0.04 0.04 0.04 0.1 5 force
particle electric_spark ^ ^ ^-2.5 0.04 0.04 0.04 0.1 5 force
execute if score @s terf_data_A matches 45.. run rotate @s ~ 90
execute if score @s terf_data_A matches 45.. run scoreboard players set @s terf_data_A 0
