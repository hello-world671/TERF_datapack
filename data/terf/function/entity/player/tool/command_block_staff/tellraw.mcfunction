execute positioned ~.5 ~.5 ~.5 run function terf:entity/player/tool/fluid_id/particle {color:"1,1,0.5"}
playsound minecraft:block.end_portal_frame.fill master @a[distance=0..] ~ ~ ~ 1 1
playsound minecraft:block.end_portal_frame.fill master @a[distance=0..] ~ ~ ~ 1 1.1
playsound minecraft:block.end_portal_frame.fill master @a[distance=0..] ~ ~ ~ 1 1.2
playsound minecraft:block.end_portal_frame.fill master @a[distance=0..] ~ ~ ~ 1 1.3
playsound minecraft:block.end_portal_frame.fill master @a[distance=0..] ~ ~ ~ 1 1.4
playsound minecraft:block.end_portal_frame.fill master @a[distance=0..] ~ ~ ~ 1 1.5
playsound minecraft:block.end_portal_frame.fill master @a[distance=0..] ~ ~ ~ 1 1.6
playsound minecraft:block.end_portal_frame.fill master @a[distance=0..] ~ ~ ~ 1 1.7
playsound minecraft:block.end_portal_frame.fill master @a[distance=0..] ~ ~ ~ 1 1.8
playsound minecraft:block.end_portal_frame.fill master @a[distance=0..] ~ ~ ~ 1 1.9
playsound minecraft:block.end_portal_frame.fill master @a[distance=0..] ~ ~ ~ 1 2

item replace entity 0010ccd2-0010-cd37-0010-cd360010c8e1 container.0 from entity @s weapon

execute unless predicate datapipes_lib:pressing_sneak run data modify entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:custom_data.terf.cmd_staff.command set from block ~ ~ ~ Command
execute unless predicate datapipes_lib:pressing_sneak run tellraw @s ["[", {text:"CMD Staff",color:"#cca389"}, "] Set primary command to: "]
execute if predicate datapipes_lib:pressing_sneak run data modify entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:custom_data.terf.cmd_staff.command2 set from block ~ ~ ~ Command
execute if predicate datapipes_lib:pressing_sneak run tellraw @s "[CMD Staff] Set secondary command to:"

item replace entity @s weapon from entity 0010ccd2-0010-cd37-0010-cd360010c8e1 container.0
