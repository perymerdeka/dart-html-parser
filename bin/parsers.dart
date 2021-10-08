import 'dart:io';
import 'package:html/parser.dart' show parse;


/// creating parser function like beautifulSoup using html5lib parser
Future<String> parser(String file) async {
  final data = File(file);
  var content = await data.readAsString();
  String html_string = parse(content).outerHtml;
  return html_string;
}

main(List<String> args) async {
  var html_file = await parser('panduan1.html');
  print(html_file);
}