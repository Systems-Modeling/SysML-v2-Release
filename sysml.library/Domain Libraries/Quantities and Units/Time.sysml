/**
 * Specifications for time instant and various time scales
 */

package Time {
	import ScalarValues::Real;
	import ScalarValues::Integer;
	import ScalarValues::Natural;
	import ScalarValues::String;
	import Quantities::ScalarQuantityValue;
	import Quantities::scalarQuantities;
    import UnitsAndScales::*;
    import ISQBase::DurationValue;
    import ISQBase::DurationUnit;
    import ISQBase::duration;
    import ISQSpaceTime::TimeValue;
    import ISQSpaceTime::TimeUnit;
    import ISQSpaceTime::time;


	/**
	 * Generic time scale to express a time instant, including a textual definition of the meaning of zero time instant value
	 * 
	 * Attribute definitionalEpoch captures the specification of the time instant with value zero, also known as the (reference) epoch.
	 */
    attribute def TimeScale :> IntervalScale {
		attribute :>> unit: DurationUnit[1];
		attribute definitionalEpoch: DefinitionalQuantityValue[1];
		attribute :>> definitionalQuantityValues = definitionalEpoch;
    }

	/**
	 * Representation of a time instant quantity
	 *
	 * Also known as instant (of time), or, point in time.
	 */
    attribute def TimeInstantValue :> ScalarQuantityValue {
        attribute :>> num: Real[1];
        attribute :>> mRef: TimeScale[1];
    }
    attribute timeInstant: TimeInstantValue :> scalarQuantities;

	/**
	 * Generic representation of a time instant as a calendar date and time of day
	 */
	abstract attribute def DateTime :> TimeInstantValue;

	/**
	 * Generic representation of a time instant as a calendar date
	 */
	abstract attribute def Date :> TimeInstantValue;

	/**
	 * Generic representation of a time instant as a time of day
	 */
	abstract attribute def TimeOfDay :> TimeInstantValue;

	/**
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
	attribute UTC: TimeScale {
		attribute :>> longName = "Coordinated Universal Time";
		attribute :>> unit = SI::s;
		attribute :>> definitionalEpoch: DefinitionalQuantityValue { :>> num = 0; :>> definition = "UTC epoch at 1 January 1958 at 0 hour 0 minute 0 second"; }
	}

	/**
	 * Representation of a time instant expressed on the Coordinated Universal Time (UTC) time scale
	 */
	attribute def UtcTimeInstantValue :> DateTime { :>> mRef = UTC; }
	attribute utcTimeInstant: UtcTimeInstantValue;

	/**
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

    /**
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
     *
     * TODO: Add constraint to verify ISO 8691 extended string encoding.
     */
	attribute def Iso8601DateTimeEncoding :> String;

	/**
     * Representation of an ISO 8601-1 date and time in extended string format
	 */
    attribute def Iso8601DateTime :> UtcTimeInstantValue {
    	attribute :>> num = getElapsedUtcTime(val);
    	attribute val: Iso8601DateTimeEncoding;
    	private calc getElapsedUtcTime(iso8601DateTime: Iso8601DateTimeEncoding) : Real {
    		doc /** Return the number of seconds elapsed since the UTC epoch. Can be negative when the date and time is earlier than the epoch. */
    		attribute x: Real;
    		// TO DO: implement summation of ISO 8601 date and time components in x
    		x
    	}
    }

	/**
     * Representation of an ISO 8601 date and time with explicit date and time component attributes
     *
     * TO DO: Specify restrictions for attributes month (1 to 12), day (1 to 31), hour (0 to 23), minute (0 to 59), second (0 to 60), 
     * microsecond (0 to 999999), hourOffset (-12 to +12), minuteOffset (-59 to +59)
     * 
     * The total time offset is equal to the summation of hourOffset and minuteOffset.
	 */
    attribute def Iso8601DateTimeStructure :> UtcTimeInstantValue {
    	attribute :>> num = getElapsedUtcTime(year, month, day, hour, minute, second, microsecond, hourOffset, minuteOffest);
    	attribute :>> mRef = UTC;
    	attribute year: Integer;
    	attribute month: Natural;
    	attribute day: Natural;
    	attribute hour: Natural;
    	attribute minute: Natural;
    	attribute second: Natural;
    	attribute microsecond: Natural;
    	attribute hourOffset: Integer;
    	attribute minuteOffest: Integer;
    	private calc getElapsedUtcTime(year: Integer, month: Natural, day: Natural, hour: Natural, minute: Natural, second: Natural,
    			microsecond: Natural, hourOffset: Integer, minuteOffest: Integer) : Real {
    		attribute x: Real;
    		// TO DO: implement summation of ISO 8601 date and time components in x
    		x
    	}
    }

    /**
	 * Calculation to convert an ISO 8601 date and time instant from string to component structure representation
     */
	calc convertIso8601DateTimeToStructure(iso8601DateTime: Iso8601DateTime) : Iso8601DateTimeStructure {
		attribute x: Iso8601DateTimeStructure;
		// TO DO: implement parsing ISO 8601 string encoding to date and time components
		x
	}

	/**
	 * Calculation to convert an ISO 8601 date and time instant from component structure to string representation
	 */
	calc convertIso8601StructureToDateTime(iso8601DateTimeStructure: Iso8601DateTimeStructure) : Iso8601DateTime {
		attribute x: Iso8601DateTime;
		// TO DO: implement concatenation of ISO 8601 date and time components to string 
		// year-month-dayThour:minute:second±hourOffset:minuteOffset
		x
	}
}
