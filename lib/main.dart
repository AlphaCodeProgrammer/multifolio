import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './provider/general.dart';
import 'Routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Flurorouter.setupRouter();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (ctx) => General(),
      ),
    ], child: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    final g = Provider.of<General>(context);
    return MaterialApp(
      theme: g.lightTheme,
      darkTheme: g.darkTheme,
      themeMode: g.themeMode,
      initialRoute: '/',
      onGenerateRoute: Flurorouter.router.generator,
    );
  }
}
