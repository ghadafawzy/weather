import 'package:final_weather/models/weatherModel.dart';
import 'package:final_weather/pages/HomePage.dart';
import 'package:final_weather/providers/weatherProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(ChangeNotifierProvider(create: (context)
   {
    return WeatherProvider();
   },child: MyApp()));
}

class MyApp extends StatelessWidget {
  //WeatherModel? weather;
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).weatherData==null?Colors.blue:
        Provider.of<WeatherProvider>(context).weatherData!.getThemColor(),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
