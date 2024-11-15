import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:convert'; // Import for jsonDecode
import 'package:flutter/services.dart'; // Import for rootBundle

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
    // Create users table
    await db.execute('''
      CREATE TABLE $tableUser (
        user_id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        email TEXT,
        password TEXT,
        height INTEGER,
        weight INTEGER,
        date_of_birth TEXT, 
        gender TEXT, 
        notification_preferences TEXT 
      )
    ''');

    // Create exercises table
    await db.execute('''
      CREATE TABLE $tableExercises (
        exercise_id INTEGER PRIMARY KEY AUTOINCREMENT,
        muscle_group_id INTEGER,
        name TEXT NOT NULL,
        description TEXT,
        instructions TEXT,
        image_url TEXT
      )
    ''');

    // Create workouts table
    await db.execute('''
      CREATE TABLE $tableWorkouts (
        workout_id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER,
        date TEXT NOT NULL
      )
    ''');

    // Create workout_exercises table
    await db.execute('''
      CREATE TABLE $tableWorkoutExercises (
        workout_exercise_id INTEGER PRIMARY KEY AUTOINCREMENT,
        workout_id INTEGER NOT NULL,
        exercise_id INTEGER NOT NULL,
        sets INTEGER,
        reps INTEGER,
        weight REAL 
      )
    ''');

    // Create body_measurements table
    await db.execute('''
      CREATE TABLE $tableBodyMeasurement (
        body_measurement_id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER,
        date TEXT NOT NULL,
        weight REAL 
      )
    ''');

    // Create muscle_groups table
    await db.execute('''
      CREATE TABLE $tableMuscleGroup (
        muscle_group_id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL
      )
    ''');
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

  // Insert exercises from JSON
  Future<void> insertExercisesFromJson(String jsonFilePath) async {
    // 1. Load JSON data from file
    String jsonString = await rootBundle.loadString(jsonFilePath);
    List<dynamic> jsonData = jsonDecode(jsonString);

    // 2. Insert each exercise into the database
    Database db = await instance.database;
    Batch batch = db.batch();
    for (var exerciseData in jsonData) {
      batch.insert(tableExercises, exerciseData);
    }
    await batch.commit(noResult: true);
  }

  // ... other query and insert functions for workouts, etc. ...

  // Close the database
  Future close() async {
    Database db = await instance.database;
    db.close();
  }
}
