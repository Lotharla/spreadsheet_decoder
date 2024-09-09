@TestOn('vm')

library spreadsheet_test;

import 'dart:convert';
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';
import 'package:test/test.dart';

import 'common_io.dart';
part 'common.dart';

void main() {
  testUnsupported();
  testOds();
  testXlsx();
  testUpdateOds();
  testUpdateXlsx();
      test('Add/remove sheet', () {
        var decoder = decode('default.ods', update: true);
        expect(decoder is OdsDecoder, isTrue);
        decoder.addSheet('xxx');
        expect(decoder.dumpXmlContent().contains('table:table table:name="xxx"'), isTrue);
        save('test/out/update/2sheets.ods', decoder.encode());
        decoder.removeSheet('xxx');
        expect(decoder.dumpXmlContent().contains('table:table table:name="xxx"'), isFalse);
        save('test/out/update/1sheet.ods', decoder.encode());
      });
}
