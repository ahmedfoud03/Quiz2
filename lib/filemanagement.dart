import 'package:path_provider/path_provider.dart';
import 'dart:io';

class FilesManagement {
   static Future<String> get getpath async {
    var dir = await getDownloadsDirectory();
    return dir!.path;
  }

  static Future<File> get getFilePath async {
    final path = await getpath;
    print(path);
    return File('$path/SS.txt');
  }

  static Future<File> SaveToFile(String data) async {
    final File path = await getFilePath;

    return File(path.writeAsString(data, mode: FileMode.append).toString());
  }

  static Future<String> ReadFile() async {
    try {
      final File path = await getFilePath;
      return path.readAsString();
    } catch (e) {
      return e.toString();
    }
  }
}
