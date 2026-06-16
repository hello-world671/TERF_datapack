data merge entity @s {Tags:["terf_ticked","terf_cmd_staff_ignore"],background:-16777216,billboard:vertical,brightness:{block:15,sky:0}}
data modify entity @s data.terf.on_tick set value "function terf:entity/player/tool/command_block_staff/text_display_tick"
data modify entity @s text set from storage terf:temp args.command