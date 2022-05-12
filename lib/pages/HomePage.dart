import 'package:final_weather/models/weatherModel.dart';
import 'package:final_weather/pages/SearchPage.dart';
import 'package:final_weather/providers/weatherProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton ( onPressed:(){
          Navigator.push(context, MaterialPageRoute(builder:(context)
          {
            return SearchPage();
          }));
        },
          icon:Icon(Icons.search),)],
        title: Text('Weather App',style: TextStyle(fontSize: 20),),
      ),
      body: Provider.of <WeatherProvider>(context).weatherData == null? Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('There is no weather 😔 start ',
              style: TextStyle(fontSize:25),),
            Text('searching now 🔍 ',
              style: TextStyle(fontSize:25),),
          ],
        ),
      ): Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Provider.of<WeatherProvider>(context).weatherData!.getThemColor(),
              Provider.of<WeatherProvider>(context).weatherData!.getThemColor()[300]!,
              Provider.of<WeatherProvider>(context).weatherData!.getThemColor()[100]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(flex: 3,),
            Text( '' ,style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
            Text('updated at: ${Provider.of<WeatherProvider>(context).weatherData!.date}',
              style: TextStyle(fontSize: 22),),

            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(Provider.of<WeatherProvider>(context).weatherData!.getImage()),
                Text(Provider.of<WeatherProvider>(context).weatherData!.temp.toInt().toString(), style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
                Column(
                  children: [
                    Text('maxTemp:${Provider.of<WeatherProvider>(context).weatherData!.maxTemp.toInt()}',style: TextStyle(fontSize: 22),),
                    Text('minTemp:${Provider.of<WeatherProvider>(context).weatherData!.minTemp.toInt()}',style: TextStyle(fontSize: 22),),
                  ],
                )
              ],
            ),
            Spacer(),
            Text(Provider.of<WeatherProvider>(context).weatherData!.weatherStateName,style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
            const Spacer(flex: 5,),
          ],
        ),
      ),
    );
  }
}
