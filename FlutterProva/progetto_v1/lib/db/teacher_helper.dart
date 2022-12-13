import 'package:progetto_v1/db/db_helper.dart';
import 'package:progetto_v1/model/teacher.dart';

class TeacherHelper {
  static final DBHelper _instance = DBHelper.instance;

  static Future<List<Teacher>> getAllTeachers() async {
    final db = await _instance.database;

    final List<Map<String, dynamic>> maps = await db.query("Teacher");

    if (maps.isEmpty) throw Exception("Teacher table is empty");

    List<Teacher> teachers = <Teacher>[];
    int i = 0;
    for (Map<String, dynamic> t in maps) {
      teachers[i++] = Teacher.fromJson(t);
    }

    return teachers;
  }

  static Future<Teacher> getTeacher(String name) async {
    final db = await _instance.database;

    final List<Map<String, dynamic>> maps =
        await db.query("Teacher", where: "name = ?", whereArgs: [name]);

    if (maps.isEmpty) throw Exception("Teacher table is empty");

    return Teacher.fromJson(maps[0]); // only one teacher, got the first one
  }
}