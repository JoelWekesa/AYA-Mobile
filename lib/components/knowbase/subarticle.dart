// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:aya2/models/knowbase/subarticles.dart';
import 'package:aya2/palette.dart';
import 'package:aya2/screens/customcontainer.dart';

class SubArticleComponent extends StatelessWidget {
  final SubArticlesMode article;
  const SubArticleComponent({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return customContainer(articleComponent(article, context));
  }
}

Widget articleComponent(SubArticlesMode article, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              article.articleTitle!,
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(article.subarticleTitle!, style: Theme.of(context).textTheme.headline6),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(color: Palette.kToDark),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                article.content!,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
