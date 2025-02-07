# Create a new simulator instance
set ns [new Simulator]

# Open the NAM trace file
set nf [open out.nam w]
$ns namtrace-all $nf

# Define nodes
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]

# Create network links between nodes
$ns duplex-link $n0 $n1 1Mb 10ms DropTail
$ns duplex-link $n1 $n2 1Mb 10ms DropTail
$ns duplex-link $n2 $n3 1Mb 10ms DropTail

# Set node positions for better visualization
$ns at 0.0 "$n0 set X_ 10.0"
$ns at 0.0 "$n0 set Y_ 10.0"
$ns at 0.0 "$n1 set X_ 30.0"
$ns at 0.0 "$n1 set Y_ 10.0"
$ns at 0.0 "$n2 set X_ 50.0"
$ns at 0.0 "$n2 set Y_ 10.0"
$ns at 0.0 "$n3 set X_ 70.0"
$ns at 0.0 "$n3 set Y_ 10.0"

# Set up a UDP connection
set udp0 [new Agent/UDP]
$ns attach-agent $n0 $udp0

set null0 [new Agent/Null]
$ns attach-agent $n3 $null0

$ns connect $udp0 $null0

# Create a CBR traffic source
set cbr0 [new Application/Traffic/CBR]
$cbr0 set packetSize_ 512
$cbr0 set rate_ 100Kb
$cbr0 attach-agent $udp0

# Schedule events
$ns at 0.5 "$cbr0 start"
$ns at 4.5 "$cbr0 stop"
$ns at 5.0 "finish"

# Define a finish procedure to close the trace file and start NAM
proc finish {} {
    global ns nf
    $ns flush-trace
    close $nf
    exec nam out.nam &
    exit 0
}

# Run the simulation
$ns run
