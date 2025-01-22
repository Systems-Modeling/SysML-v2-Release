standard library package Interfaces {
    doc
    /*
     * This package defines the base types for interfaces and related structural elements in the SysML language.
     */
     
    private import Connections::Connection;
    private import Connections::connections;
    private import Connections::BinaryConnection;
    private import Connections::binaryConnections;
    private import Ports::Port;
    
    private import ScalarValues::Natural;
    private import SequenceFunctions::size;
    private import SequenceFunctions::excludingAt;
    private import ControlFunctions::selectOne;
    
    private import SequenceFunctions::notEmpty;
    
    private calc def excludingOnce {
        doc
        /*
         * Return a sequence that is the same as the input sequence, but with a single
         * instance of a given value removed. The given value must be in the input sequence.
         */
        in seq[1..*] nonunique ordered; 
        in value[1] :> seq;
        
        private attribute position : Natural[1] = (1..size(seq))->selectOne{in i; seq#(i) == value};
        seq->excludingAt(position)
    }
    
    abstract interface def Interface :> Connection {
        doc
        /*
         * Interface is the most general class of links between Ports on Parts 
         * within some containing structure. Interface is the base type of all
         * InterfaceDefinitions. 
         * 
         * Transfers outgoing from any one of the participant Ports of an Interface 
         * may be targeted to one of the other participant Ports (depending on any 
         * other Interfaces in which the Port is also participating).
         */
         
        ref port :>> participant : Port [2..*] nonunique ordered {
            doc
            /*
             * The participants of an Interface must be Ports. The interfacingPorts of
             * each participant Port include all the other participants in the Interface.
             */
              
            protected ref thisParticipant :>> self;
            protected ref otherParticipants : Port [1..*] nonunique :> interfacingPorts
                default participant->excludingOnce(thisParticipant);            
        }
    }
    
    abstract interface def BinaryInterface :> Interface, BinaryConnection {
        doc
        /*
         * BinaryInterface is the most general class of links between two Ports 
         * on Parts within some containing structure. BinaryInterface is the base 
         * type of all binary InterfaceDefinitions which have exactly two ends. 
         * 
         * Transfers outgoing from each participant Port of a BinaryInterface may be 
         * targeted to the other participant Port (depending on any other Interfaces 
         * in which the Port is also participating).
         */
        
        ref port :>> Interface::participant, BinaryConnection::participant[2] nonunique ordered;
     
        end port source: Port :>> BinaryConnection::source; 
        end port target: Port :>> BinaryConnection::target;
    }
    
    abstract interface interfaces: Interface[0..*] nonunique :> connections {
        doc
        /*
         * interfaces is the base feature of all InterfaceUsages.
         */
    }
    
    abstract interface binaryInterfaces: BinaryInterface[0..*] nonunique :> interfaces, binaryConnections {
        doc
        /*
         * interfaces is the base feature of all binary InterfaceUsages.
         */
    }
}