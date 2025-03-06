import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  Database? _database;

  Future<Database> get dataBase async {
    if (_database != null) {
      return _database!;
    } else {
      MessageProperty("Create", "Created Database Successfully");
      return await _initDatabase();
    }
  }
  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), "/students.db"),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
      CREATE TABLE Colleges(
        college_id INTEGER PRIMARY KEY,
        name TEXT
      )
    ''');

        await db.execute('''
      CREATE TABLE Majors(
        major_id INTEGER PRIMARY KEY,
        major_name TEXT,
        college_id INTEGER,
        FOREIGN KEY (college_id) REFERENCES Colleges(college_id)
      )
    ''');

        await db.execute('''
      CREATE TABLE Levels(
        level_id INTEGER PRIMARY KEY,
        level_name TEXT
      )
    ''');

        await db.execute('''
      CREATE TABLE Doctors(
        doctor_password TEXT,
        doctor_job_number INTEGER PRIMARY KEY,
        doctor_name TEXT,
        doctor_qualification TEXT,
        address TEXT
      )
    ''');

        await db.execute('''
      CREATE TABLE Course(
        course_id INTEGER PRIMARY KEY,
        course_name TEXT,
        doctor_job_number INTEGER,
        major_id INTEGER,
        level_id INTEGER,
        FOREIGN KEY (doctor_job_number) REFERENCES Doctors(doctor_job_number),
        FOREIGN KEY (major_id) REFERENCES Majors(major_id),
        FOREIGN KEY (level_id) REFERENCES Levels(level_id)
      )
    ''');

        await db.execute('''
      CREATE TABLE Students(
        student_password text,
        student_id INTEGER PRIMARY KEY,
        student_name TEXT,
        major_id INTEGER,
        address TEXT,
        FOREIGN KEY (major_id) REFERENCES Majors(major_id)
      )
    ''');

        await db.execute('''
      CREATE TABLE Subjects(
        subject_id INTEGER PRIMARY KEY,
        name TEXT,
        description TEXT,
        course_id INTEGER,
        FOREIGN KEY (course_id) REFERENCES Course(course_id)
      )
    ''');
      },
    );
  }

  Future<void> insertStudent(Map<String, dynamic> student) async {
    final db = await dataBase;
    await db.insert(
      'Students',
      student,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertDoctor(Map<String, dynamic> doctor) async {
    final db = await dataBase;
    await db.insert(
      'Doctors',
      doctor,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertMajor(Map<String, dynamic> major) async {
    final db = await dataBase;
    await db.insert(
      'Majors',
      major,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  Future<void> insertSubjects(Map<String, dynamic> subject) async {
    final db = await dataBase;
    await db.insert(
      'Subjects',
      subject,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  Future<void> insertCourse(Map<String, dynamic> course) async {
    final db = await dataBase;
    await db.insert(
      'Course',
      course,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  Future<void> insertLevels(Map<String, dynamic> level) async {
    final db = await dataBase;
    await db.insert(
      'Levels',
      level,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  Future<void> insertColleges(Map<String, dynamic> college) async {
    final db = await dataBase;
    await db.insert(
      'Colleges',
      college,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  Future<List<Map<String, dynamic>>> getStudents() async {
    final db = await dataBase;
    return await db.query('Students'); // select all student in the table
  }


}
