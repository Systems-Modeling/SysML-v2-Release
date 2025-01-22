standard library package FlowConnections {
    doc
    /*
     * This package defines the base types for flow connections and related behavioral elements 
     * in the SysML language.
     */

    private import Links::Link;
    private import Occurrences::Occurrence;
    private import Occurrences::HappensDuring;
    private import Objects::binaryLinkObjects;
    private import Transfers::Transfer;
    private import Transfers::transfers;
    private import Transfers::FlowTransfer;
    private import Transfers::flowTransfers;
    private import Transfers::FlowTransferBefore;
    private import Transfers::flowTransfersBefore;
    private import Actions::Action;
    private import Actions::actions;
    private import ScalarValues::Natural;
    
    abstract flow def MessageConnection :> Action, Link {
        doc
        /*
         * MessageConnection is the most general class of actions that represent
         * interactions between linked things. It is the base type of all
         * FlowConnectionDefinitions.
         */
         
         ref payload [0..*] {
         	doc
         	/*
         	 * A payload that may be transferred during the interaction.
         	 */
         }
    }

    abstract flow def MessageTransferConnection :> MessageConnection, Transfer {
        doc
        /*
         * MessageTransferConnection is the subclass of message connections that represent 
         * a transfer of objects or values between two occurrences. It is the base type of all
         * FlowConnectionUsages.
         */
    
        end occurrence source: Occurrence :>> Transfer::source;
        end occurrence target: Occurrence :>> Transfer::target;
        
        ref :>> payload :>> 'item';
        
        private ref action thisConnection = self;
        
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
        
        connection :HappensDuring connect sourceEvent to [1] source;
        connection :HappensDuring connect targetEvent to [1] target;
        
        private attribute seBeforeNum: Natural[1] = if sourceEvent==thisConnection.start ? 0 else 1;
        private attribute teAfterNum: Natural[1] = if targetEvent==thisConnection.done ? 0 else 1;
        succession [seBeforeNum] first [0..1] sourceEvent then [0..1] self;
        succession [teAfterNum] first [0..1] self then [0..1] targetEvent;
    }
    
    abstract flow def FlowConnection :> MessageTransferConnection, FlowTransfer {
        doc
        /*
         * FlowConnection is the subclass of message connections that are also flow transfers.
         * It is the base type for FlowConnectionUsages that identify their source output and
         * target input.
         */
        
        end occurrence source: Occurrence :>> MessageTransferConnection::source, FlowTransfer::source;
        end occurrence target: Occurrence :>> MessageTransferConnection::target, FlowTransfer::target;
    }
    
    abstract flow def SuccessionFlowConnection :> FlowConnection, FlowTransferBefore {
        doc
        /*
         * SuccessionFlowConnection is the subclass of flow connections that represent 
         * temporally ordered transfers. It is the base type for all SuccessionFlowConnectionUsages.
         */
    
        end occurrence source: Occurrence :>> FlowConnection::source, FlowTransferBefore::source;
        end occurrence target: Occurrence :>> FlowConnection::target, FlowTransferBefore::target;
    }
    
    abstract message messageConnections: MessageTransferConnection[0..*] nonunique :> transfers, actions {
        doc
        /*
         * messageConnections is the base feature of all FlowConnectionUsages.
         */
    
        end occurrence source: Occurrence :>> MessageTransferConnection::source, transfers::source;
        end occurrence target: Occurrence :>> MessageTransferConnection::target, transfers::target;
    }
    
    abstract message flowConnections: FlowConnection[0..*] nonunique :> messageConnections, flowTransfers {
        doc
        /*
         * flowConnections is the base feature for FlowConnectionUsages that identify their source output
         * and target input.
         */
    
        end occurrence source: Occurrence :>> FlowConnection::source, messageConnections::source, flowTransfers::source;
        end occurrence target: Occurrence :>> FlowConnection::target, messageConnections::target, flowTransfers::target;
    }
    
    abstract message successionFlowConnections: SuccessionFlowConnection[0..*] nonunique :> flowConnections, flowTransfersBefore {
        doc
        /*
         * successionFlowConnections is the base feature of all SuccessionFlowConnectionUsages.
         */
    
        end occurrence source: Occurrence :>> SuccessionFlowConnection::source, flowConnections::source, flowTransfersBefore::source;
        end occurrence target: Occurrence :>> SuccessionFlowConnection::target, flowConnections::target, flowTransfersBefore::target;
    }
}