import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show
  debugPaintSizeEnabled,
  debugPaintBaselinesEnabled,
  debugPaintLayerBordersEnabled,
  debugPaintPointersEnabled,
  debugRepaintRainbowEnabled;
import 'package:flutter_blue_example/app_configuration.dart';
import 'package:flutter_blue_example/app_home.dart';
import 'package:flutter_blue_example/app_settings.dart';
import 'package:flutter_blue_example/app_strings.dart';
import 'package:intl/intl.dart';
import 'i18n/app_messages_all.dart';

class FlutterBlueApp extends StatefulWidget {
  @override
  FlutterBlueAppState createState() => new FlutterBlueAppState();
}

class FlutterBlueAppState extends State<FlutterBlueApp> {

  final Map<String, Object> _stocks = <String, Object>{};
  final List<String> _symbols = <String>[];

  AppConfiguration _configuration = new AppConfiguration(
      displayMode: DisplayMode.light,
      debugShowGrid: false,
      debugShowSizes: false,
      debugShowBaselines: false,
      debugShowLayers: false,
      debugShowPointers: false,
      debugShowRainbow: false,
      showPerformanceOverlay: false,
      showSemanticsDebugger: false
  );

  @override
  void initState() {
    super.initState();
    /*new StockDataFetcher((StockData data) {
      setState(() {
        data.appendTo(_stocks, _symbols);
      });
    });*/
  }

  void configurationUpdater(AppConfiguration value) {
    setState(() {
      _configuration = value;
    });
  }

  ThemeData get theme {
    switch (_configuration.displayMode) {
      case DisplayMode.light:
        return new ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.blue
        );
      case DisplayMode.dark:
        return new ThemeData(
            brightness: Brightness.dark,
            accentColor: Colors.blueAccent
        );
    }
    assert(_configuration.displayMode != null);
    return null;
  }

  Route<Null> _getRoute(RouteSettings settings) {
    final List<String> path = settings.name.split('/');
    if (path[0] != '')
      return null;
    if (path[1] == 'stock') {
      if (path.length != 3)
        return null;
      /*if (_stocks.containsKey(path[2])) {
        return new MaterialPageRoute<Null>(
            settings: settings,
            builder: (BuildContext context) => new StockSymbolPage(stock: _stocks[path[2]])
        );
      }*/
    }
    return null;
  }

  Future<LocaleQueryData> _onLocaleChanged(Locale locale) async {
    final String localeString = locale.toString();
    await initializeMessages(localeString);
    Intl.defaultLocale = localeString;
    return AppStrings.instance;
  }

  @override
  Widget build(BuildContext context) {
    assert(() {
      debugPaintSizeEnabled = _configuration.debugShowSizes;
      debugPaintBaselinesEnabled = _configuration.debugShowBaselines;
      debugPaintLayerBordersEnabled = _configuration.debugShowLayers;
      debugPaintPointersEnabled = _configuration.debugShowPointers;
      debugRepaintRainbowEnabled = _configuration.debugShowRainbow;
      return true;
    });
    return new MaterialApp(
        title: 'FlutterBlue',
        theme: theme,
        debugShowMaterialGrid: _configuration.debugShowGrid,
        showPerformanceOverlay: _configuration.showPerformanceOverlay,
        showSemanticsDebugger: _configuration.showSemanticsDebugger,
        routes: <String, WidgetBuilder>{
          '/':         (BuildContext context) => new AppHome(_stocks, _symbols, _configuration, configurationUpdater),
          '/settings': (BuildContext context) => new AppSettings(_configuration, configurationUpdater)
        },
        onGenerateRoute: _getRoute,
        onLocaleChanged: _onLocaleChanged
    );
  }
}

void main() {
  runApp(new FlutterBlueApp());
}