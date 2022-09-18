import 'package:sqflite/sqflite.dart';

import '../db_tables.dart';
import 'db_dao_mixin.dart';

class DbLoginInfoDao with DbDaoMixin {
  DbLoginInfoDao({
    required this.db,
  });

  final String _tableName = DbTableNames.loginInfo;

  @override
  final Database db;

  @override
  String get table => _tableName;
}
