function terf:autokick

execute if score @s terf_data_E matches 0.. run scoreboard players add @s terf_data_E 1
function terf:entity/machines/stfr/calculations/tick

#control panel
scoreboard players set T2 terf_states 1
execute if score @s terf_data_E matches 236.. run function terf:entity/machines/stfr/states/startup_overload/screens
execute unless score @s terf_data_E matches 200..5945 unless score @s terf_data_E matches -1 run data modify storage terf:temp displays.group_main[] set value {messages:["","","",""]}
execute unless score @s terf_data_E matches 200..5945 unless score @s terf_data_E matches -1 run data modify storage terf:temp displays.group_core[] set value {messages:["","","",""]}
execute unless score @s terf_data_E matches 200..5945 unless score @s terf_data_E matches -1 run data modify storage terf:temp displays.structure[] set value {messages:["","","",""]}

execute if score @s terf_data_E matches 200..216 run data modify storage terf:temp displays.group_main[] set value {has_glowing_text:1b,color:red,messages:["⚠ Critical Error","","",""]}
execute if score @s terf_data_E matches 200..216 run data modify storage terf:temp displays.group_core[] set value {has_glowing_text:1b,color:red,messages:["⚠ Critical Error","","",""]}
execute if score @s terf_data_E matches 200..216 run data modify storage terf:temp displays.structure[] set value {has_glowing_text:1b,color:red,messages:["⚠ Critical Error","","",""]}

execute if score @s terf_data_E matches 216..232 run data modify storage terf:temp displays.group_main[] set value {has_glowing_text:1b,color:red,messages:["⚠ Critical Error","",{text:"Initializing",color:red},{text:"Failsafe...",color:red}]}
execute if score @s terf_data_E matches 216..232 run data modify storage terf:temp displays.group_core[] set value {has_glowing_text:1b,color:red,messages:["⚠ Critical Error","",{text:"Initializing",color:red},{text:"Failsafe...",color:red}]}
execute if score @s terf_data_E matches 216..232 run data modify storage terf:temp displays.structure[] set value {has_glowing_text:1b,color:red,messages:["⚠ Critical Error","",{text:"Initializing",color:red},{text:"Failsafe...",color:red}]}

execute if score @s terf_data_E matches 232..236 run data modify storage terf:temp displays.group_main[] set value {has_glowing_text:1b,color:red,messages:["","Loading...","",""]}
execute if score @s terf_data_E matches 232..236 run data modify storage terf:temp displays.group_core[] set value {has_glowing_text:1b,color:red,messages:["","Loading...","",""]}
execute if score @s terf_data_E matches 232..236 run data modify storage terf:temp displays.structure[] set value {has_glowing_text:1b,color:red,messages:["","Loading...","",""]}

#process visuals
scoreboard players set stabilizer_rotation_duration terf_states 3
scoreboard players add @s terf_data_V 250
function terf:entity/machines/stfr/visuals/stabilizer/stabilizer_shield_beam_tick
function terf:entity/machines/stfr/visuals/stabilizer/stabilizer_power_beam_tick
function terf:entity/machines/stfr/visuals/stabilizer/rotation/rotate_stabilizers with entity @s data.terf
execute if score @s terf_data_E matches ..1980 run function terf:entity/machines/stfr/visuals/core/tick
execute if score @s terf_data_E matches ..1980 run function terf:entity/machines/stfr/visuals/shield/tick

execute if predicate datapipes_lib:chances/1 run function terf:entity/machines/stfr/states/startup_overload/break_stabilizer_rotation

execute if score @s[tag=terf_stab1] terf_data_E matches 483.. run particle minecraft:large_smoke ~ ~6 ~ 0 0 0 0.2 10 force
execute if score @s[tag=terf_stab6] terf_data_E matches 483.. run particle minecraft:large_smoke ~ ~-6 ~ 0 0 0 0.2 10 force
execute if score @s[tag=terf_stab2] terf_data_E matches 483.. run particle minecraft:large_smoke ~ ~ ~6 0 0 0 0.2 10 force
execute if score @s[tag=terf_stab4] terf_data_E matches 483.. run particle minecraft:large_smoke ~ ~ ~-6 0 0 0 0.2 10 force
execute if score @s[tag=terf_stab5] terf_data_E matches 483.. run particle minecraft:large_smoke ~-6 ~ ~ 0 0 0 0.2 10 force
execute if score @s[tag=terf_stab3] terf_data_E matches 483.. run particle minecraft:large_smoke ~6 ~ ~ 0 0 0 0.2 10 force

execute if score @s terf_data_E matches 236.. run function terf:entity/machines/stfr/visuals/stabilizer/rod_animation_step

