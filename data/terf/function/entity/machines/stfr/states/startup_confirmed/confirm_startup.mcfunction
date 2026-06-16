execute as @s[tag=terf_speakerconnected] run playsound terf:alarms.beep2 master @a[distance=0..] ^4 ^-2 ^-2 1 1
function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.start.confirm',level:1,text:'{"text":"Reactor Startup Confirmed! Starting Reactor Systems..."},{"text":" Please Vacate The Reactor Chamber To Avoid Potential Dose!","color":"yellow"}'}

playsound terf:music.alex_giudici_reconstructing_more_science_remix_v2 ui @a[distance=0..,tag=!terf_disable_music] ~ ~ ~ 4 1
execute as @a[distance=..64] run function terf:entity/player/title_music {music:"Alex Giudici - Reconstructing More Science Remix v2"}

#set core parameters for startup
execute at @s run function terf:entity/machines/stfr/actions/stabilizer/turn_on/all
execute at @s run function terf:entity/machines/stfr/visuals/stabilizer/all_stab_rods_off

scoreboard players set @s terf_data_A 2
scoreboard players set @s terf_data_E 0
scoreboard players set @s terf_data_V 0
scoreboard players set @s terf_data_B 0
scoreboard players set @s terf_data_C 1
tag @s add terf_intensity_25
tag @s add terf_intensity_50
tag @s add terf_intensity_75
tag @s add terf_intensity_crit
tag @s remove terf_bcd_breakers
tag @s remove terf_breaker_interested
tag @s add terf_breakers_activated
