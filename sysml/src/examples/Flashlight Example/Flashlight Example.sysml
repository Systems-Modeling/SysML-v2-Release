package 'Flashlight Example' {
	
	attribute def OnOffCmd;
	attribute def Light;
	
	port def OnOffCmdPort {
		out onOffCmd : OnOffCmd;
	}
	
	port def LightPort {
		out light: Light;
	}
	
	part context {
		part user {
			port onOffCmdPort: OnOffCmdPort {
				out :>> onOffCmd;
			}
			perform illuminateRegion.sendOnOffCmd(
				out onOffCmd = onOffCmdPort.onOffCmd
			);
		}
		
		interface userToFlashlight connect user.onOffCmdPort to flashlight.onOffCmdPort {
			ref flow :> illuminateRegion.onOffCmdFlow
				from source.onOffCmd to target.onOffCmd;
		}
		
		part flashlight {
			port onOffCmdPort: ~OnOffCmdPort {
				in :>> onOffCmd;
			}
			perform illuminateRegion.produceDirectedLight(
				in onOffCmd = onOffCmdPort.onOffCmd,
				out light = lightPort.light
			);
			port lightPort: LightPort {
				out :>> light;
			}
		}
		part reflectingSource {
			port lightPort: ~LightPort {
				in :>> light;
			}
			perform illuminateRegion.reflectLight(
				in light = lightPort.light
			);
		}
	}
	
	action illuminateRegion {
		action sendOnOffCmd(out onOffCmd: OnOffCmd);
		
		succession flow onOffCmdFlow from sendOnOffCmd.onOffCmd to produceDirectedLight.onOffCmd;
		
		action produceDirectedLight(in onOffCmd, out light: Light);
		
		succession flow lightFlow from produceDirectedLight.light to reflectLight.light;
		
		action reflectLight(in light: Light);
	}
	
	
	
}