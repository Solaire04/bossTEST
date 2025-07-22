## this is test.tcl

set TRIAXcommands [ dict create ]
dict set TRIAXcommands readMode        command "\ "
dict set TRIAXcommands readMode        responses [dict create B "Boot mode" F "Main mode"]
dict set TRIAXcommands initMotors      command    "A"
dict set TRIAXcommands initMotors      responses [dict create o "Motors init complete"]
dict set TRIAXcommands setGMotorSpeed  command "B0,%d,%d,%d"
dict set TRIAXcommands setGMotorSpeed  responses [dict create o "Gradient motor speed set"]
dict set TRIAXcommands readGMotorSpeed command "C0"
dict set TRIAXcommands readGMotorSpeed responses [dict create "o%d,%d,%d" "G motor min steps/s,max steps/s,ramp-up time ms"]
dict set TRIAXcommands checkGMotorBusy command "E"
dict set TRIAXcommands checkGMotorBusy responses [dict create oq "Gradient motor busy" oz "Gradient motor ready"]
dict set TRIAXcommands stepGMotor      command "F0,%d"
dict set TRIAXcommands stepGMotor      responses [dict create o "Gradient move completed"]
dict set TRIAXcommands setGPosition    command "G0,%d"
dict set TRIAXcommands setGPosition    responses [dict create o "Gradient position set"]
dict set TRIAXcommands readGPosition   command "H0"
dict set TRIAXcommands readGPosition   responses [dict create "o%d" "Gradient motor step value"]
dict set TRIAXcommands setSMotorSpeed  command "g0,0,%d"
dict set TRIAXcommands setSMotorSpeed  responses [dict create o "Slit motor speed set"]
dict set TRIAXcommands readSMotorSpeed command "h0,0"
dict set TRIAXcommands readSMotorSpeed responses [dict create "o%d" "Slit motor speed value"]
dict set TRIAXcommands setSPosition    command "i,0,0,%d"
dict set TRIAXcommands setSPosition    responses [dict create o "Slit motor position set"]
dict set TRIAXcommands readSPosition   command "j0,0"
dict set TRIAXcommands readSPosition   responses [dict create "o%d" "Slit motor position value"]
dict set TRIAXcommands stepSMotor      command "k0,0,%d"
dict set TRIAXcommands stepSMotor      responses [dict create o "Slit move completed"]

dict for {cmd info} $TRIAXcommands {
  puts "Command: $cmd"
  dict with info {
    puts "  Send : \"$command\""
    foreach r [dict keys $responses] { puts "  Recv : $r --> [dict get $responses $r]" }
    }
  }

exit
