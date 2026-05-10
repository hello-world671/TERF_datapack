#fail if port dosent have fuel
execute if score has_fuel terf_states matches 0 run return run scoreboard players set status terf_states 3

#fail if reactor is not in overload state or shutdown failure
execute if score @s terf_data_A matches 5 run return run scoreboard players set status terf_states 5
execute if score @s terf_data_A matches 17 if score @s terf_data_E matches ..3950 if score @s terf_data_Ab matches -1 run return run scoreboard players set status terf_states 5

scoreboard players set status terf_states 4
