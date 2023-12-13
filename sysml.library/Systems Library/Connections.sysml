standard library package Connections {
    doc
    /*
     * This package defines the base types for connections and related structural elements 
     * in the SysML language.
     */

    private import Base::Anything;
    private import Occurrences::Occurrence;
    private import Occurrences::HappensDuring;
    private import Objects::LinkObject;
    private import Objects::linkObjects;
    private import Objects::BinaryLinkObject;
    private import Objects::binaryLinkObjects;
    private import Transfers::Transfer;
    private import Transfers::transfers;
    private import Transfers::FlowTransfer;
    private import Transfers::flowTransfers;
    private import Transfers::FlowTransferBefore;
    private import Transfers::flowTransfersBefore;
    private import ScalarValues::Natural;
    private import Parts::Part;
    private import Parts::parts;
    private import Actions::Action;
    private import Actions::actions;

    abstract connection def Connection :> LinkObject, Part {
        doc
        /*
         * Connection is the most general class of links between things within some 
         * containing structure. Connection is the base type of all ConnectionDefinitions.
         */
    }
     
    abstract connection def BinaryConnection :> Connection, BinaryLinkObject {
        doc
        /*
         * BinaryConnection is the most general class of binary links between two things 
         * within some containing structure. BinaryConnection is the base type of all 
         * ConnectionDefinitions with exactly two ends.
         */
    
        end source: Anything[0..*] :>> BinaryLinkObject::source;
        end target: Anything[0..*] :>> BinaryLinkObject::target;
    }
    
    abstract flow def MessageConnection :> BinaryConnection, Transfer, Action {
        doc
        /*
         * MessageConnection is the class of binary connections that represent a transfer 
         * of objects or values between two occurrences. It is the base type of all
         * FlowConnectionDefinitions.
         */
    
        end occurrence source: Occurrence[0..*] :>> BinaryConnection::source, Transfer::source;
        end occurrence target: Occurrence[0..*] :>> BinaryConnection::target, Transfer::target;
        
        ref payload :>> 'item';
        
        private ref part thisConnection = self;
        
        in event occurrence sourceEvent [1] default thisConnection.start {
            doc
            /* 
             * An occurrence happening during the source of this flow connection
             * that is either the start of the connection or happens before it.
             */
        }
        in event occurrence targetEvent [1] default thisConnection.done {
            doc
            /* 
             * An occurrence happening during the target of this flow connection
             * that is either the end of the connection or happens after it.
             */
        }
        
        connection :HappensDuring connect sourceEvent to source[1];
        connection :HappensDuring connect targetEvent to target[1];
        
        private attribute seBeforeNum: Natural[1] = if sourceEvent==thisConnection.start ? 0 else 1;
        private attribute teAfterNum: Natural[1] = if targetEvent==thisConnection.done ? 0 else 1;
        succession [seBeforeNum] first sourceEvent[0..1] then self[0..1];
        succession [teAfterNum] first self[0..1] then targetEvent[0..1];
    }
    
    abstract flow def FlowConnection :> MessageConnection, FlowTransfer {
        doc
        /*
         * FlowConnection is the subclass of message connections that a alsow flow transfers.
         * It is the base type for FlowConnectionUsages that identify their source output and
         * target input.
         */
        
        end occurrence source: Occurrence[0..*] :>> MessageConnection::source, FlowTransfer::source;
        end occurrence target: Occurrence[0..*] :>> MessageConnection::target, FlowTransfer::target;
    }
    
    abstract flow def SuccessionFlowConnection :> FlowConnection, FlowTransferBefore {
        doc
        /*
         * SuccessionFlowConnection is the subclass of flow connections that represent 
         * temporally ordered transfers. It is the base type for all SuccessionFlowConnectionUsages.
         */
    
        end occurrence source: Occurrence[0..*] :>> FlowConnection::source, FlowTransferBefore::source;
        end occurrence target: Occurrence[0..*] :>> FlowConnection::target, FlowTransferBefore::target;
    }
    
    abstract connection connections: Connection[0..*] nonunique :> linkObjects, parts {
        doc
        /*
         * connections is the base feature of all ConnectionUsages.
         */
    }
    
    abstract connection binaryConnections: Connection[0..*] nonunique :> connections, binaryLinkObjects {
        doc
        /*
         * binaryConnections is the base feature of all binary ConnectionUsages.
         */
    }
    
    abstract message messageConnections: MessageConnection[0..*] nonunique :> binaryConnections, transfers, actions {
        doc
        /*
         * messageConnections is the base feature of all FlowConnectionUsages.
         */
    
        end occurrence source: Occurrence[0..*] :>> MessageConnection::source, binaryConnections::source, transfers::source;
        end occurrence target: Occurrence[0..*] :>> MessageConnection::target, binaryConnections::target, transfers::target;
    }
    
    abstract message flowConnections: FlowConnection[0..*] nonunique :> messageConnections, flowTransfers {
        doc
        /*
         * flowConnections is the base feature of all FlowConnectionUsages that identify their source output
         * and target input.
         */
    
        end occurrence source: Occurrence[0..*] :>> FlowConnection::source, messageConnections::source, flowTransfers::source;
        end occurrence target: Occurrence[0..*] :>> FlowConnection::target, messageConnections::target, flowTransfers::target;
    }
    
    abstract message successionFlowConnections: SuccessionFlowConnection[0..*] nonunique :> flowConnections, flowTransfersBefore {
        doc
        /*
         * successionFlowConnections is the base feature of all SuccessionFlowConnectionUsages.
         */
    
        end occurrence source: Occurrence[0..*] :>> SuccessionFlowConnection::source, flowConnections::source, flowTransfersBefore::source;
        end occurrence target: Occurrence[0..*] :>> SuccessionFlowConnection::target, flowConnections::target, flowTransfersBefore::target;
    }
}