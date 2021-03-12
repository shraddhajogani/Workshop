import 'package:flutter/material.dart';

// Import the application imports.
import 'counterapp.dart';
import 'barchart.dart';
import 'uploadfile.dart';


// main function
// Start the app with the "/" named route. In this case, the app starts
// on the FirstScreen widget.
// When navigating to the "/" route, build the FirstScreen widget.
// When navigating to the "/second" route, build the SecondScreen widget.
void main() {
  print("Inside the main");
  runApp(new MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Named Routes Demo');
    return (MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.green,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      title: 'Named Routes Demo',
      initialRoute: '/', // First screen of list of Main menu
      routes: {
        '/': (context) => Center(child: MainMenuScreen()),
        '/counterapp': (context) => CounterApp(),
        '/Graph': (context) => BarGraph(),
        '/uploadfile': (context) => UploadImageDemo(),



      },
    ));
  }
}

class MainMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Welcome to flutter workshop')),
      ),
      body: ListView(
        children: <Widget>[
          btncounterapp(context),
          btngraph(context),
          btnuploadfile(context),


        ],
      ),
    );
  }

  Widget btncounterapp(BuildContext context) {
    print("I am inside btn Simple text");

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: RaisedButton(
          color: Colors.blue.shade300,
          elevation: 8.0,
          textColor: Colors.white,
          child: Text('Simple Text screen'),
          onPressed: () {
            print("On pressed btn Simple text");
            // Navigate to the second screen using a named route.
            Navigator.pushNamed(context, '/counterapp');
          },
        ),
      ),
    );
  }

  Widget btngraph(BuildContext context) {
    print("I am inside btn Simple text");

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: RaisedButton(
          color: Colors.blueAccent.shade200,
          elevation: 8.0,
          textColor: Colors.white,
          child: Text('Bar Charts'),
          onPressed: () {
            print("On pressed btn Simple text");
            // Navigate to the second screen using a named route.
            Navigator.pushNamed(context, '/Graph');
          },
        ),
      ),
    );
  }


  Widget btnuploadfile(BuildContext context) {
    print("I am inside btn Simple text");

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Center(
        child: MaterialButton(
          color: Colors.lightBlue.shade700,
          elevation:8.0,
          textColor: Colors.white,
          child: Text('upload file to the server'),
          onPressed: () {
            print("On pressed btn Simple text");
            // Navigate to the second screen using a named route.
            Navigator.pushNamed(context, '/uploadfile');
          },
        ),
      ),
    );
  }
}

// Widget btn18multilanguage(BuildContext context) {
//   print("I am inside btn translate");
//   return RaisedButton(
//     child: Text('Translator'),
//     onPressed: () {
//       print("On pressed Translator btn ");
//       // Navigate to the second screen using a named route.
//       Navigator.pushNamed(context, '/18multilanguage');
//     },
//   );
// }


// Notes:
// void main() => runApp(MyApp());
// OR other way to represent
// void main() {
//   runApp(
//     MyApp(),
//   );
// }