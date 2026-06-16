#stop music
stopsound @a[distance=..256] * terf:music.alex_giudici_reconstructing_more_science_remix_v2

#announce error
$function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'$(voiceline)',level:5,text:'{text:"Cannot Continue Startup Sequence! ASAS Code: $(error)",color:"red"}'}
execute as @s[tag=terf_speakerconnected] run playsound terf:alarms.beep ambient @a[distance=0..] ~ ~ ~ 8 0

#stop reactor
function terf:entity/machines/stfr/actions/stabilizer/turn_off/all
function terf:entity/machines/stfr/visuals/stabilizer/all_stab_rods_off
scoreboard players set @s terf_data_A 0
scoreboard players set @s terf_data_E 0
tag @s remove terf_core_starting_alarm
tag @s remove terf_breakers_activated
tag @s add terf_low_core_spin

playsound terf:charge_up.heavy_shutdown ambient @a[distance=0..] ~ ~ ~ 3 1
playsound terf:charge_up.heavy_shutdown ambient @a[distance=0..] ~ ~ ~ 3 1
playsound terf:charge_up.heavy_shutdown ambient @a[distance=0..] ~ ~ ~ 3 1

#if shield is already formed, make it explode
execute if score @s terf_data_E matches 395.. run playsound terf:explosion.shieldboom ambient @a[distance=0..] ~ ~ ~ 8 1
execute if score @s terf_data_E matches 395.. run particle minecraft:end_rod ~ ~ ~ 0 0 0 2 3000 force
execute if score @s terf_data_E matches 395.. as @a[distance=..20,tag=!terf_wearing_hazmat_suit] run damage @s 5 minecraft:explosion

#open stabilizer maintenance trapdoors
function terf:entity/machines/stfr/actions/stabilizer/trapdoors_open/stab_s with entity @s data.terf
function terf:entity/machines/stfr/actions/stabilizer/trapdoors_open/stab_e with entity @s data.terf
function terf:entity/machines/stfr/actions/stabilizer/trapdoors_open/stab_n with entity @s data.terf
function terf:entity/machines/stfr/actions/stabilizer/trapdoors_open/stab_w with entity @s data.terf
function terf:entity/machines/stfr/actions/stabilizer/trapdoors_open/stab_u with entity @s data.terf
function terf:entity/machines/stfr/actions/stabilizer/trapdoors_open/stab_d with entity @s data.terf
