// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:aya2/components/knowbase/addtoknow.dart';
import 'package:aya2/components/knowbase/subarticles.dart';
import 'package:aya2/screens/drawer.dart';
import 'package:flutter/material.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({Key? key}) : super(key: key);

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          drawer: mainDrawer(),
          appBar: AppBar(
            title: Text("Content"),
            centerTitle: true,
            bottom: const TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.amberAccent,
              tabs: [
                Tab(
                  child: Text(
                    "KnowledgeBase",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Tab(
                  child: Text("Add Content",
                      style: TextStyle(
                        fontSize: 18,
                      )),
                ),
              ],
            ),
          ),
          body: TabBarView(children: [SubArticlesComponent(), AddForm()])),
    );
  }
}
