// ignore_for_file: prefer_const_constructors

import 'package:aya2/components/knowbase/subarticle.dart';
import 'package:aya2/models/knowbase/subarticles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SubArticlesMode article = Get.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('Knowledge Base'),
          centerTitle: true,
        ),
        body: SubArticleComponent(article: article));
  }
}
