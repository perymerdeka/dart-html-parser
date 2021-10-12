import 'dart:io';
import 'package:html/dom.dart';
import 'package:html/parser.dart' as html_parser;

/// creating parser function like beautifulSoup using html5lib parser
Future<Document> parser(String files) async {
  final data = File(files);

  var content = await data.readAsString();
  Document html_doc = html_parser.parse(content);
  return html_doc;
}

// parsing process
main(List<String> args) async {
  getAllItem();
}

getAllItem() async {
  var soup = await parser('panduan1.html');
  final title = soup.querySelector('p.title')!.text;
  final subtitle = soup.querySelector('p.subtitle')!.text;
  final class_content = soup.querySelectorAll('p[class^="c"]');

  /// get all data on p tag
  for (final content in class_content) {
    if ('c12 title' == content.className) {
      continue;
    } else if ('c11 subtitle' == content.className) {
      continue;
    }
    print(content.text);
  }
}
