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
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 8.0, left: 20.0, right: 20.0),
                        child: Container(
                          width: ancho,
                          height: alto * 0.1,
                          decoration: BoxDecoration(
                            color: Color(0xfff4f4f4),
                            borderRadius: BorderRadius.circular(30.0),
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
                                    title: Text('Resolver 20 Integrales'),
                                    subtitle: Text('Matematicas'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 8.0, left: 20.0, right: 20.0),
                        child: Container(
                          width: ancho,
                          height: alto * 0.1,
                          decoration: BoxDecoration(
                            color: Color(0xfff4f4f4),
                            borderRadius: BorderRadius.circular(30.0),
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
                                    title: Text('Resolver 20 Integrales'),
                                    subtitle: Text('Matematicas'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
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
}
