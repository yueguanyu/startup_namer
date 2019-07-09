import 'package:flutter/material.dart';
import 'package:startup_namer/screens/location_detail/location_detail.dart';
import 'package:startup_namer/screens/locations/locations.dart';
import 'package:startup_namer/screens/big_bloc/index.dart';
import 'package:startup_namer/screens/home/index.dart';
import 'package:startup_namer/style.dart';

const LocationsRoute = '/';
const LocationDetailRoute = '/location_detail';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _routes(),
      theme: _theme(),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case LocationsRoute:
          screen = BigBlocPage();
          break;
        case LocationDetailRoute:
          screen = LocationDetail(arguments['id']);
          break;
          default:
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }

  ThemeData _theme() {
    return ThemeData(
      appBarTheme: AppBarTheme(textTheme: TextTheme(title: AppBarTextStyle)),
      textTheme: TextTheme(
        title: TitleTextStyle,
        subtitle: SubTitleTextStyle,
        caption: CaptionTextStyle,
        body1: Body1TextStyle,
      )
    );
  }
}