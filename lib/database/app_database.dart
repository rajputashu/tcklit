import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:tcklit_app/database/dao/post_dao.dart';
import 'dart:async';

import 'package:tcklit_app/database/entities/post_entity.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [PostEntity])
abstract class AppDatabase extends FloorDatabase {
  PostDao get postDao;
}
