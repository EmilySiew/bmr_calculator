import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController acontroller = TextEditingController();
  final TextEditingController hcontroller = TextEditingController();
  final TextEditingController wcontroller = TextEditingController();
  double height = 0.0, weight = 0.0, result = 0.0;
  int age = 0;
  int bmr;
  int _radioValue1 = -1;
  String _value = 'one';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          leading: Icon(Icons.tag_faces),
          title: Text('BMR Calculator'),
          centerTitle: true,
          backgroundColor: Colors.redAccent[100],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/image/bmr_logo1.png', width: 200, height: 150),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'BMR Equation : ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                DropdownButton<String>(
                  items: [
                    DropdownMenuItem<String>(
                      child: Text('Mifflin-St Jeor'),
                      value: 'one',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Harris-Benedict'),
                      value: 'two',
                    ),
                  ],
                  onChanged: (String value) {
                    setState(() {
                      _value = value;
                    });
                  },
                  value: _value,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Gender :',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Radio(
                  value: 0,
                  groupValue: _radioValue1,
                  onChanged: _handleRadioValueChange1,
                ),
                Text(
                  'Male',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                Radio(
                  value: 1,
                  groupValue: _radioValue1,
                  onChanged: _handleRadioValueChange1,
                ),
                Text(
                  'Female',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(3),
                  border: UnderlineInputBorder(),
                  filled: true,
                  labelText: "Age :",
                  hintText: "Please insert your age.",
                ),
                keyboardType: TextInputType.numberWithOptions(),
                controller: acontroller,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(3),
                  border: UnderlineInputBorder(),
                  filled: true,
                  labelText: "Height (cm): ",
                  hintText: "Please insert your height in cm.",
                ),
                keyboardType: TextInputType.numberWithOptions(),
                controller: hcontroller,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 10),
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(3),
                  border: UnderlineInputBorder(),
                  filled: true,
                  labelText: "Weight (kg) : ",
                  hintText: "Please insert your weight in kg.",
                ),
                keyboardType: TextInputType.numberWithOptions(),
                controller: wcontroller,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: RaisedButton(
                child: Text("Calculate BMR"),
                onPressed: _onPress,
              ),
            ),
            Container(
              child: Text(
                'BMR : $bmr',
                style: TextStyle(fontSize: 30.0, color: Colors.red),
              ),
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 100.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Colors.black),
                  bottom: BorderSide(color: Colors.black),
                  left: BorderSide(color: Colors.black),
                  right: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;
    });
  }

  void _onPress() {
    setState(() {
      age = int.parse(acontroller.text);
      height = double.parse(hcontroller.text);
      weight = double.parse(wcontroller.text);

      if (_value == 'one') {
        if (_radioValue1 == 0) {
          result = (10 * weight) + (6.25 * height) - (5 * age) + 5;
        } else if (_radioValue1 == 1) {
          result = (10 * weight) + (6.25 * height) - (5 * age) - 161;
        }
      } else if (_value == 'two') {
        if (_radioValue1 == 0) {
          result =
              ((13.75 * weight) + (5.003 * height) - (6.755 * age) + 66.47);
        } else if (_radioValue1 == 1) {
          result = ((9.563 * weight) + (1.85 * height) - (4.676 * age) + 655.1);
        }
      }
      bmr = result.round();
    });
  }
}
