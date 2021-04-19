package 'Turbojet Stage Analysis' {
	import Quantities::ScalarQuantityValue;
	import UnitsAndScales::DimensionOneValue;
	import ISQ::*;
	
	package 'Thermodynamic Functions' {
	    calc def 'Ideal Gas Law' (in rho, in R_bar, in T) return p {
	        rho * R_bar * T
	    }
	    
	    // The "in" and "return" direction markers are optional.
	    calc def 'Reversible Adiabatic Compression Density' (rho_1, p_1, p_2, gamma) rho_2 {
	        rho_1 * (p_2 / p_1)**(1/gamma)
	    }
	    
	    // Shorthand for "mathematical" function definition (with no steps but the returned expression)
	    calc def 'Reversible Adiabatic Compression Temperature' (T_1, p_1, p_2, gamma) 
	    	T_2 = T_1 * (p_2 / p_1)**((gamma - 1) / gamma);
	    
	    calc def 'Total Pressure' (P_static, rho, V) = 1/2 * rho * V ** 2 + P_static;
	    
	    // Showing explicit parameter typing
	    calc def 'Total Temperature' (T_static : TemperatureValue, Cp : DimensionOneValue, V : VolumeValue) : TemperatureValue 
	    	= 1/(2 * Cp) * V ** 2 + T_static;
	    
	    calc def 'Total Enthalpy' (h_total, h_static, V) H_total {
	    	1/2 * V ** 2 + h_static
	    }
	}
	
	package 'Thermodynamics Structure' {
	    part def 'Ideal Gas Parcel' {
	        comment
	            /*
	            The parcel is an infinitesimal volume used to analyze points in a flow
	            */
	        attribute 'Molar Mass';
	        attribute 'Density';
	        attribute 'Pressure';
	        attribute 'Temperature';
	        attribute 'Enthalpy';
	        attribute 'Specific Gas Constant';
	    }
	    
	    part def 'Moving Ideal Gas Parcel' specializes 'Ideal Gas Parcel' {
	        comment about 'Stagnation Pressure'
	            /*
	            Stagnation pressure is the pressure of the parcel if the kinetic energy defined by its
	            velocity in a given coordinate frame is converted to gas internal energy through deceleration
	            to a velocity that matches the current frame.
	            */
	        attribute 'Stagnation Pressure';
	        attribute 'Stagnation Temperature';
	        attribute 'Stagnation Enthalpy';
	        
	        comment about 'Static Pressure'
	            /*
	            Static pressure is the pressure of the parcel as it moves
	            */
	        attribute 'Static Pressure' redefines 'Ideal Gas Parcel'::'Pressure';
	        attribute 'Static Temperature' redefines 'Ideal Gas Parcel'::'Temperature';
	        attribute 'Static Enthalpy' redefines 'Ideal Gas Parcel'::'Enthalpy';
	    }
	    
	    action def 'Thermodynamic Process'; // need start and end shots to show beginning and end attributes
	    
	    action def 'Adiabatic Process' specializes 'Thermodynamic Process' {
	        /*
	        Thermodynamic process typically have their states defined at beginning and end
	        of the process (since these starts are path-independent)
	        */
	        action 'Stage 1' :>> start;
	        action 'Stage 2' :>> done;
	    }
	    
	    action def 'Reversible Adiabatic Process' specializes 'Adiabatic Process';
	}
	
	package 'Low-Pressure Compressor Analysis' {
	    
	    part 'Analysis Context' {
	        import 'Thermodynamic Functions'::*;
	        
	        part 'Inlet Gas' : 'Thermodynamics Structure'::'Moving Ideal Gas Parcel' {
	        	// Explicit binding notation
	        	calc 'Solve for Pressure1' : 'Ideal Gas Law' (rho, R_bar, T) p;
	        	bind 'Density' = 'Solve for Pressure1'::rho;
	        	bind 'Specific Gas Constant' = 'Solve for Pressure1'::R_bar;
	        	bind 'Static Temperature' = 'Solve for Pressure1'::T;
	        	bind 'Static Pressure' = 'Solve for Pressure1'::p;	        	
	        	
	        	// Shorthand parameter binding notation (also using optional "in" and "return")
	            calc 'Solve for Pressure2' : 'Ideal Gas Law'(
	                in rho = 'Density',
	                in R_bar = 'Specific Gas Constant',
	                in T = 'Static Temperature'
	            ) return p = 'Static Pressure';
	            
	            // Invocation expression notation
	            attribute :>> 'Static Pressure' = 'Ideal Gas Law'('Density', 'Specific Gas Constant', 'Static Temperature');

	            // Equation as binding (possible future notation) 
	            // eqn 'Static Pressure' = 'Ideal Gas Law'('Density', 'Specific Gas Constant', 'Static Temperature');
	            
	            // Equation as a constraint (note "==")
	            constraint { 'Static Pressure' == 'Ideal Gas Law'('Density', 'Specific Gas Constant', 'Static Temperature') }
	        }
	    }
	}	
	
}