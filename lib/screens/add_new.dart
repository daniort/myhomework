//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewHomeWork extends StatefulWidget {
  @override
  _NewHomeWorkState createState() => _NewHomeWorkState();
}

class _NewHomeWorkState extends State<NewHomeWork> {
  TextEditingController _titleController;
  TextEditingController _subjectController;
  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _subjectController = TextEditingController();
  }

  final _mykey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final alto = MediaQuery.of(context).size.height;
    final ancho = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Text(
          'Back',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        backgroundColor: Color(0xfff4f4f4),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Image.asset('assets/images/images6.png'),
                ),
              ),
              Text('Add New Work', style: TextStyle(color: Colors.grey)),
              Form(
                key: _mykey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 40.0, right: 40.0, top: 10.0, bottom: 10.0),
                      child: TextFormField(
                        controller: _titleController,
                        decoration: InputDecoration(
                            icon: Icon(Icons.edit), labelText: 'Title'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Title field is empty';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 40.0, right: 40.0, top: 10.0, bottom: 10.0),
                      child: TextFormField(
                        controller: _subjectController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Subcject field is empty';
                          }
                        },
                        decoration: InputDecoration(
                            icon: Icon(Icons.edit), labelText: 'Subject'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    if (_mykey.currentState.validate()) {
                      //guardar en la base de datos
                      Firestore.instance
                          .collection('works')
                          .document()
                          .setData({
                        'title': _titleController.text,
                        'subject': _subjectController.text
                      });
                      _titleController.clear();
                      _subjectController.clear();
                      Navigator.of(context).pop();
                    }
                  },
                  child: Container(
                    width: ancho,
                    height: alto * 0.06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(colors: [
                        Color(0xff6441a9),
                        Color(0xff634db5),
                      ]),
                    ),
                    child: Center(
                        child:
                            Text('Add', style: TextStyle(color: Colors.white))),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
