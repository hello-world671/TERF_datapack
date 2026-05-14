data modify entity @s[tag=terf_warp_core_vfx_hor_top] interpolation_duration set value 30
$data modify entity @s[tag=terf_warp_core_vfx_hor_top] transformation.translation[1] set value $(Hsize_y)f
$data modify entity @s[tag=terf_warp_core_vfx_hor_top] transformation.scale[1] set value $(Usize_y)f

data modify entity @s[tag=terf_warp_core_vfx_hor_bottom] interpolation_duration set value 30
$data modify entity @s[tag=terf_warp_core_vfx_hor_bottom] transformation.translation[1] set value -$(Hsize_y)f
$data modify entity @s[tag=terf_warp_core_vfx_hor_bottom] transformation.scale[1] set value $(Usize_y)f