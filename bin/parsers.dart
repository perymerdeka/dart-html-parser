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
  var soup = await parser('panduan1.html');
  final contents = soup.querySelectorAll('p');
  for (final content in contents) {
    print(content.text);
  }

}