// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';

class BuildPostionedText extends StatefulWidget {
  String val;

  Offset position;

  BuildPostionedText({required this.val, required this.position});

  @override
  State<BuildPostionedText> createState() => _BuildPostionedTextState();
}

class _BuildPostionedTextState extends State<BuildPostionedText> {
  String fontFamily = "";

  double dx = 0, dy = 0, textSize = 15;
  Color color = Colors.white;
  TextEditingController newText = TextEditingController();

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    dx = widget.position.dx;
    dy = widget.position.dy;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: dy,
      left: dx,
      child: GestureDetector(
        onDoubleTap: () {
          newText.text = widget.val;
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    actionsAlignment: MainAxisAlignment.spaceEvenly,
                    actions: [
                      OutlinedButton(
                          onPressed: () {
                            setState(() {
                              widget.val = newText.text;
                            });
                            Navigator.pop(context);
                          },
                          child: Text("EDIT"))
                    ],
                    title: TextField(
                      controller: newText,
                      decoration:
                          InputDecoration(labelText: "Enter new text : "),
                    ),
                  ));
        },
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Slider(
                          min: 15,
                          max: 120,
                          value: textSize,
                          onChanged: (double value) {
                            setState(() {
                              textSize = value;
                            });
                          },
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                  style: TextButton.styleFrom(
                                      shape: CircleBorder()),
                                  onPressed: () {
                                    setState(() {
                                      color = Colors.red;
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.red,
                                  )),
                              TextButton(
                                  style: TextButton.styleFrom(
                                      shape: CircleBorder()),
                                  onPressed: () {
                                    setState(() {
                                      color = Colors.green;
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.green,
                                  )),
                              TextButton(
                                  style: TextButton.styleFrom(
                                      shape: CircleBorder()),
                                  onPressed: () {
                                    setState(() {
                                      color = Colors.black;
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.black,
                                  )),
                              TextButton(
                                  style: TextButton.styleFrom(
                                      shape: CircleBorder()),
                                  onPressed: () {
                                    setState(() {
                                      color = Colors.yellow;
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.yellow,
                                  )),
                              TextButton(
                                  style: TextButton.styleFrom(
                                      shape: CircleBorder()),
                                  onPressed: () {
                                    setState(() {
                                      color = Colors.indigo;
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.indigo,
                                  )),
                              TextButton(
                                  style: TextButton.styleFrom(
                                      shape: CircleBorder()),
                                  onPressed: () {
                                    setState(() {
                                      color = Colors.purple;
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.purple,
                                  )),
                              TextButton(
                                  style: TextButton.styleFrom(
                                      shape: CircleBorder()),
                                  onPressed: () {
                                    setState(() {
                                      color = Colors.teal;
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.teal,
                                  )),
                              TextButton(
                                  style: TextButton.styleFrom(
                                      shape: CircleBorder()),
                                  onPressed: () {
                                    setState(() {
                                      color = Colors.deepOrange;
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.deepOrange,
                                  )),
                              TextButton(
                                  style: TextButton.styleFrom(
                                      shape: CircleBorder()),
                                  onPressed: () {
                                    setState(() {
                                      color = Colors.pinkAccent;
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.pinkAccent,
                                  )),
                              TextButton(
                                  style: TextButton.styleFrom(
                                      shape: CircleBorder()),
                                  onPressed: () {
                                    setState(() {
                                      color = Colors.cyanAccent;
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.cyanAccent,
                                  )),
                              TextButton(
                                  style: TextButton.styleFrom(
                                      shape: CircleBorder()),
                                  onPressed: () {
                                    setState(() {
                                      color = Colors.limeAccent;
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.limeAccent,
                                  )),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      fontFamily = "AbrilFatface";

                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Text(
                                    widget.val,
                                    style: TextStyle(
                                        fontFamily: "AbrilFatface",
                                        color: Colors.black),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      fontFamily = "BrunoAce";

                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Text(
                                    widget.val,
                                    style: TextStyle(
                                        fontFamily: "BrunoAce",
                                        color: Colors.black),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      fontFamily = "DScript";

                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Text(
                                    widget.val,
                                    style: TextStyle(
                                        fontFamily: "DScript",
                                        color: Colors.black),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      fontFamily = "IndieFlower";

                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Text(
                                    widget.val,
                                    style: TextStyle(
                                        fontFamily: "IndieFlower",
                                        color: Colors.black),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      fontFamily = "JosefinSans";

                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Text(
                                    widget.val,
                                    style: TextStyle(
                                        fontFamily: "JosefinSans"
                                            "",
                                        color: Colors.black),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      fontFamily = "Julee";

                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Text(
                                    widget.val,
                                    style: TextStyle(
                                        fontFamily: "DScJuleerip"
                                            "t",
                                        color: Colors.black),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      fontFamily = "Kalam";

                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Text(
                                    widget.val,
                                    style: TextStyle(
                                        fontFamily: "Kalam",
                                        color: Colors.black),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      fontFamily = "KaushanScript";

                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Text(
                                    widget.val,
                                    style: TextStyle(
                                        fontFamily: "KaushanScri"
                                            "pt",
                                        color: Colors.black),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      fontFamily = "LilitaOne";

                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Text(
                                    widget.val,
                                    style: TextStyle(
                                        fontFamily: "LilitaOne",
                                        color: Colors.black),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      fontFamily = "Pacifico";

                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Text(
                                    widget.val,
                                    style: TextStyle(
                                        fontFamily: "Pacifico",
                                        color: Colors.black),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      fontFamily = "PermanentMarker";

                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Text(
                                    widget.val,
                                    style: TextStyle(
                                        fontFamily: "PermanentMa"
                                            "rker",
                                        color: Colors.black),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      fontFamily = "Tourney";

                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Text(
                                    widget.val,
                                    style: TextStyle(
                                        fontFamily: "Tourney",
                                        color: Colors.black),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ));
        },
        child: Draggable(
          onDraggableCanceled: (_, offset) {
            setState(() {
              // dx = dx + offset.dx;
              if (dx > 0) {
                dx = min(offset.dx, 360);
              } else if (dx < 0) {
                dx = max(offset.dx, 50);
              }
              print(dx);
              if (dy > 0) {
                dy = min(offset.dy, 360);
              } else if (dy < 0) {
                dy = max(offset.dy, 50);
              }
              print(dy);
            });
          },
          feedback: AnimatedDefaultTextStyle(
            style: TextStyle(
                shadows: [
                  BoxShadow(
                      blurStyle: BlurStyle.outer,
                      color: Colors.black,
                      blurRadius: 15,
                      spreadRadius: 20)
                ],
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: textSize,
                fontFamily: fontFamily),
            duration: Duration(milliseconds: 10),
            child: Text(
              widget.val,
            ),
          ),
          child: AnimatedDefaultTextStyle(
            style: TextStyle(
                shadows: [
                  BoxShadow(
                      blurStyle: BlurStyle.outer,
                      color: Colors.black,
                      blurRadius: 15,
                      spreadRadius: 20)
                ],
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: textSize,
                fontFamily: fontFamily),
            duration: Duration(milliseconds: 10),
            child: Text(
              widget.val,
            ),
          ),
        ),
      ),
    );
  }
}
