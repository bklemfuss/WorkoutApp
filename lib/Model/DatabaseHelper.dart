import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

/*
INSERT DATA
// Create a map of values to insert
Map<String, dynamic> row = {
  'name': 'Barbell Bench Press',
  'description': 'A classic chest exercise.',
  // ... other exercise data ...
};

// Insert the exercise
int id = await dbHelper.insertExercise(row);
print('Inserted row id: $id');

QUERY DATA
List<Map<String, dynamic>> exercises = await dbHelper.queryAllExercises();
for (var exercise in exercises) {
  print(exercise);
}

*/
class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  // Database name and version
  static const _databaseName = 'workout_app.db';
  static const _databaseVersion = 1;

  // Table names
  static const tableExercises = 'exercises';
  static const tableWorkouts = 'workouts';
  static const tableWorkoutExercises = 'workout_exercises';
  static const tableUser = 'user';
  static const tableBodyMeasurement = 'BodyMeasurement';
  static const tableMuscleGroup = 'MuscleGroup';
  // ... other tables (users, body measurements, etc.)

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    // Create exercises table
    await db.execute('''
      CREATE TABLE $tableExercises (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        description TEXT,
        muscle_group_id INTEGER,
        equipment TEXT,
        difficulty TEXT,
        instructions TEXT,
        image_url TEXT
      )
    ''');

    // Create workouts table
    await db.execute('''
      CREATE TABLE $tableWorkouts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER,
        date TEXT NOT NULL,
        notes TEXT
      )
    ''');

    // Create workout_exercises table
    await db.execute('''
      CREATE TABLE $tableWorkoutExercises (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        workout_id INTEGER NOT NULL,
        exercise_id INTEGER NOT NULL,
        sets INTEGER,
        reps INTEGER,
        weight REAL,
        rest_time INTEGER
      )
    ''');

    // ... create other tables ...
  }

  // Insert exercise
  Future<int> insertExercise(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(tableExercises, row);
  }

  // Query exercises
  Future<List<Map<String, dynamic>>> queryAllExercises() async {
    Database db = await instance.database;
    return await db.query(tableExercises);
  }

  // ... other query and insert functions for workouts, etc. ...

  // Close the database
  Future close() async {
    Database db = await instance.database;
    db.close();
  }
}
