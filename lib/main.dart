import 'dart:io';

import 'package:add_text_clone/editWindow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Add Text Clone',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
          primaryColor: Colors.white,
          brightness: Brightness.light),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<LinearGradient> gradientList = <LinearGradient>[
    LinearGradient(
      colors: [
        Colors.white,
        Colors.black,
      ],
    ),
    LinearGradient(
      colors: [
        CupertinoColors.destructiveRed,
        Colors.indigo,
      ],
    ),
    LinearGradient(
      colors: [
        Colors.teal,
        Colors.orange,
      ],
    ),
    LinearGradient(
      colors: [
        Colors.red,
        Colors.tealAccent,
      ],
    ),
    LinearGradient(
      colors: [
        Colors.purple,
        Colors.tealAccent,
      ],
    ),
    LinearGradient(
      colors: [
        Colors.deepPurple,
        Colors.amber,
      ],
    ),
    LinearGradient(
      colors: [
        Colors.deepOrangeAccent.withOpacity(0.3),
        Colors.deepPurple.shade900,
      ],
    ),
    LinearGradient(
      colors: [
        Colors.greenAccent,
        Colors.blue,
      ],
    ),
  ];
  List<Widget> gradientBoxes = <Widget>[];

  List colors = <Color>[
    // Colors.white,
    Colors.black,
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.lightBlue,
    Colors.cyan,
    Colors.green,
    Colors.lightGreen,
    Colors.lime,
    Colors.yellow,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey
  ];

  var brightnessMode = false;
  List<Widget> colorCircles = [];

  XFile? photo;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    colorCircles = [
      Colors.white,
      Colors.black,
      Colors.red,
      Colors.pink,
      Colors.purple,
      Colors.blue,
      Colors.cyan,
      Colors.green,
      Colors.lightGreen,
      Colors.lime,
      Colors.yellow,
      Colors.amber,
      Colors.orange,
      Colors.deepOrange,
      Colors.brown,
      Colors.grey,
      Colors.blueGrey
    ]
        .map((e) =>
        InkWell(
          borderRadius: BorderRadius.circular(60),
          // radius: 100,
          onTap: () {
            nextScreen(
              context,
              Container(
                // margin: EdgeInsets.all(5),
                decoration: BoxDecoration(color: e),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(color: e, shape: BoxShape.circle),
          ),
        ))
        .toList();

    for (var element in gradientList) {
      gradientBoxes.add(InkWell(
        borderRadius: BorderRadius.circular(60),
        // radius: 100,
        onTap: () {
          nextScreen(
            context,
            Transform.rotate(
              angle: 1.57,
              child: Container(
                // margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), gradient: element),
              ),
            ),
          );
        },
        child: Transform.rotate(
          angle: 1.57,
          child: Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), gradient: element),
          ),
        ),
      ));
    }

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 45,
          title: Row(
            children: [
              const Text(
                "Dark mode",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              Switch(
                value: brightnessMode,
                activeColor: Colors.white,
                inactiveThumbColor: Colors.black,
                trackColor: const MaterialStatePropertyAll(Colors.grey),
                onChanged: (value) {
                  setState(() {
                    brightnessMode = value;
                  });
                },
              )
            ],
          ),
          elevation: 1,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Text(
                "Background",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Divider(
                color: Colors.transparent,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: GridView(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1),
                    children: [
                      ...colorCircles,
                      InkWell(
                        borderRadius: BorderRadius.circular(60),
                        onTap: () =>
                            showModalBottomSheet(
                                context: context,
                                builder: (context) =>
                                    ListView(
                                        children: List.generate(
                                          19,
                                              (ind) =>
                                              Row(
                                                children: List.generate(
                                                  10,
                                                      (index) =>
                                                      InkWell(
                                                        borderRadius: BorderRadius
                                                            .circular(60),
                                                        // radius: 100,
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);

                                                          nextScreen(
                                                            context,
                                                            Container(
                                                              height: MediaQuery
                                                                  .of(context)
                                                                  .size
                                                                  .width,
                                                              width: MediaQuery
                                                                  .of(context)
                                                                  .size
                                                                  .width,
                                                              // margin: EdgeInsets.all(5),
                                                              decoration: BoxDecoration(
                                                                color: colors[ind]
                                                                    .withOpacity(
                                                                    double
                                                                        .parse(
                                                                        "0.${index}5")),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        child: Container(
                                                          height: 29,
                                                          width: 29,
                                                          margin: EdgeInsets
                                                              .all(5),
                                                          decoration: BoxDecoration(
                                                              color: colors[ind]
                                                                  .withOpacity(
                                                                  double.parse(
                                                                      "0.${index}5")),
                                                              shape: BoxShape
                                                                  .circle),
                                                        ),
                                                      ),
                                                ),
                                              ),
                                        ))),
                        child: Container(
                          margin: EdgeInsets.all(4),
                          // height: 30,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Colors.grey.shade300),
                              color: Colors.white,
                              shape: BoxShape.circle),
                          child: Icon(
                            CupertinoIcons.chevron_up,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ]),
              ), //colors              Divider(color: Colors.transparent,),

              SizedBox(
                height: 50,
                child: GridView(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1),
                    children: [
                      ...gradientBoxes,
                      SizedBox(
                        child: Padding(
                          padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Icon(
                              CupertinoIcons.chevron_up,
                              size: 17,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    ]),
              ),
              Divider(
                color: Colors.transparent,
              ),

              Text(
                "Pick Background Images\n",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: double.infinity,
                height: 120,
                child: ButtonBar(
                  alignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.grey.shade700,
                            backgroundColor: Colors.grey.shade300,
                            fixedSize: Size(170, 120)),
                        onPressed: () async {
                          photo = await ImagePicker()
                              .pickImage(source: ImageSource.camera);
                          if (photo != null) {
                            nextScreen(
                                context,
                                Container(
                                  // margin: EdgeInsets.all(5),
                                    child: Image.file(
                                      File(photo!.path),
                                      fit: BoxFit.fill,
                                    )));
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(CupertinoIcons.camera),
                            Text("Pick From Camera")
                          ],
                        )),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.grey.shade700,
                            backgroundColor: Colors.grey.shade300,
                            fixedSize: Size(170, 120)),
                        onPressed: () async {
                          photo = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (photo != null) {
                            nextScreen(
                                context,
                                Container(
                                  // margin: EdgeInsets.all(5),
                                    child: Image.file(
                                      File(photo!.path),
                                      fit: BoxFit.cover,
                                    )));
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(CupertinoIcons.photo),
                            Text("Pick From Gallery")
                          ],
                        )),
                  ],
                ),
              ), //gradients
            ],
          ),
        ));
  }
}

nextScreen(BuildContext contex, Widget square) {
  Navigator.of(contex).push(MaterialPageRoute(
      builder: (context) =>
          EditWindow(
              square: SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .width,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: square,
              ))));
}
