tag @s add terf_powered
execute unless data entity @s data.terf.instructions run return run playsound terf:alarms.computer_crash master @a[distance=0..] ~ ~ ~ 0.1 2

playsound terf:alarms.computer_beep master @a[distance=0..] ~ ~ ~ 0.1 2

data modify entity @s data.terf.instruction_stream set from entity @s data.terf.instructions
scoreboard players set @s terf_data_A 0