execute store result score temp terf_states run random value 3000..4000
data modify storage terf:temp args set value {arg1:'execute as @e[type=minecraft:item_display,tag=terf_stfr_so_beam,tag=terf_related_',arg3:'] run function terf:entity/machines/stfr/states/startup_overload/as_beam'}
data modify storage terf:temp args.arg2 set from entity @s data.terf.machine_id
execute if score @s terf_data_E matches 783.. run function datapipes_lib:require/with_args/3 with storage terf:temp args

#will be put into the global ticking system anyways
execute if score @s terf_data_E matches 3615..5845 summon marker run function terf:entity/machines/stfr/states/startup_overload/particle_beam_summon
execute as @e[type=minecraft:marker,tag=terf_overload_beam,y=0] at @s run function terf:entity/machines/stfr/states/startup_overload/as_particle_beams

#process sounds
playsound minecraft:block.sculk.charge master @a[distance=0..] ~ ~ ~ 5 0

##start messages
execute if score @s terf_data_E matches 200 run playsound terf:music.rudolve_critical_error ui @a[distance=..256,tag=!terf_disable_music] ~ ~ ~ 100000
execute if score @s terf_data_E matches 200 run function terf:entity/player/title_music {music:"RudolVe - Critical Error"}

execute if score @s terf_data_E matches 236 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.startup_overload.options',level:4,text:'{"text":"SHIELD CREATION FAILURE! CORE DETONATION IMMINENT!","color":"red"}'}
execute if score @s terf_data_E matches 236..336 run function terf:entity/machines/stfr/visuals/stabilizer/rotor_particles/steam_ejection

#available options messages
execute if score @s terf_data_E matches 375 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'none',level:1,text:'{"text":"Calculating Avaliable Options...","color":"red"}'}

execute if score @s terf_data_E matches 506 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'none',level:1,text:'{"text":"To restabilize the reactor:","color":"red"}'}
execute if score @s terf_data_E matches 507 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'none',level:1,text:'{"text":"Connect up at least 4 stabilizers","color":"gold"}'}
execute if score @s terf_data_E matches 508 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'none',level:1,text:'{"text":"to the power grid and give","color":"gold"}'}
execute if score @s terf_data_E matches 509 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'none',level:1,text:'{"text":"each AT LEAST 100MW","color":"gold"}'}
execute if score @s terf_data_E matches 510 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'none',level:1,text:'{"text":"DO NOT:","color":"yellow"}'}
execute if score @s terf_data_E matches 511 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'none',level:1,text:'{"text":"- connect the stabilizers that are","color":"red"}'}
execute if score @s terf_data_E matches 512 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'none',level:1,text:'{"text":"connected to the cooling system,","color":"red"}'}
execute if score @s terf_data_E matches 513 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'none',level:1,text:'{"text":"this would halt power generation!","color":"red"}'}
execute if score @s terf_data_E matches 514 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'none',level:1,text:'{"text":"- connect the stabilizers to the","color":"red"}'}
execute if score @s terf_data_E matches 515 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'none',level:1,text:'{"text":"breakers output!","color":"red"}'}
execute if score @s terf_data_E matches 506..516 run playsound terf:alarms.notification master @a[distance=0..] ~ ~ ~ 8 2

execute if score @s terf_data_E matches 777 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.startup_overload.output_stable',level:1,text:'{"text":"Reactor Power Output Stable, Begin Restabilization Protocol Immediately.","color":"yellow"}'}

#open stabilizer maintenance trapdoors
execute if score @s terf_data_E matches 506 run function terf:entity/machines/stfr/actions/stabilizer/trapdoors_open/stab_s with entity @s data.terf
execute if score @s terf_data_E matches 512 run function terf:entity/machines/stfr/actions/stabilizer/trapdoors_open/stab_e with entity @s data.terf
execute if score @s terf_data_E matches 526 run function terf:entity/machines/stfr/actions/stabilizer/trapdoors_open/stab_n with entity @s data.terf
execute if score @s terf_data_E matches 529 run function terf:entity/machines/stfr/actions/stabilizer/trapdoors_open/stab_w with entity @s data.terf
execute if score @s terf_data_E matches 531 run function terf:entity/machines/stfr/actions/stabilizer/trapdoors_open/stab_u with entity @s data.terf
execute if score @s terf_data_E matches 537 run function terf:entity/machines/stfr/actions/stabilizer/trapdoors_open/stab_d with entity @s data.terf

