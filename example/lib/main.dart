import 'package:flutter/material.dart';
import 'package:kotlin_scope_function/kotlin_scope_function.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final titleStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
  final descStyle = TextStyle(fontSize: 16);
  final noteStyle = TextStyle(fontWeight: FontWeight.bold);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kotlin Scope Function Demo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: <Widget>[
            _exampleItem(
                '.let example:',
                "final defValue = 10;"
                    "\nvar result = defValue.let((it) {"
                    "\n  final b = 5;"
                    "\n  return it + b + 5;"
                    "\n});",
                "//print result"
                    "\nresult:${let()}",
                "note:see function 'let()' for code example."),
            _exampleItem(
                'run example:',
                "final a = 10;"
                    "\nvar result = run((it) {"
                    "\n  final b = 5;"
                    "\n  return a + b + 5;"
                    "\n});",
                "//print result"
                    "\nresult:${run1()}",
                "note:see function 'run1()' for code example."),
            _exampleItem(
                '.also example:',
                "List result = [];"
                    "\na.also((it) {"
                    "\n  final b = 10;"
                    "\n  it.add(b);"
                    "\n  it.add(5);"
                    "\n});",
                "//print result"
                    "\nresult:${also()}",
                "note:see function 'also()' for code example."),
            _exampleItem(
                '.takeIf example:',
                "List ref = [\"data\"];"
                    "\nvar result = ref.takeIf((it) {"
                    "\n  return it.isNotEmpty;"
                    "\n});",
                "//print result"
                    "\nresult:${takeIf()}",
                "note:see function 'takeIf()' for code example."),
            _exampleItem(
                '.takeUnless example:',
                "List ref = [\"data\"];"
                    "\nvar result = ref.takeUnless((it) {"
                    "\n  return it.isEmpty;"
                    "\n});",
                "//print result"
                    "\nresult:${takeUnless()}",
                "note:see function 'takeUnless()' for code example."),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _exampleItem(String title, String desc, String result, String note) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _gapH8,
          _title(title),
          _gapH8,
          Container(
              width: double.infinity,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.grey.shade300),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _desc(desc),
                  _gapH8,
                  _desc(result),
                  _gapH8,
                  _note(note)
                ],
              ))
        ],
      );

  Widget _title(String title) => Text(
        title,
        style: titleStyle,
      );

  Widget _desc(String desc) => Text(
        desc,
        style: descStyle,
      );

  Widget _note(String note) => Text(
        note,
        style: noteStyle,
      );

  Widget get _gapH8 => SizedBox(
        height: 8,
      );

  let() {
    final defValue = 10;
    var result = defValue.let((it) {
      final b = 5;
      return it + b + 5;
    });
    return result;
  }

  run1() {
    final a = 10;
    var result = run(() {
      final b = 5;
      return a + b + 5;
    });
    return result;
  }

  also() {
    List result = [];
    result.also((it) {
      final b = 10;
      it.add(b);
      it.add(5);
    });
    return result;
  }

  takeIf() {
    List ref = ["data"];
    var result = ref.takeIf((it) {
      return it.isNotEmpty;
    });
    return result;
  }

  takeUnless() {
    List ref = ["data"];
    var result = ref.takeUnless((it) {
      return it.isEmpty;
    });
    return result;
  }
}
