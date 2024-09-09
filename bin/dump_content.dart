import 'dart:io';
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';

void main(List<String> args) {
  var path = args.isNotEmpty ? args[0] : "test/files/test.ods";
  var sheet = args.length > 1 ? args[1] : null;
  var data = File(path).readAsBytesSync();
  var decoder = SpreadsheetDecoder.decodeBytes(data, update: true);
  print(decoder.dumpXmlContent(sheet));
}
