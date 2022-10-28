import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:galerry/gallery_widget.dart';
import 'package:galerry/overlayWidget.dart';
import 'package:galerry/resizeDrag.dart';
import 'package:galleryimage/galleryimage.dart';
import 'gallery_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isDropped = false;

  List<Widget> _addedWidgets = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          contentPadding: EdgeInsets.zero,
                          insetPadding: EdgeInsets.symmetric(horizontal: 1),
                          content: Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                          padding: EdgeInsets.all(5),
                                          child: IconButton(
                                            icon: Icon(Icons.close),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ))),
                                  GestureDetector(
                                      onTap: () {
                                        print("Container was tapped");
                                      },
                                      child: Container(
                                        height: 60,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Row(children: [
                                          SizedBox(width: 10),
                                          Text(
                                            "asdsad",
                                            style: TextStyle(
                                                fontSize: 22,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          // SizedBox(width: 10),
                                        ]),
                                        decoration: BoxDecoration(
                                          image: const DecorationImage(
                                            image:
                                                AssetImage("assets/333.jpeg"),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      )),
                                  ElevatedButton(
                                    child: Text("Test Adding"),
                                    onPressed: () {
                                      _addedWidgets.add(OverlayWidget(
                                          onDragEnd: () {},
                                          // onDragMove: (Offset offset) {
                                          //   print("DRAG MOVE");
                                          // },
                                          onDragUpdate: (Offset offset) {
                                            // print("X ${offset.dx}");
                                            // print("Y ${offset.dy}");
                                          },
                                          onDragStart: () {},
                                          child: SizedBox(
                                              width: 150,
                                              height: 150,
                                              child: Image.asset(
                                                  'assets/333.jpeg',
                                                  fit: BoxFit.cover))));

                                      setState(() {});
                                      Navigator.pop(context);
                                      // callback();
                                    },
                                  ),
                                  Card(
                                    // clipBehavior is necessary because, without it, the InkWell's animation
                                    // will extend beyond the rounded edges of the [Card] (see https://github.com/flutter/flutter/issues/109776)
                                    // This comes with a small performance cost, and you should not set [clipBehavior]
                                    // unless you need it.
                                    clipBehavior: Clip.hardEdge,
                                    child: InkWell(
                                      splashColor: Colors.blue.withAlpha(30),
                                      onTap: () {
                                        debugPrint('Card tapped.');
                                      },
                                      child: const SizedBox(
                                        width: 300,
                                        height: 50,
                                        child:
                                            Text('A card that can be tapped'),
                                      ),
                                    ),
                                  ),
                                ],
                              )));
                    });
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Demo()),
                // );
              },
              icon: Icon(Icons.abc_outlined)),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.height,
              child: Image.asset('assets/222.jpeg', fit: BoxFit.cover)),
          // Icon(Icons.favorite, size: 120, color: Colors.red),
          for (var i = 0; i < _addedWidgets.length; i++) _addedWidgets[i],
          const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Icon(Icons.delete, size: 35, color: Colors.white70)))
        ],
      ),
      floatingActionButton: ElevatedButton(
        child: Text("Add"),
        onPressed: () {
          if (_addedWidgets.length < _dummyWidgets.length) {
            setState(() {
              _addedWidgets.add(OverlayWidget(
                  onDragEnd: () {},
                  // onDragMove: (Offset offset) {
                  //   print("DRAG MOVE");
                  // },
                  onDragUpdate: (Offset offset) {
                    // print("X ${offset.dx}");
                    // print("Y ${offset.dy}");
                  },
                  onDragStart: () {},
                  child: _dummyWidgets.elementAt(_addedWidgets.length)));
            });
          }
        },
      ),
    );
  }

  final List<Widget> _dummyWidgets = [
    Text("Cuong", style: TextStyle(fontSize: 120)),
    ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(8.0),
            child: Text("THIS IS BEAUTIFUL"))),
    SizedBox(
        width: 150,
        height: 150,
        child: Image.asset('assets/333.jpeg', fit: BoxFit.cover))
  ];
}
