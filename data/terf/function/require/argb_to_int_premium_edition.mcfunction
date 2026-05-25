$scoreboard players set a terf_states $(a)
$scoreboard players set r terf_states $(r)
$scoreboard players set g terf_states $(g)
$scoreboard players set b terf_states $(b)

execute if score a terf_states matches ..-1 run scoreboard players set a terf_states 0
execute if score r terf_states matches ..-1 run scoreboard players set r terf_states 0
execute if score g terf_states matches ..-1 run scoreboard players set g terf_states 0
execute if score b terf_states matches ..-1 run scoreboard players set b terf_states 0

execute if score a terf_states matches 256.. run scoreboard players set a terf_states 255
execute if score r terf_states matches 256.. run scoreboard players set r terf_states 255
execute if score g terf_states matches 256.. run scoreboard players set g terf_states 255
execute if score b terf_states matches 256.. run scoreboard players set b terf_states 255

scoreboard players operation a terf_states *= 16777216 terf_states
scoreboard players operation r terf_states *= 65536 terf_states
scoreboard players operation g terf_states *= 256 terf_states

scoreboard players operation value terf_states = a terf_states
scoreboard players operation value terf_states += r terf_states
scoreboard players operation value terf_states += g terf_states
scoreboard players operation value terf_states += b terf_states

execute store result entity @s item.components.minecraft:custom_model_data.colors[0] int 1 run scoreboard players get value terf_states