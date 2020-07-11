import 'dart:ui';

import 'package:ant_icons/ant_icons.dart';
import 'package:calculator/models/equation.dart';
import 'package:fluid_layout/fluid_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:avatar_glow/avatar_glow.dart';

String strInput = "";
final textControllerInput = TextEditingController();
final textControllerResult = TextEditingController();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Equation> equationList = [
    Equation("", ""),
    Equation("", ""),
    Equation("", ""),
    Equation("", ""),
  ];

  String value;

  @override
  void initState() {
    super.initState();

    // listining changes
    textControllerInput.addListener(() {});
    textControllerResult.addListener(() {});
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    textControllerInput.dispose();
    textControllerResult.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FluidLayout(
      child: Builder(
          builder: (context) => CustomScrollView(
                slivers: [
                  SliverFluidGrid(
                    fluid: false,
                    spacing: 0,
                    children: [
                      // input for calculating
                      FluidCell.withFluidHeight(
                        size: context.fluid(8),
                        heightSize: context.fluid(4.3),
                        child: Container(
                          padding: EdgeInsets.only(top: 30),
                          // height: context.fluid(7),
                          decoration: BoxDecoration(color: Color(0xFF26343c)),
                          child: new Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
                              inputFormatters: [
                                BlacklistingTextInputFormatter(RegExp(
                                    "[abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@|\"}{}?><]")),
                                //
                              ],
                              // onTap: () => FocusScope.of(context)
                              //     .requestFocus(new FocusNode()),
                              controller: textControllerInput,
                              onChanged: (text) {
                                value = text;
                                // debugPrint(value);
                                Parser p = new Parser();
                                // Bind Variable
                                ContextModel cm = new ContextModel();
                                Expression exp = p.parse(text);
                                setState(() {
                                  textControllerResult.text = exp
                                      .evaluate(EvaluationType.REAL, cm)
                                      .toString();
                                });
                              },

                              onEditingComplete: () {
                                // My Calculator
                                //Parse expression
                                Parser p = new Parser();
                                // Bind Variable
                                ContextModel cm = new ContextModel();
                                Expression exp =
                                    p.parse(textControllerInput.text);
                                setState(() {
                                  textControllerResult.text = exp
                                      .evaluate(EvaluationType.REAL, cm)
                                      .toString();
                                });
                              },
                              decoration: new InputDecoration.collapsed(
                                  hintText: "0",
                                  hintStyle:
                                      TextStyle(color: CupertinoColors.white)),
                              style: TextStyle(
                                  fontSize: 50,
                                  fontFamily: "JetBrains",
                                  color: CupertinoColors.white),
                              textAlign: TextAlign.right,
                              cursorColor: Color(0xFFc346c7),
                              cursorWidth: 3,
                              cursorRadius: Radius.circular(10),
                              minLines: 1,
                              maxLines: 1,
                              autofocus: true,
                            ),
                          ),
                          // height: 159,
                        ),
                      ),
                      // RESULT
                      FluidCell.withFluidHeight(
                        size: context.fluid(4),
                        heightSize: context.fluid(4.3),
                        child: Container(
                          padding: EdgeInsets.only(top: 30),
                          decoration: BoxDecoration(color: Color(0xFF232f35)),
                          child: new Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
                              controller: textControllerResult,
                              decoration: new InputDecoration.collapsed(
                                  hintText: "0",
                                  hintStyle:
                                      TextStyle(color: Color(0xFFffa938))),
                              style: TextStyle(
                                  fontSize: 50,
                                  fontFamily: "JetBrains",
                                  color: Color(0xFFffa938)),
                            ),
                          ),
                          // height: 159,
                        ),
                      ),
                      FluidCell.withFluidHeight(
                        size: context.fluid(8),
                        heightSize: context.fluid(1.7),
                        child: Container(
                          decoration: BoxDecoration(color: Color(0xFF26343c)),
                          child: FluidGridView(
                            // fluid: false,
                            children: [
                              FluidCell.fit(
                                size: context.fluid(1),
                                child: Container(
                                  child: IconButton(
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                      onPressed: () => setState(() {
                                            textControllerInput.text =
                                                textControllerInput.text + "+";
                                          })),
                                ),
                              ),
                              FluidCell.fit(
                                size: context.fluid(1),
                                child: Container(
                                  child: IconButton(
                                      icon: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                      onPressed: () => setState(() {
                                            textControllerInput.text =
                                                textControllerInput.text + "-";
                                          })),
                                ),
                              ),
                              FluidCell.fit(
                                size: context.fluid(1),
                                child: Container(
                                  child: IconButton(
                                      icon: Icon(
                                        Icons.clear,
                                        color: Colors.white,
                                      ),
                                      onPressed: () => setState(() {
                                            textControllerInput.text =
                                                textControllerInput.text + "*";
                                          })),
                                ),
                              ),
                              FluidCell.fit(
                                size: context.fluid(1),
                                child: Container(
                                  child: IconButton(
                                      icon: Text(
                                        // FontAwesomeIcons.percentage,
                                        // Icons.pou,
                                        "/",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onPressed: () => setState(() {
                                            textControllerInput.text =
                                                textControllerInput.text + "/";
                                          })),
                                ),
                              ),
                            ],
                          ),
                          // height: 159,
                        ),
                      ),
                      FluidCell.withFluidHeight(
                        size: context.fluid(4),
                        heightSize: context.fluid(1.7),
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            // alignment: Alignment.bottomLeft,
                            decoration: BoxDecoration(color: Color(0xFF232f35)),
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    AvatarGlow(
                                        glowColor: CupertinoColors.activeBlue,
                                        child: IconButton(
                                            icon: Icon(
                                              AntIcons.twitter_outline,
                                              size: 10,
                                              color: CupertinoColors.activeBlue,
                                            ),
                                            onPressed: () {}),
                                        endRadius: 20),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(
                                        "© 2020 ",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color:
                                                CupertinoColors.inactiveGray),
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(
                                        "vesrion 1.0-alpha",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color:
                                                CupertinoColors.inactiveGray),
                                      ),
                                    ),
                                    AvatarGlow(
                                        child: IconButton(
                                            icon: Icon(
                                              AntIcons.github,
                                              color: CupertinoColors.white,
                                            ),
                                            onPressed: () {}),
                                        endRadius: 20)
                                  ],
                                )
                              ],
                            )
                            // height: 159,
                            ),
                      )
                    ],
                  )
                ],
              )),
    );
  }
}
