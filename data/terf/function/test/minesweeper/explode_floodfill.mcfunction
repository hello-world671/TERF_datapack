execute if data block ~ ~ ~ {UpdateLastExecution:0b} run setblock ~ ~1 ~ tnt
setblock ~ ~ ~ bedrock
effect give @a[distance=..10] minecraft:resistance 15 255 true
execute positioned ~1 ~ ~ if block ~ ~ ~ command_block run function terf:test/minesweeper/explode_floodfill
execute positioned ~-1 ~ ~ if block ~ ~ ~ command_block run function terf:test/minesweeper/explode_floodfill
execute positioned ~ ~ ~1 if block ~ ~ ~ command_block run function terf:test/minesweeper/explode_floodfill
execute positioned ~ ~ ~-1 if block ~ ~ ~ command_block run function terf:test/minesweeper/explode_floodfill
