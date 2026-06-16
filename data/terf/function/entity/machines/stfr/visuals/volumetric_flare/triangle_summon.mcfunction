data merge entity @s {Tags:["terf_stfr_startup_overload_beam"],item:{id:"minecraft:carrot_on_a_stick",components:{item_model:"terf:visual/triangle",custom_model_data:{colors:[0]}}}}
data modify entity @s transformation set from storage terf:temp args.array
execute store result entity @s item.components.minecraft:custom_model_data.colors[0] int 1 run scoreboard players get temp terf_states