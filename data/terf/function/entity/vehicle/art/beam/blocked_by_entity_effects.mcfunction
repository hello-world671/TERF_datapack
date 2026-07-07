playsound terf:explosion.bang ambient @a[distance=0..] ~ ~ ~ 10 2
playsound terf:explosion.bang2 ambient @a[distance=0..] ~ ~ ~ 10 2

title @a[distance=..16,tag=!terf_epilepsy_mode] times 0t 0t 3s
title @a[distance=..16,tag=!terf_epilepsy_mode] title {"text":"\uEff4"}

particle minecraft:end_rod ~ ~ ~ 1 1 1 10 1000 force
particle minecraft:explosion ~ ~ ~ 0 0 0 10 10 force

summon minecraft:text_display ^ ^ ^-0.1 {Tags:["terf_random_vel","terf_particle","terf_large_flash"],billboard:"center",text:{"text":"\ueef2"},background:0,view_range:16,brightness:{sky:15,block:15},alignment:center}
summon minecraft:text_display ^ ^ ^-0.2 {Tags:["terf_random_vel","terf_particle","terf_small_flash"],billboard:"center",text:{"text":"\ueef2"},background:0,view_range:32,brightness:{sky:15,block:15},alignment:center}

scoreboard players set terminated terf_states 0
