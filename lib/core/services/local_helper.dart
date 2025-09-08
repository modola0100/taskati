import 'package:hive/hive.dart';

// 1) init hive
// 2) create helper class and open your box and take instance of it
// 3) create function to put data and get data
// 4) use this class and its methods to save and get data
//! Note : Not Needed to Call init() Again After First Time !!

class LocalHelper {
  static late Box userBox;
  static late Box taskBox;

  static String kName = 'name';
  static String kImage = 'image';
  static String kIsUploaded = 'isUploaded';

  static init() async {
    userBox = await Hive.openBox('userBox');
    taskBox = await Hive.openBox('taskBox');
  }

  static putData(String key, dynamic value) {
    userBox.put(key, value);
  }

  static getData(String key) {
    return userBox.get(key);
  }

  // static putTask(String key, TaskModel value) {
  //   taskBox.put(key, value);
  // }

  // static TaskModel getTask(String key) {
  //   return taskBox.get(key);
  // }

  static putUserData(String name, String image) {
    putData(kName, name);
    putData(kImage, image);
    putData(kIsUploaded, true);
  }
}
