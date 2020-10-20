// SysML v2 Interpretation of the SysML v1 Room Connection Example
package RoomModel { 
    package RoomDefinitionModelLibrary{
        import Port_Definitions::*;
        import Flow_Definitions::*;
        package Part_Definitions{
            // Rooms
            part def Classroom {
                port classEntry: EntryWay_to_Classroom;
            }
            part def Storageroom {
                port storageEntry: EntryWay_to_Storageroom;
            }
            part def Hallway {
                // conjugate ports with ~
                port hallExit_to_Classroom: ~EntryWay_to_Classroom;
                port hallExit_to_Storageroom: ~EntryWay_to_Storageroom;
            }
        }
        package Port_Definitions{
            port def EntryWay_to_Classroom {
                //flow properties
                in ref student:Student;
                in ref teacher:Teacher;
                in ref furniture:Furniture;
                in ref air:Air;
            }
            port def EntryWay_to_Storageroom {
                //flow properties
                in ref furniture:  Furniture;
                in ref air: Air;
            }
        }
        package Flow_Definitions {
                //  Conveyed items between Hallway, Classroom, and Storageroom
                part def Air;
                part def Furniture;
                part def Student;
                part def Teacher;
        }
    }
    package Room_Configuration{
        // defining the parts and their interconnection in context 
        import RoomDefinitionModelLibrary::*;
        import RoomDefinitionModelLibrary::Part_Definitions::*;
        import RoomDefinitionModelLibrary::Port_Definitions::*;
        import RoomDefinitionModelLibrary::Flow_Definitions::*;
        part roomContext{
            part c:Classroom {
            	port classEntry redefines Classroom::classEntry {
	                in ref student redefines Classroom::classEntry::student;
	                in ref teacher redefines Classroom::classEntry::teacher;
	                in ref furniture redefines Classroom::classEntry::furniture;
	                in ref air redefines Classroom::classEntry::air;            		
            	}
            }
            part s:Storageroom {
            	port storageEntry redefines Storageroom::storageEntry{ 
	                in ref furniture redefines Storageroom::storageEntry::furniture;
	                in ref air redefines Storageroom::storageEntry::air;
            	}
            }
            part h:Hallway {
                port hallExit_to_Classroom redefines Hallway::hallExit_to_Classroom {
	                out ref student redefines Hallway::hallExit_to_Classroom::student;
	                out ref teacher redefines Hallway::hallExit_to_Classroom::teacher;
	                out ref furniture redefines Hallway::hallExit_to_Classroom::furniture;
	                out ref air redefines Hallway::hallExit_to_Classroom::air;            		
               }
                port hallExit_to_Storageroom redefines Hallway::hallExit_to_Storageroom {
	                out ref furniture redefines Hallway::hallExit_to_Storageroom::furniture;
	                out ref air redefines Hallway::hallExit_to_Storageroom::air;
                }           	
            }
            
    		//  Connectors and item flows between hallway and classroom
            stream HallToClassroom_Air
                from h::hallExit_to_Classroom::air
                to c::classEntry::air;
            stream HallToClassroom_Furniture
                from h::hallExit_to_Classroom::furniture
                to c::classEntry::furniture;
            stream HallToClassroom_Student
                from h::hallExit_to_Classroom::student
                to c::classEntry::student;
            stream HallToClassroom_Teacher
                from h::hallExit_to_Classroom::teacher
                to c::classEntry::teacher;
            stream HallToStorageroom_Air
                from h::hallExit_to_Storageroom::air
                to s::storageEntry::air;
            stream HallToStorageroom_Furniture
                from h::hallExit_to_Storageroom::furniture
                to s::storageEntry::furniture;
        }
    }
}



