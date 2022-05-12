
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherModel{

  String weatherStateName;
  String date;
  double temp;
  double minTemp;
  double maxTemp;

  WeatherModel({

    required this.weatherStateName,
    required this.date,
    required this.temp,
    required this.minTemp,
   required this.maxTemp,
  });

  factory WeatherModel.fromJson(Map <String, dynamic> data){
    return WeatherModel(

        weatherStateName: data['weather_state_name'],
        date:data['applicable_date'],
        temp:  data['the_temp'],
        minTemp:data['min_temp'],
        maxTemp: data['max_temp'],
    );
  }
  String getImage(){
    if(weatherStateName=='Clear'|| weatherStateName=='Light Cloud'){
      return 'images/clear.png';
    } else if(weatherStateName=='Sleet'|| weatherStateName=='Snow'|| weatherStateName=='Hail'){
      return 'images/snow.png';
    } else if(weatherStateName=='Heavy Cloud'){
      return 'images/cloudy.png';
    }else if(weatherStateName=='Light Rain'|| weatherStateName=='Heavy Rain'|| weatherStateName=='Showers'){
      return 'images/rainy.png';
    }else if(weatherStateName=='Thunderstorm'|| weatherStateName=='Thunder'){
      return 'images/thunderstorm.png';
    } else { return 'images/clear.png';
    }
  }

  MaterialColor getThemColor(){
    if(weatherStateName=='Clear'|| weatherStateName=='Light Cloud'){
      return Colors.orange;
    } else if(weatherStateName=='Sleet'|| weatherStateName=='Snow'|| weatherStateName=='Hail'){
      return Colors.blue;
    } else if(weatherStateName=='Heavy Cloud'){
      return Colors.blueGrey;
    }else if(weatherStateName=='Light Rain'|| weatherStateName=='Heavy Rain'|| weatherStateName=='Showers'){
      return Colors.blue;
    }else if(weatherStateName=='Thunderstorm'|| weatherStateName=='Thunder'){
      return Colors.blueGrey;
    } else { return Colors.orange;
    }
  }
}
