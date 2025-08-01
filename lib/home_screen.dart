import 'package:flutter/material.dart';

import 'package:news/app_drawer.dart';
import 'package:news/categories_section.dart';
import 'package:news/models/source_response.dart';
import 'package:news/sources_section.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryName ?? "Home"),
          centerTitle: true,
        ),
        drawer: AppDrawer(
          onTap: onDrawerClicked,
        ),
        body: categoryName == null
            ? CategoriesSection(
                onTap: onCategoryClicked,
              )
            : SourcesSection(
                catId: categoryName!,
          onTap: onDrawerClicked,
              ));
  }

  String? categoryName = null;

  onDrawerClicked() {
    Navigator.pop(context);
    categoryName = null;
    setState(() {});
  }

  onCategoryClicked(category) {
    categoryName = category;
    setState(() {});
  }
}
