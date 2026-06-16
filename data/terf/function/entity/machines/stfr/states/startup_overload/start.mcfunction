function terf:entity/machines/stfr/actions/stabilizer/turn_on/all
stopsound @a
stopsound @a[distance=..128] * terf:music.alex_giudici_reconstructing_more_science_remix_v2
#nahHhhhhhhhhh
stopsound @a[distance=..512] * terf:music.the_final_flash_of_existance_remix 

advancement grant @a[distance=..128] only terf:stfr/stfr_startup_failure

function terf:entity/machines/stfr/states/startup_overload/shield_explosion
playsound terf:explosion.shieldboom ambient @a[distance=0..] ~ ~ ~ 16 0

scoreboard players set @s terf_data_Af 0

scoreboard players set @s terf_data_A 12
scoreboard players set @s terf_data_E 0

data modify storage terf:temp args set value {arg1:"scoreboard players set @e[type=minecraft:marker,tag=terf_machineid_",arg3:"] terf_data_G 473"}
execute store result storage terf:temp args.arg2 int 1 run scoreboard players get @s terf_connected_mainframe
function terf:runwith_3args with storage terf:temp args

function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'none',level:5,text:'{"text":"Fusion Reactor Startup Sequence Failure! CODE: ","color":"dark_red"},{"text":"invalid_shield_density_distribution","color":"red"}'}

summon minecraft:marker ~ ~ ~ {data:{power:{checks:"if block ^ ^14 ^ red_glazed_terracotta"}},Tags:["terf_stfr_so_helper","terf_connected_stab_1","datapipes_lib_power_consumer","terf_currententity"]}
summon minecraft:marker ~ ~ ~ {data:{power:{checks:"if block ^ ^ ^14 red_glazed_terracotta"}},Tags:["terf_stfr_so_helper","terf_connected_stab_2","datapipes_lib_power_consumer","terf_currententity"]}
summon minecraft:marker ~ ~ ~ {data:{power:{checks:"if block ^14 ^ ^ red_glazed_terracotta"}},Tags:["terf_stfr_so_helper","terf_connected_stab_3","datapipes_lib_power_consumer","terf_currententity"]}
summon minecraft:marker ~ ~ ~ {data:{power:{checks:"if block ^ ^ ^-14 red_glazed_terracotta"}},Tags:["terf_stfr_so_helper","terf_connected_stab_4","datapipes_lib_power_consumer","terf_currententity"]}
summon minecraft:marker ~ ~ ~ {data:{power:{checks:"if block ^-14 ^ ^ red_glazed_terracotta"}},Tags:["terf_stfr_so_helper","terf_connected_stab_5","datapipes_lib_power_consumer","terf_currententity"]}
summon minecraft:marker ~ ~ ~ {data:{power:{checks:"if block ^ ^-14 ^ red_glazed_terracotta"}},Tags:["terf_stfr_so_helper","terf_connected_stab_6","datapipes_lib_power_consumer","terf_currententity"]}

scoreboard players set @e[type=marker,tag=terf_stfr_so_helper] datapipes_lib_power_storage 0
scoreboard players set @e[type=marker,tag=terf_stfr_so_helper] datapipes_lib_power_max 10000

data modify storage terf:temp args set value {arg1:'tag @e[tag=terf_currententity] add terf_related_'}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
function datapipes_lib:require/with_args/2 with storage terf:temp args
tag @e remove terf_currententity

execute positioned ~-14 ~-14 ~-14 as @a[dx=27,dy=27,dz=27] run scoreboard players add @s terf_data_A 912362335

