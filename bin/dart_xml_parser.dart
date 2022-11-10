import 'package:xml_map_converter/xml_map_converter.dart';

import 'package:dart_xml_parser/offline_code_model.dart';

import 'sample_data.dart';

Future<void> main(List<String> arguments) async {
  final OfflineCodeModel offlineCodeModel =
      OfflineCodeModel.fromMap(await _xmlToStandardJson(sampleData01));

  print(offlineCodeModel);
}

Future<Map<String, dynamic>> _xmlToStandardJson(String xml) async {
  final Map<String, dynamic> firstPhase = await Xml2Map(
        xml.replaceAll('”', '"'),
        attrPrefix: '',
        cdataNode: 'data',
        textNode: 'text',
      ).transform() ??
      <String, dynamic>{};

  final Map<String, dynamic> secondPhase = await Xml2Map(
        Map2Xml(firstPhase).transform(),
        attrPrefix: '',
        cdataNode: 'data',
        textNode: 'text',
      ).transform() ??
      <String, dynamic>{};

  return secondPhase;
}
