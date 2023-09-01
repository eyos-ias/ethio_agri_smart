import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<String> readMarkdownFromFile(String fileName) async {
  try {
    Directory directory = await getApplicationDocumentsDirectory();
    File file = File('${directory.path}/$fileName');
    String content = await file.readAsString();
    return content;
  } catch (e) {
    print("Error reading file: $e");
    return "";
  }
}
