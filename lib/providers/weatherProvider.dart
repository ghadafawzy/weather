import 'package:final_weather/models/weatherModel.dart';
import 'package:flutter/cupertino.dart';

class WeatherProvider extends ChangeNotifier{
  WeatherModel? _weatherData;
  set weatherData(WeatherModel? weather){
    _weatherData = weather;
    notifyListeners();
  }
  WeatherModel? get weatherData => _weatherData;
}