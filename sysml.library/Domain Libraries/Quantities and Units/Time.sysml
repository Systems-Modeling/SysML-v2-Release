standard library package Time {
	doc
	/*
	 * This package specifies concepts to support time-related quantities and metrology, beyond 
	 * the quantities duration and time as defined in [ISO 80000-3]. Representations of the 
	 * Gregorian calendar date and time of day as specified by the [ISO 8601-1] standard are used.
	 */

	private import Occurrences::Occurrence;
	private import ScalarValues::Real;
	private import ScalarValues::Integer;
	private import ScalarValues::Natural;
	private import ScalarValues::String;
	private import Quantities::ScalarQuantityValue;
	private import Quantities::scalarQuantities;
    private import MeasurementReferences::*;
    public import ISQBase::DurationValue;
    public import ISQBase::DurationUnit;
    public import ISQBase::duration;
    public import ISQSpaceTime::TimeValue;
    public import ISQSpaceTime::TimeUnit;
    public import ISQSpaceTime::time;
    
    part universalClock : Clock[1] :> Clocks::universalClock {
   	    doc
	    /*
	     * universalClock is a single Clock that can be used as a default universal time reference.
	     */
    }

	part def Clock :> Clocks::Clock {
		doc
		/*
		 * A Clock provides a currentTime as a TimeInstantValue that advances montonically over its lifetime.
		 */
	
		attribute :>> currentTime : TimeInstantValue;
	}
	
	calc def TimeOf :> Clocks::TimeOf {
		doc
		/*
		 * TimeOf returns a TimeInstantValue for a given Occurrence relative to a given Clock. This TimeInstantValue is the 
		 * time of the start of the Occurrence, which is considered to be synchronized with the snapshot of the Clock with a 
		 * currentTime equal to the returned timeInstant.
		 */
	
		in o : Occurrence[1]; 
		in clock : Clock[1] default localClock;
		return timeInstant : TimeInstantValue[1];
	}

	calc def DurationOf :> Clocks::DurationOf {
		doc
		/*
		 * DurationOf returns the duration of a given Occurrence relative to a given Clock, which is equal to the TimeOf 
		 * the end snapshot of the Occurrence minus the TimeOf its start snapshot.
		 */
	
		in o : Occurrence[1]; 
		in clock : Clock[1] default localClock;
		return duration : DurationValue;
	}
	
    attribute def TimeScale :> IntervalScale {
		doc
		/*
		 * Generic time scale to express a time instant, including a textual definition of the meaning of zero time instant value
		 * 
		 * Attribute definitionalEpoch captures the specification of the time instant with value zero, also known as the (reference) epoch.
		 */
	
		attribute :>> unit: DurationUnit[1];
		attribute definitionalEpoch: DefinitionalQuantityValue[1];
		attribute :>> definitionalQuantityValues = definitionalEpoch;
    }

    attribute def TimeInstantValue :> ScalarQuantityValue {
		doc
		/*
		 * Representation of a time instant quantity
		 *
		 * Also known as instant (of time), or, point in time.
		 */
	
        attribute :>> num: Real[1];
        attribute :>> mRef: TimeScale[1];
    }
    attribute timeInstant: TimeInstantValue :> scalarQuantities;

	abstract attribute def DateTime :> TimeInstantValue {
		doc
		/*
		 * Generic representation of a time instant as a calendar date and time of day
		 */
	}

	abstract attribute def Date :> TimeInstantValue {
		doc
		/*
		 * Generic representation of a time instant as a calendar date
		 */
	}

	abstract attribute def TimeOfDay :> TimeInstantValue {
		doc
		/*
		 * Generic representation of a time instant as a time of day
		 */
	}

	attribute <UTC> 'Coordinated Universal Time' : TimeScale {
		doc
		/*
		 * Representation of the Coordinated Universal Time (UTC) time scale
		 *
		 * UTC is the primary time standard by which the world regulates clocks and time. It is within about 1 second of mean solar time
		 * at 0° longitude and is not adjusted for daylight saving time.
		 * UTC is obtained from International Atomic Time (TAI) by the insertion of leap seconds according to the advice of
		 * the International Earth Rotation and Reference Systems Service (IERS) to ensure approximate agreement
		 * with the time derived from the rotation of the Earth.
		 *
		 * References:
		 * ITU-R TF.460-6 (see https://www.itu.int/rec/R-REC-TF.460/en)
		 * BIPM technical services: Time Metrology (see https://www.bipm.org/en/time-metrology)
		 *
		 * Introductions:
		 * For UTC see https://en.wikipedia.org/wiki/Coordinated_Universal_Time
		 * For TAI see https://en.wikipedia.org/wiki/International_Atomic_Time
		 */
	
		attribute :>> unit = SI::s;
		attribute :>> definitionalEpoch: DefinitionalQuantityValue { :>> num = 0; :>> definition = "UTC epoch at 1 January 1958 at 0 hour 0 minute 0 second"; }
	}

	attribute def UtcTimeInstantValue :> DateTime { 
		:>> mRef = UTC {
			doc
			/*
			 * Representation of a time instant expressed on the Coordinated Universal Time (UTC) time scale
			 */
		} 
	}
	attribute utcTimeInstant: UtcTimeInstantValue :> timeInstant;

	/*
	 * Representations of a Gregorian calendar date and time of day as specified by the ISO 8601-1 standard.
	 *
	 * As explained in ISO 8601-1 clause 4.2.1:
	 * ISO 8601-1 uses the Gregorian calendar for the identification of calendar days.
	 *
	 * The Gregorian calendar provides a time scale consisting of a series of contiguous calendar years,
	 * each identified by a year number represented by an integer, greater than that of the
	 * immediately preceding calendar year by 1. ISO 8601-1 allows the identification of calendar years
	 * by their year number for years both before and after the introduction of the Gregorian calendar.
	 *
	 * The Gregorian calendar distinguishes common years of 365 consecutive calendar days and leap years
	 * of 366 consecutive calendar days.
	 *
	 * In the Gregorian calendar each calendar year is divided into 12 sequential calendar months,
	 * each consisting of a specific number of calendar days in the range 28 to 31. Usage of the Gregorian calendar
	 * for identifying dates preceding its introduction (15 October 1582) should only be by mutual agreement
	 * of the communicating partners.
	 *
	 * Reference: ISO 8601-1:2019 (First edition)
	 * "Date and time — Representations for information interchange — Part 1: Basic rules"
	 * (see https://www.iso.org/standard/70907.html)
	 */

	attribute def Iso8601DateTimeEncoding :> String {
	    doc
	    /*
	     * Extended string encoding of an ISO 8601-1 date and time
	     *
	     * The format of the string must comply with the following EBNF production:
	     * ['+' | '-'] YYYY '-' MM '-' DD 'T' hh ':' mm ':' ss ['.' fff [fff]] ('Z' | timezoneOffset )
	     * where:
	     *   YYYY is 4-or-more-digit year number, which can be negative for years before 0000;
	     *   MM is 2-digit month in year number, in which 01 is January, 02 is February, ..., 12 is December;
	     *   DD is 2-digit day in month number in range 01 to 28, 29, 30, 31 depending on month and leap year;
	     *   hh is 2-digit hour in day number in range 00 to 23;
	     *   mm is 2-digit minute in hour in range 00 to 59;
	     *   ss is 2-digit second in minute in range 00 to 60, in  in case of leap second;
	     *   ['.' fff [fff]] is an optional 3-digit millisecond or 6-digit microsecond fraction;
	     *   timezoneOffset is ('+' | '-') hhOffset ':' mmOffset, denoting the local timezone hour and minute offset w.r.t. UTC,
	     *   in which '+' specifies an offset ahead of UTC and '-' specifies an offset behind UTC;
	     *
	     * Note 1: All components are expressed with leading zeros.
	     * Note 2: 'Z' instead of timezoneOffset denotes a UTC time, i.e. zero time offset.
	     * Note 3: The ss value may only be 60 when a leap second is inserted.
	     *
	     * Examples of such a date and time value are:
	     * 2021-08-30T12:30:24Z (UTC date and time with second precision)
	     * 2018-01-23T23:14:44.304827Z (UTC date and time with microsecond precision)
	     * 1969-07-20T20:17:00Z (UTC date and time with second precision)
	     * 1969-07-20T15:17:00-05:00 (local date and time with second precision for a timezone 5 hour behind UTC)
	     * 1969-07-20T22:17:00+02:00 (local date and time with second precision for a timezone 2 hour ahead of UTC)
	     */
    }

    attribute def Iso8601DateTime :> UtcTimeInstantValue {
		doc
		/*
	     * Representation of an ISO 8601-1 date and time in extended string format
		 */
	
    	attribute val: Iso8601DateTimeEncoding;
    	attribute :>> num = getElapsedUtcTime(val);
    	private calc getElapsedUtcTime {
    		in iso8601DateTime: Iso8601DateTimeEncoding;
    		/* Return the number of seconds elapsed since the UTC epoch. 
    		 * Can be negative when the date and time is earlier than the epoch.
    		 */
    		return : Real;
    	}
    }

    attribute def Iso8601DateTimeStructure :> UtcTimeInstantValue {
		doc
		/*
	     * Representation of an ISO 8601 date and time with explicit date and time component attributes
	     *
	     * The total time offset is equal to the summation of hourOffset and minuteOffset.
		 */
	
    	attribute year: Integer;
    	attribute month: Natural;
    	attribute day: Natural;
    	attribute hour: Natural;
    	attribute minute: Natural;
    	attribute second: Natural;
    	attribute microsecond: Natural;
    	attribute hourOffset: Integer;
    	attribute minuteOffset: Integer;
    	attribute :>> num = getElapsedUtcTime(year, month, day, hour, minute, second, microsecond, hourOffset, minuteOffset);
    	private calc getElapsedUtcTime {
    		in year: Integer; 
    		in month: Natural; 
    		in day: Natural;
    		in hour: Natural;
    		in minute: Natural;
    		in second: Natural;
    		in microsecond: Natural;
    		in hourOffset: Integer;
    		in minuteOffest: Integer;
    		return : Real;
    	}
    }

	calc convertIso8601DateTimeToStructure {
	    doc
	    /*
		 * Calculation to convert an ISO 8601 date and time instant from string to component structure representation
	     */
    
		in iso8601DateTime: Iso8601DateTime;
		/* Parse ISO 8601 string encoding to date and time components */
		return : Iso8601DateTimeStructure;
	}

	calc convertIso8601StructureToDateTime {
		doc
		/*
		 * Calculation to convert an ISO 8601 date and time instant from component structure to string representation
		 */
	
		in iso8601DateTimeStructure: Iso8601DateTimeStructure;
		attribute x: Iso8601DateTime;
		/* Concatenate ISO 8601 date and time components to string 
		 *     year-month-dayThour:minute:second±hourOffset:minuteOffset
		 */
		return : Iso8601DateTime;
	}
}
