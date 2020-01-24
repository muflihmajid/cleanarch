abstract class TimeConverterInterface {
  String toHumanReadable(DateTime tm);
  String toDateTimeString(String dateTime, {String format, String lang});
  String toFormattedString(DateTime dateTime, {String format, String lang});
}