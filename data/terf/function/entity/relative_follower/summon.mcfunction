$summon item_display ~ ~ ~ {Tags:["terf_ticked","terf_currententity"],data:{terf:{on_tick:'function terf:entity/relative_follower/tick {player:\'$(name)\'}'}},item:{id:"minecraft:carrot_on_a_stick",components:{item_model:"terf:visual/shader_test"}},interpolation_duration:1,teleport_duration:1}
execute store result score @n[tag=terf_currententity] terf_data_X run data get storage terf:temp temp[0] 100
execute store result score @n[tag=terf_currententity] terf_data_Y run data get storage terf:temp temp[1] 100
execute store result score @n[tag=terf_currententity] terf_data_Z run data get storage terf:temp temp[2] 100
tag @e remove terf_currententity