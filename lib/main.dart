import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:homework/screens/add_new.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "My First App", home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final alto = MediaQuery.of(context).size.height;
    final ancho = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'MyHomeWorks',
          style: TextStyle(color: Colors.grey),
        ),
        centerTitle: true,
        backgroundColor: Color(0xfff4f4f4),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                //color: Colors.grey,
                width: ancho,
                height: alto * .30,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/images7.png'),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: ancho,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.filter_list),
                            SizedBox(
                              width: 3.0,
                            ),
                            Text('My List'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: StreamBuilder<QuerySnapshot>(
                            stream: Firestore.instance
                                .collection('works')
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasError)
                                return new Text('Error: ${snapshot.error}');
                              switch (snapshot.connectionState) {
                                case ConnectionState.waiting:
                                  return new Text('Loading...');
                                default:
                                  return new ListView(
                                    children: snapshot.data.documents
                                        .map((DocumentSnapshot document) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0,
                                            bottom: 8.0,
                                            left: 20.0,
                                            right: 20.0),
                                        child: InkWell(
                                          onTap: () => {
                                              //print(document.documentID),
                                              showModalBottomSheet(
                                                  elevation: alto * 0.8,
                                                  backgroundColor:
                                                      Color.fromRGBO(
                                                          0, 0, 0, 0),
                                                  context: context,
                                                  isScrollControlled: true,
                                                  builder: (context) {
                                                    return _homeWorkModal(
                                                        context, document);
                                                  }),
                                            },
                                          child: Container(
                                            width: ancho,
                                            height: alto * 0.1,
                                            decoration: BoxDecoration(
                                              color: Color(0xfff4f4f4),
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  flex: 1,
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.attach_file,
                                                      size: 30.0,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Center(
                                                    child: ListTile(
                                                      title: Text(
                                                          document['title']),
                                                      subtitle: Text(
                                                          document['subject']),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewHomeWork()));
              },
              child: Container(
                  width: ancho,
                  height: 50.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xff6441a9),
                      Color(0xff634db5),
                    ]),
                  ),
                  child: Center(
                      child: Text('Add New',
                          style: TextStyle(color: Colors.white)))),
            ),
          ),
        ],
      ),
    );
  }

   Widget _homeWorkModal(BuildContext context, DocumentSnapshot document) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    print(document.documentID);
    print(document.data['title']);
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfff4f4f4),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      width: ancho,
      //height: alto * 0.4,
      child: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                document['subject'] == "Matematicas"
                    ? Icons.functions
                    : Icons.attach_file,
                color: Colors.grey,
                size: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                  child: Text(
                document.data['title'],
                style: TextStyle(
                  fontSize: 20,
                ),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(document.data['subject']),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 8.0, top: 40.0, bottom: 8.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xffffffff)),
                  width: ancho,
                  height: alto * 0.05,
                  child: Center(
                      child: Text(
                    'Volver a la lista',
                    style: TextStyle(color: Colors.grey),
                  )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Firestore.instance
                      .collection("works")
                      .document(document.documentID)
                      .delete();
                  Navigator.of(context).pop();
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xffc94b7a)),
                  width: ancho,
                  height: alto * 0.05,
                  child: Center(
                      child: Text(
                    'Tarea Hecha',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}