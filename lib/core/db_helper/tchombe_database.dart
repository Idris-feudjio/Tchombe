import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class AppDatabase {
  static final AppDatabase _singleton = AppDatabase._();

  FirebaseFirestore get firestore => FirebaseFirestore.instance;
 // FirebaseStorage get storage => FirebaseStorage.instance;

  // Singleton accessor
  static AppDatabase get instance => _singleton;

  Completer? _dbOpenCompleter;

  AppDatabase._();

  Future get database async {
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();
      _openDatabase();
    }

    return _dbOpenCompleter!.future;
  }

  Future _openDatabase() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final dbPath = join(appDocumentDir.path, 'tchombe.db');

    final database =  firestore.doc(dbPath);//databaseFactoryIo.openDatabase(dbPath);
    _dbOpenCompleter?.complete(database);
  }
}
