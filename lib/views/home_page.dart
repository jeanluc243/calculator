import 'dart:ui';

import 'package:ant_icons/ant_icons.dart';
import 'package:fluid_layout/fluid_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:avatar_glow/avatar_glow.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                      FluidCell.withFluidHeight(
                        size: context.fluid(4),
                        heightSize: context.fluid(4.3),
                        child: Container(
                          padding: EdgeInsets.only(top: 30),
                          decoration: BoxDecoration(color: Color(0xFF232f35)),
                          child: new Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
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
                                      onPressed: () {}),
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
                                      onPressed: () {}),
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
                                      onPressed: () {}),
                                ),
                              ),
                              FluidCell.fit(
                                size: context.fluid(1),
                                child: Container(
                                  child: IconButton(
                                      icon: Icon(
                                        FontAwesomeIcons.percentage,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {}),
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
