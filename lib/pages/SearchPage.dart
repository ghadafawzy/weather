
import 'package:final_weather/Services/WeatherServices.dart';
import 'package:final_weather/models/weatherModel.dart';
import 'package:final_weather/providers/weatherProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SearchPage extends StatelessWidget {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search City',style: TextStyle(fontSize: 20),),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data){
              cityName=data;
            },
            onSubmitted: (data) async{
              cityName=data;
              WeatherService service =WeatherService();
             WeatherModel? weather = await service.getWeather(cityName: cityName!);
             Provider.of <WeatherProvider>(context,listen: false).weatherData =weather ;

             Navigator.pop(context);
            },
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 30,horizontal: 24),
                labelText: 'Search',
                suffixIcon: GestureDetector(

                  onTap: ()async{
                    WeatherService service =WeatherService();
                    WeatherModel? weather = await service.getWeather(cityName: cityName!);
                    Provider.of <WeatherProvider>(context,listen: false).weatherData =weather ;

                    Navigator.pop(context);
                  },
                    child: Icon(Icons.search)),
                border:OutlineInputBorder(),
                hintText: 'Enter a city'
            ),
          ),
        ),
      ),
    );
  }
}
