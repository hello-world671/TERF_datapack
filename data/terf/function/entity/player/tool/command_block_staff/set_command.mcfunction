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

tellraw @s ""

#set command
execute unless data block ~ ~ ~ {Command:""} unless predicate datapipes_lib:pressing_sneak run data modify entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:custom_data.terf.cmd_staff.command set from block ~ ~ ~ Command
execute unless data block ~ ~ ~ {Command:""} unless predicate datapipes_lib:pressing_sneak run tellraw @s ["[", {text:"CMD Staff",color:"#cca389"}, '] Set primary command to: "', {"nbt":"item.components.minecraft:custom_data.terf.cmd_staff.command","entity":"0010ccd2-0010-cd37-0010-cd360010c8e1"}, '"']
execute unless data block ~ ~ ~ {Command:""} if predicate datapipes_lib:pressing_sneak run data modify entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:custom_data.terf.cmd_staff.command2 set from block ~ ~ ~ Command
execute unless data block ~ ~ ~ {Command:""} if predicate datapipes_lib:pressing_sneak run tellraw @s ["[", {text:"CMD Staff",color:"#cca389"}, '] Set secondary command to: "', {"nbt":"item.components.minecraft:custom_data.terf.cmd_staff.command2","entity":"0010ccd2-0010-cd37-0010-cd360010c8e1"}, '"']

#set entity-only mode
execute if block ~ ~ ~ #terf:command_block[conditional=false] if data entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:custom_data.terf.cmd_staff.entity_only run tellraw @s ["[", {text:"CMD Staff",color:"#cca389"}, "] Set Entity-Only mode to: Off"]
execute if block ~ ~ ~ #terf:command_block[conditional=false] if data entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:custom_data.terf.cmd_staff.entity_only run data remove entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:custom_data.terf.cmd_staff.entity_only
execute if block ~ ~ ~ #terf:command_block[conditional=true] unless data entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:custom_data.terf.cmd_staff.entity_only run tellraw @s ["[", {text:"CMD Staff",color:"#cca389"}, "] Set Entity-Only mode to: On"]
execute if block ~ ~ ~ #terf:command_block[conditional=true] unless data entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:custom_data.terf.cmd_staff.entity_only run data modify entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:custom_data.terf.cmd_staff.entity_only set value 1

#repeating feature
execute if block ~ ~ ~ command_block if data entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:consumable run data modify entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.id set value "minecraft:carrot_on_a_stick"
execute if block ~ ~ ~ command_block if data entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:consumable run tellraw @s ["[", {text:"CMD Staff",color:"#cca389"}, "] Set repeating mode to: Off"]
execute if block ~ ~ ~ command_block if data entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:consumable run data remove entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:consumable
execute if block ~ ~ ~ repeating_command_block unless data entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:consumable run data modify entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.id set value "minecraft:recovery_compass"
execute if block ~ ~ ~ repeating_command_block unless data entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:consumable run tellraw @s ["[", {text:"CMD Staff",color:"#cca389"}, "] Set Repeating mode to: On"]
execute if block ~ ~ ~ repeating_command_block unless data entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:consumable run data modify entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:consumable set value {consume_seconds:1000000}

item replace entity @s weapon from entity 0010ccd2-0010-cd37-0010-cd360010c8e1 container.0
