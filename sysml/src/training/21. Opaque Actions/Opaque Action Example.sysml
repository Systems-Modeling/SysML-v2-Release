package 'Opaque Action Example' {
	
	part def Sensor {
		attribute ready : ScalarValues::Boolean;
	}
	
	action def UpdateSensors {
		in sensors : Sensor[*];
		language "Alf" 
			/* 
			 * for (sensor in sensors) {
			 *     if (sensor.ready) {
			 *         Update(sensor);
			 *     }
			 * }
			 */
	}
	
}