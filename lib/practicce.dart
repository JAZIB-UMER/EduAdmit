import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:tflite_v2/tflite_v2.dart';

class TFLiteHelper {
  static Future<void> loadModel() async {
    await Tflite.loadModel(
      model: "assets/model/model.tflite",
    );
  }

  static Future<dynamic> classifyImage(
    String name,
    String matricMarks,
    String matricMaths,
    String matricPhysics,
    String matricChemistry,
    String matricBio,
    String fscMarks,
    String fscMathsOrBio,
    String fscChemistry,
    String fscPhysics,
    String university,
  ) async {
    var input = [
      double.parse(name),
      double.parse(matricMarks),
      double.parse(matricMaths),
      double.parse(matricPhysics),
      double.parse(matricChemistry),
      double.parse(matricBio),
      double.parse(fscMarks),
      double.parse(fscMathsOrBio),
      double.parse(fscChemistry),
      double.parse(fscPhysics),
      double.parse(university),
    ];

    try {
      var output = await Tflite.runModelOnBinary(
        binary: Float64List.fromList(input).buffer.asUint8List(),
      );

      print(output);

      return output;
    } catch (e) {
      print(e.toString());
    }
  }

  static void disposeModel() {
    Tflite.close();
  }
}

class MyApp2 extends StatefulWidget {
  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  final _formKey = GlobalKey<FormState>();
  String _name = '',
      _matricMarks = '',
      _matricMaths = '',
      _matricPhysics = '',
      _matricChemistry = '',
      _matricBio = '';
  String _fscMarks = '',
      _fscMathsOrBio = '',
      _fscChemistry = '',
      _fscPhysics = '',
      _university = '';
  List<double>? _output;

  @override
  void initState() {
    super.initState();
    TFLiteHelper.loadModel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AI Model Integration'),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Matric Marks'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your matric marks';
                  }
                  return null;
                },
                onSaved: (value) => _matricMarks = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Matric Maths'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your matric maths marks';
                  }
                  return null;
                },
                onSaved: (value) => _matricMaths = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Matric Physics'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your matric physics marks';
                  }
                  return null;
                },
                onSaved: (value) => _matricPhysics = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Matric Chemistry'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your matric chemistry marks';
                  }
                  return null;
                },
                onSaved: (value) => _matricChemistry = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Matric Bio'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your matric bio marks';
                  }
                  return null;
                },
                onSaved: (value) => _matricBio = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'FSc Marks'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your FSc marks';
                  }
                  return null;
                },
                onSaved: (value) => _fscMarks = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'FSc Maths or Bio'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your FSc maths or bio marks';
                  }
                  return null;
                },
                onSaved: (value) => _fscMathsOrBio = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'FSc Chemistry'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your FSc chemistry marks';
                  }
                  return null;
                },
                onSaved: (value) => _fscChemistry = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'FSc Physics'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your FSc physics marks';
                  }
                  return null;
                },
                onSaved: (value) => _fscPhysics = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'University'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your university name';
                  }
                  return null;
                },
                onSaved: (value) => _university = value!,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _output = await TFLiteHelper.classifyImage(
                      _name,
                      _matricMarks,
                      _matricMaths,
                      _matricPhysics,
                      _matricChemistry,
                      _matricBio,
                      _fscMarks,
                      _fscMathsOrBio,
                      _fscChemistry,
                      _fscPhysics,
                      _university,
                    );
                    setState(() {});
                  }
                },
                child: Text('Classify'),
              ),
              Text('Output: ${_output.toString() ?? ''}'),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    TFLiteHelper.disposeModel();
    super.dispose();
  }
}
