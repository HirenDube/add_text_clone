// ignore_for_file: must_be_immutable

import 'package:add_text_clone/Model%20Class/layerStoreRoom.dart';
import 'package:add_text_clone/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';

import 'Controller/Controller Class.dart';
import 'buildPositionedTextWidget.dart';

class EditWindow extends StatefulWidget {
  Widget square;

  EditWindow({super.key, required this.square});

  @override
  State<EditWindow> createState() => _EditWindowState();
}

class _EditWindowState extends State<EditWindow> {
  ScreenshotController imageSaver = ScreenshotController();

  List<Widget> layers = [];
  List<String> textLayers = [];

  double dx = 10, dy = 10;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Hive.close();
  }

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    LayerStorage obj1 = HiveController.getLayer;

    if (obj1.newProject) {
      layers = [
        widget.square,
      ];
    } else if (!obj1.newProject) {
      List<Widget> progress = obj1.storedLayer;
      layers = [
        widget.square,
      ];
      layers.addAll(progress);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemGrey5,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                color: Colors.white,
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(CupertinoIcons.back)),
                    IconButton(
                        onPressed: null, icon: const Icon(Icons.apps_outlined)),
                    IconButton(onPressed: null, icon: const Icon(Icons.undo)),
                    IconButton(
                        onPressed: () {
                          String val = "";
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: SizedBox(
                                      width: 250,
                                      child: TextField(
                                        onChanged: (val1) {
                                          val = val1;
                                        },
                                        decoration: const InputDecoration(
                                            labelText: "Enter Text : "),
                                      ),
                                    ),
                                    actionsAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    actions: [
                                      OutlinedButton(
                                          onPressed: () {
                                            layers.add(BuildPostionedText(
                                                val: val,
                                                position: Offset(dx, dy)));

                                            setState(() {
                                              Navigator.pop(context);
                                            });
                                          },
                                          child: const Text("Add")),
                                      OutlinedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Cansel")),
                                    ],
                                  ));
                        },
                        icon: const Icon(Icons.add)),
                    IconButton(onPressed: null, icon: const Icon(Icons.redo)),
                    IconButton(
                        onPressed: null,
                        icon: const Icon(CupertinoIcons.layers_alt)),
                    IconButton(
                        onPressed: () {
                          imageSaver.capture().then((value) async {
                            if (value != null) {
                              ImageGallerySaver.saveImage(value,
                                  quality: 50, name: "NewImage1.jpj");
                              Fluttertoast.showToast(
                                  msg: "Image Saved Successfully ");
                            }
                          });
                        },
                        icon: const Icon(Icons.save)),
                  ],
                ),
              ),
              const SizedBox(
                height: 38,
              ),
              Screenshot(
                controller: imageSaver,
                child: SizedBox(
                    height: MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(children: layers)),
              ),
              const SizedBox(
                height: 38,
              ),
              Container(
                color: Colors.white,
                height: 265,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Add Layer",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Divider(
                          color: Colors.transparent,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                                onPressed: () {
                                  String val = "";
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: SizedBox(
                                              width: 250,
                                              child: TextField(
                                                onChanged: (val1) {
                                                  val = val1;
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                        labelText:
                                                            "Enter Text : "),
                                              ),
                                            ),
                                            actionsAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            actions: [
                                              OutlinedButton(
                                                  onPressed: () {
                                                    layers.add(
                                                        BuildPostionedText(
                                                            val: val,
                                                            position: Offset(
                                                                dx, dy)));

                                                    setState(() {
                                                      Navigator.pop(context);
                                                    });
                                                  },
                                                  child: const Text("Add")),
                                              OutlinedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text("Cansel")),
                                            ],
                                          ));
                                },
                                child: const Column(
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: Colors.black,
                                    ),
                                    Divider(
                                      color: Colors.transparent,
                                    ),
                                    Text(
                                      "Add Text",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                )), // add text
                            TextButton(
                                onPressed: () {},
                                child: const Column(
                                  children: [
                                    Icon(
                                      Icons.add_photo_alternate_outlined,
                                      color: Colors.black,
                                    ),
                                    Divider(
                                      color: Colors.transparent,
                                    ),
                                    Text(
                                      "Photo",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                )),
                            TextButton(
                                onPressed: () {},
                                child: const Column(
                                  children: [
                                    Icon(
                                      Icons.interests_outlined,
                                      color: Colors.black,
                                    ),
                                    Divider(
                                      color: Colors.transparent,
                                    ),
                                    Text(
                                      "Shape",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                )),
                            TextButton(
                                onPressed: () {},
                                child: const Column(
                                  children: [
                                    Icon(
                                      Icons.emoji_emotions_outlined,
                                      color: Colors.black,
                                    ),
                                    Divider(
                                      color: Colors.transparent,
                                    ),
                                    Text(
                                      "Sticker",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                )),
                            TextButton(
                                onPressed: () {},
                                child: const Column(
                                  children: [
                                    Icon(
                                      Icons.style_outlined,
                                      color: Colors.black,
                                    ),
                                    Divider(
                                      color: Colors.transparent,
                                    ),
                                    Text(
                                      "Style",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                )),
                          ],
                        ),
                        const Divider(),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Background",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Divider(
                          color: Colors.transparent,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    layers.remove(widget.square);
                                    LayerStorage tempOb = LayerStorage()
                                      ..storedLayer = layers
                                      ..newProject = false;
                                    HiveController.storeLayer = tempOb;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyHomePage()));
                                  },
                                  child: const Column(
                                    children: [
                                      Icon(
                                        Icons.image,
                                        color: Colors.black,
                                      ),
                                      Divider(
                                        color: Colors.transparent,
                                      ),
                                      Text(
                                        "Replace",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  )),
                              TextButton(
                                  onPressed: () {},
                                  child: const Column(
                                    children: [
                                      Icon(
                                        Icons.auto_fix_normal_outlined,
                                        color: Colors.black,
                                      ),
                                      Divider(
                                        color: Colors.transparent,
                                      ),
                                      Text(
                                        "Effects",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  )),
                              TextButton(
                                  onPressed: () {},
                                  child: const Column(
                                    children: [
                                      Icon(
                                        Icons.crop_outlined,
                                        color: Colors.black,
                                      ),
                                      Divider(
                                        color: Colors.transparent,
                                      ),
                                      Text(
                                        "Crop",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  )),
                              TextButton(
                                  onPressed: () {},
                                  child: const Column(
                                    children: [
                                      Icon(
                                        Icons.aspect_ratio_outlined,
                                        color: Colors.black,
                                      ),
                                      Divider(
                                        color: Colors.transparent,
                                      ),
                                      Text(
                                        "Resize",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  )),
                              TextButton(
                                  onPressed: () {},
                                  child: const Column(
                                    children: [
                                      Icon(
                                        Icons.rotate_90_degrees_ccw_outlined,
                                        color: Colors.black,
                                      ),
                                      Divider(
                                        color: Colors.transparent,
                                      ),
                                      Text(
                                        "Flip/Rotate",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  )),
                              TextButton(
                                  onPressed: () {},
                                  child: const Column(
                                    children: [
                                      Icon(
                                        Icons.crop_din_outlined,
                                        color: Colors.black,
                                      ),
                                      Divider(
                                        color: Colors.transparent,
                                      ),
                                      Text(
                                        "Square Fit",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