#explosion countdown messages
execute if score @s terf_data_E matches 1385 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.startup_overload.detonation_3.5m',level:2,text:'{"text":"\\u26a0\\u26a0\\u26a0 REACTOR DETONATION IN T~3.5 MINUTES \\u26a0\\u26a0\\u26a0","color":"dark_red"}'}
execute if score @s terf_data_E matches 1990 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.startup_overload.detonation_3m',level:2,text:'{"text":"\\u26a0\\u26a0\\u26a0 REACTOR DETONATION IN T~3 MINUTES \\u26a0\\u26a0\\u26a0","color":"dark_red"}'}
execute if score @s terf_data_E matches 3075 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.startup_overload.detonation_2m',level:2,text:'{"text":"\\u26a0\\u26a0\\u26a0 REACTOR DETONATION IN T~2 MINUTES \\u26a0\\u26a0\\u26a0","color":"dark_red"}'}
execute if score @s terf_data_E matches 4155 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.startup_overload.detonation_1.5m',level:2,text:'{"text":"\\u26a0\\u26a0\\u26a0 REACTOR DETONATION IN T~1.5 MINUTES \\u26a0\\u26a0\\u26a0","color":"dark_red"}'}
execute if score @s terf_data_E matches 4695 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.startup_overload.detonation_1m',level:2,text:'{"text":"\\u26a0\\u26a0\\u26a0 REACTOR DETONATION IN T~1 MINUTE \\u26a0\\u26a0\\u26a0","color":"dark_red"}'}
execute if score @s terf_data_E matches 5240 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.startup_overload.detonation_30s',level:2,text:'{"text":"\\u26a0\\u26a0\\u26a0 REACTOR DETONATION IN T~30 SECONDS \\u26a0\\u26a0\\u26a0","color":"dark_red"}'}

##shield bombaclahs
execute if score @s terf_data_E matches 5 run function terf:entity/machines/stfr/states/overload/shield_explosion_beams/tick_beams with entity @s data.terf
execute if score @s terf_data_E matches 105 run function terf:entity/machines/stfr/states/overload/shield_explosion_beams/kill_beams with entity @s data.terf

#
execute if score @s terf_data_E matches 2010 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'none',level:3,text:'{"text":"Stage-I Internal Shield (Beta) Failure!","color":"red"}'}
execute if score @s terf_data_E matches 1990 run function terf:entity/machines/stfr/states/startup_overload/shield_explosion
execute if score @s terf_data_E matches 1990 run function terf:entity/machines/stfr/visuals/volumetric_flare/start
execute if score @s terf_data_E matches 1995 run function terf:entity/machines/stfr/states/overload/shield_explosion_beams/tick_beams with entity @s data.terf
execute if score @s terf_data_E matches 2090 run function terf:entity/machines/stfr/states/overload/shield_explosion_beams/kill_beams with entity @s data.terf

execute if score @s terf_data_E matches 2010..2110 run function terf:entity/machines/stfr/visuals/stabilizer/rotor_particles/steam_ejection
scoreboard players operation temp terf_states = @s terf_data_E
scoreboard players remove temp terf_states 2010
execute if score temp terf_states matches 101.. run scoreboard players set temp terf_states 100
execute if score temp terf_states matches 1.. run scoreboard players operation @s terf_data_V += temp terf_states

#
execute if score @s terf_data_E matches 3345 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'none',level:3,text:'{"text":"Stage-II Internal Shield Intensity Critical!","color":"red"}'}
execute if score @s terf_data_E matches 3630 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'none',level:3,text:'{"text":"Stage-II Internal Shield (Gamma) Failure! Major Damage To Reactor Systems Detected","color":"red"}'}
execute if score @s terf_data_E matches 3610 run function terf:entity/machines/stfr/actions/case/explosion
execute if score @s terf_data_E matches 3610 run function terf:entity/machines/stfr/visuals/volumetric_flare/start
execute if score @s terf_data_E matches 3610 run function terf:entity/machines/stfr/states/startup_overload/shield_explosion
execute if score @s terf_data_E matches 3615 run function terf:entity/machines/stfr/states/overload/shield_explosion_beams/tick_beams with entity @s data.terf
execute if score @s terf_data_E matches 3710 run function terf:entity/machines/stfr/states/overload/shield_explosion_beams/kill_beams with entity @s data.terf

execute if score @s terf_data_E matches 3630..3730 run function terf:entity/machines/stfr/visuals/stabilizer/rotor_particles/steam_ejection
scoreboard players operation temp terf_states = @s terf_data_E
scoreboard players remove temp terf_states 3630
execute if score temp terf_states matches 101.. run scoreboard players set temp terf_states 100
execute if score temp terf_states matches 1.. run scoreboard players operation @s terf_data_V += temp terf_states

