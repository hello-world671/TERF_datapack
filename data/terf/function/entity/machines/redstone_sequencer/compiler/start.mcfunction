#the raw instruction data looks like
# [[0,2],[1,2],[0,2],[2,5,[[0,2],[3,20],[1,2]]]]

execute if data block ~ ~ ~ {Book:{id:"minecraft:writable_book"}} unless data block ~ ~ ~ Book.components.minecraft:writable_book_content run function terf:entity/machines/redstone_sequencer/compiler/insert_example_book

data remove entity @s data.terf.error

scoreboard players set compiler_mode terf_states 0
scoreboard players set page terf_states 0

data modify storage terf:temp args set value {content:'',value:''}
data modify storage terf:temp args.pages set from block ~ ~ ~ Book.components.minecraft:writable_book_content.pages
data modify storage terf:temp args.pages set from block ~ ~ ~ Book.components.minecraft:written_book_content.pages

execute if data storage terf:temp args.pages[0] run function terf:entity/machines/redstone_sequencer/compiler/iterate_pages
execute unless score compiler_mode terf_states matches 0 run playsound terf:alarms.computer_error master @a ~ ~ ~ 0.1 2
execute if score compiler_mode terf_states matches 1 run return run data modify entity @s data.terf.error set value 'Comment never closed'
execute if score compiler_mode terf_states matches 2 run return run data modify entity @s data.terf.error set value 'End missing semicolon'
execute if score compiler_mode terf_states matches -1 run return fail

scoreboard players set succeeded terf_states 0
function terf:entity/machines/redstone_sequencer/compiler/finish with storage terf:temp args

execute if score succeeded terf_states matches 0 run return run data modify entity @s data.terf.error set value 'Unknown error: Macro input not an array'
playsound terf:alarms.computer_correct master @a ~ ~ ~ 0.1 2