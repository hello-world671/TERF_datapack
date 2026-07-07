$execute unless entity @s[distance=0..$(art_blocking_distance)] run return 0
execute if data entity @s data.terf.blocking_override run return run function terf:entity/vehicle/art/beam/run_blocking_override with entity @s data.terf
function terf:entity/vehicle/art/beam/blocked_by_entity_effects
