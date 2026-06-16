summon marker ~ ~ ~ {UUID:[I;1101100,1101101,1100001,1101111]}
data modify storage terf:temp temp set from entity 0010cd2c-0010-cd2d-0010-c8e10010cd37 Pos
kill 0010cd2c-0010-cd2d-0010-c8e10010cd37

#get name of closest player
loot replace entity 0010ccd2-0010-cd37-0010-cd360010c8e1 container.0 loot terf:get_head
function terf:entity/relative_follower/summon with entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:profile