data merge entity @n[type=item] {Invulnerable:1b,PickupDelay:2,Motion:[0f,-0.125f,0f]}

execute if block ~ ~ ~ magenta_glazed_terracotta[facing=south] run return run function terf:entity/machines/conveyor/as_entity_south
execute if block ~ ~ ~ magenta_glazed_terracotta[facing=east] run return run function terf:entity/machines/conveyor/as_entity_east
execute if block ~ ~ ~ magenta_glazed_terracotta[facing=north] run return run function terf:entity/machines/conveyor/as_entity_north
function terf:entity/machines/conveyor/as_entity_west
