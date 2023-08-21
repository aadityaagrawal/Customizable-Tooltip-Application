import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:trektip/config/app_data.dart';
import 'package:trektip/model/tip_model.dart';

class DbController {
  AppData appData = AppData();

  Future<Database> getDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), appData.dbName),
      version: 1,
      onCreate: (db, version) {
        if (appData.printBool) print("Printing table");

        return db.execute('''
                          CREATE TABLE TOOLTIP
                          (
                            id INTEGER PRIMARY KEY AUTOINCREMENT,
                            targetElement TEXT,
                            toolTipText TEXT,
                            textSize INTEGER,
                            textPadding INTEGER,
                            textColor TEXT,
                            backgroundColor TEXT,
                            cornerRadius INTEGER,
                            tooltipWidth INTEGER,
                            arrowWidth INTEGER,
                            arrowHeight INTEGER
                          ); 
      ''');
      },
    );
  }

  void insertData(TipModel tipData) async {
    final db = await getDatabase();

    Map<String, dynamic> data = tipData.toMap();

    db.insert(appData.tableName, data,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<TipModel>> getData() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(appData.tableName);
    return List.generate(maps.length, (index) {
      return TipModel.fromMap(maps[index]);
    });
  }

  Future<void> updateTooltipSettings(TipModel data, int id) async {
    final db = await getDatabase();
    Map<String, dynamic> updateData = data.toMap();
    updateData["id"] = id;
    db.update(
      appData.tableName,
      updateData,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  void deleteData(int id) async {
    final db = await getDatabase();

    db.delete(appData.tableName, where: "id = ?", whereArgs: [id]);
  }
}
