playsound terf:alarms.computer_crash master @a ~ ~ ~ 0.3 2

#halt runtime
data modify storage terf:temp array set value []
data modify entity @s data.terf.instruction_stream set value []
$data modify storage terf:temp args set value {code:'$(code)'}

function terf:entity/machines/redstone_sequencer/runtime/throw_args with storage terf:temp args