#
execute if score @s terf_data_E matches 5965 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'none',level:4,text:'{"text":"Stage-III Internal Shield (Delta) Failure! Brace For Impact!","color":"dark_red"}'}
execute if score @s terf_data_E matches 5945 run function terf:entity/machines/stfr/states/startup_overload/shield_explosion
execute if score @s terf_data_E matches 5950 run function terf:entity/machines/stfr/states/overload/shield_explosion_beams/tick_beams with entity @s data.terf
execute if score @s terf_data_E matches 6045 run function terf:entity/machines/stfr/states/overload/shield_explosion_beams/kill_beams with entity @s data.terf
execute if score @s terf_data_E matches 5965.. run function terf:entity/machines/stfr/visuals/stabilizer/rotor_particles/steam_ejection
scoreboard players operation temp terf_states = @s terf_data_E
scoreboard players remove temp terf_states 5965
execute if score temp terf_states matches 1.. run scoreboard players operation @s terf_data_V += temp terf_states

execute if score @s terf_data_E matches 6005 run title @a[distance=..50] times 15s 1s 1s
execute if score @s terf_data_E matches 6005 run title @a[distance=..50] title "\ueff4"
execute if score @s terf_data_E matches 5945.. if score @s terf_data_Af matches ..253 run scoreboard players add @s terf_data_Af 1
execute if score @s terf_data_E matches 5945.. run function terf:require/run_n_times {n:5,command:'playsound terf:charge_up.corestartup master @a[distance=0..] ~ ~ ~ 10 2'}
execute if score @s terf_data_E matches 5975.. run function terf:require/run_n_times {n:5,command:'playsound terf:charge_up.heavy_startup master @a[distance=0..] ~ ~ ~ 10 2'}
execute if score @s terf_data_E matches 6105 run stopsound @a[distance=..160]
execute if score @s terf_data_E matches 6105.. run function terf:entity/machines/stfr/states/detonation/detonate_reactor

#glow
execute if score @s terf_data_E matches 1990 run scoreboard players set @s terf_data_Af 120
execute if score @s terf_data_E matches 1990..2040 run scoreboard players remove @s terf_data_Af 1

execute if score @s terf_data_E matches 3615 run scoreboard players set @s terf_data_Af 150
execute if score @s terf_data_E matches 3615..3695 run scoreboard players remove @s terf_data_Af 1

#scoreboard players operation temp terf_states = @s terf_data_E
#scoreboard players operation temp terf_states %= 30 terf_states
#execute if score @s terf_data_E matches 3615..5945 if score temp terf_states matches 0 run scoreboard players add @s terf_data_Af 1

scoreboard players operation temp terf_states = @s terf_data_Af
execute unless score @s terf_data_Ag = @s terf_data_Af as @e[type=item_display,tag=terf_stfr_startup_overload_beam] store result entity @s item.components.minecraft:custom_model_data.colors[0] int 1 run scoreboard players get temp terf_states
scoreboard players operation @s terf_data_Ag = @s terf_data_Af

#inner workings
scoreboard players set @s terf_data_P 101500000
#execute if score @s terf_data_E matches 8040.. run function terf:entity/machines/stfr/states/meltdown/start

##restabilization
execute unless score @s terf_data_E matches -1 run return run execute if score NETratetimer terf_states >= NETrate terf_states run function terf:entity/machines/stfr/states/startup_overload/slower_tick
execute if score @s terf_data_U matches 600 run function terf:entity/machines/stfr/states/startup_overload/restabilize
execute if score @s terf_data_U matches 600.. run function terf:entity/machines/stfr/states/online/tick
execute if score @s terf_data_U matches 855.. run kill @e[type=item_display,tag=terf_stfr_startup_overload_beam,distance=..1]
execute if score @s terf_data_U matches 855.. run scoreboard players set @s terf_data_A 3

execute if score @s terf_data_U matches 600.. if score @s terf_data_Af matches 1.. run scoreboard players remove @s terf_data_Af 1

#close stabilizer maintenance trapdoors
execute if score @s terf_data_U matches 200 run function terf:entity/machines/stfr/actions/stabilizer/trapdoors_close/stab_s with entity @s data.terf
execute if score @s terf_data_U matches 214 run function terf:entity/machines/stfr/actions/stabilizer/trapdoors_close/stab_e with entity @s data.terf
execute if score @s terf_data_U matches 219 run function terf:entity/machines/stfr/actions/stabilizer/trapdoors_close/stab_n with entity @s data.terf
execute if score @s terf_data_U matches 230 run function terf:entity/machines/stfr/actions/stabilizer/trapdoors_close/stab_w with entity @s data.terf
execute if score @s terf_data_U matches 235 run function terf:entity/machines/stfr/actions/stabilizer/trapdoors_close/stab_u with entity @s data.terf
execute if score @s terf_data_U matches 237 run function terf:entity/machines/stfr/actions/stabilizer/trapdoors_close/stab_d with entity @s data.terf
