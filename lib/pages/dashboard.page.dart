import 'package:epresent/Bloc/AuthBloc.dart';
import 'package:epresent/Bloc/PresentBloc.dart';
import 'package:qrscan/qrscan.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  String data = "";
  AuthBloc authBloc;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("judul"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(data)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          scanQR();
        },
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
   }
   void scanQR() async {
     var result = await scan();
      final prefs = await SharedPreferences.getInstance();
      final key = 'token';
      final value = prefs.get(key ) ?? 0;
    //  PermissionStatus status = PermissionStatus.undetermined;
    //  if (result == null) {
    //    status = (await Permission.camera.isGranted) as PermissionStatus;
    //  }

    setState(() {
      data = value;
      print(value);
    });


   }
}