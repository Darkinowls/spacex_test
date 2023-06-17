import 'package:intl/intl.dart';

extension DateTimeExtention on DateTime{

  static final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');
  static final DateFormat _timeFormat = DateFormat('hh:mm a');

  String getDate(){
    return _dateFormat.format(this);
  }

  String getTime(){
    return _timeFormat.format(this);
  }

}