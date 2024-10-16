import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class HomeScreenController{
  static late Database mydatabase;
  static List<Map> employeeDataList=[];


    static  Future initDp() async {
      if (kIsWeb) {
  // Change default factory on the web
  databaseFactory = databaseFactoryFfiWeb;
  
}
        mydatabase = await openDatabase("employee.dp", version: 1,
    onCreate: (Database db, int version) async {
  // When creating the db, create the table
  await db.execute(
      'CREATE TABLE Employees (id INTEGER PRIMARY KEY, name TEXT, designation TEXT)');
});
      }


  static Future addEmployee({required String name, required String designation}) async {
   await mydatabase.rawInsert(
      'INSERT INTO Employees(name,designation) VALUES(?,?)',
      [name,designation]);
      getEmployee();
  }
  static Future getEmployee() async {
    employeeDataList = await mydatabase.rawQuery('SELECT * FROM Employees');
    print(employeeDataList);

  }
  removeEmployee(){}
  updateEmployee(){}
}