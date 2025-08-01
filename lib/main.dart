import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news/home_screen.dart';
import 'package:news/internet_service.dart';
import 'package:news/models/articles.dart';
import 'package:news/models/news_data_response.dart';
import 'package:news/models/source_response.dart';

import 'package:news/observer.dart';

import 'models/sources.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InternetService().init();

  await Hive.initFlutter();
  Hive.registerAdapter(SourcesAdapter());
  Hive.registerAdapter(SourceResponseAdapter());
  Hive.registerAdapter(ArticlesAdapter());
  Hive.registerAdapter(NewsDataResponseAdapter());

  // Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}

// POST - GET
