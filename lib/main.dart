import 'package:flutter/material.dart';

import 'database/database_helper.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SqFlite Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () async {
                int i = await DatabaseHelper.instance
                    .insert({DatabaseHelper.columnName: 'VleisWal'});
                print('The inserted row was $i');
              },
              child: Text('Insert'),
              color: Colors.grey[400],
            ),
            FlatButton(
              onPressed: () async {
                List<Map<String, dynamic>> queryRows =
                    await DatabaseHelper.instance.queryAll();
                print(queryRows);
              },
              child: Text('Query'),
              color: Colors.green,
            ),
            FlatButton(
              onPressed: () async {
                int idToUpdate = await DatabaseHelper.instance.update({
                  DatabaseHelper.columnId: 3,
                  DatabaseHelper.columnName: 'Tyre'
                });
              },
              child: Text('Update'),
              color: Colors.blue,
            ),
            FlatButton(
              onPressed: () async {
                int rowsEffected = await DatabaseHelper.instance.delete(3);
                print('Rows effected: $rowsEffected');
              },
              child: Text('Delete'),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
