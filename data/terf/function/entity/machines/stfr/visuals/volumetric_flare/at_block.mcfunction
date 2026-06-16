#check all 12 edges aka vertex pairs of the block
execute rotated 0 0 run function terf:entity/machines/stfr/visuals/volumetric_flare/at_edge
execute rotated 0 -90 run function terf:entity/machines/stfr/visuals/volumetric_flare/at_edge
execute rotated -90 0 run function terf:entity/machines/stfr/visuals/volumetric_flare/at_edge

execute positioned ~1 ~ ~1 rotated 180 0 run function terf:entity/machines/stfr/visuals/volumetric_flare/at_edge
execute positioned ~1 ~ ~1 rotated 0 -90 run function terf:entity/machines/stfr/visuals/volumetric_flare/at_edge
execute positioned ~1 ~ ~1 rotated 90 0 run function terf:entity/machines/stfr/visuals/volumetric_flare/at_edge

execute positioned ~ ~1 ~1 rotated 180 0 run function terf:entity/machines/stfr/visuals/volumetric_flare/at_edge
execute positioned ~ ~1 ~1 rotated 0 90 run function terf:entity/machines/stfr/visuals/volumetric_flare/at_edge
execute positioned ~ ~1 ~1 rotated -90 0 run function terf:entity/machines/stfr/visuals/volumetric_flare/at_edge

execute positioned ~1 ~1 ~ rotated 0 0 run function terf:entity/machines/stfr/visuals/volumetric_flare/at_edge
execute positioned ~1 ~1 ~ rotated 0 90 run function terf:entity/machines/stfr/visuals/volumetric_flare/at_edge
execute positioned ~1 ~1 ~ rotated 90 0 run function terf:entity/machines/stfr/visuals/volumetric_flare/at_edge
