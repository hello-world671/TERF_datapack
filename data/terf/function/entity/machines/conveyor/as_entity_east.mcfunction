data modify entity @s Motion[0] set value -0.125f
execute at @s align z if entity @s[distance=0.4..0.6] run return fail
execute at @s align z if entity @s[distance=..0.5] run return run data modify entity @s Motion[2] set value 0.125f
data modify entity @s Motion[2] set value -0.125f