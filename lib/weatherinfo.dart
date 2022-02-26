import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeatherInfo extends StatefulWidget {
  const WeatherInfo({Key? key}) : super(key: key);

  @override
  _WeatherInfoState createState() => _WeatherInfoState();
}

class _WeatherInfoState extends State<WeatherInfo> {
  var temp;
  var description;
  var currently;
  var humidity;
  var windspeed;
  /*Future getWeather() async{
    http.Response response = await http.get("https://api.openweathermap.org/data/2.5/weather?lat=23.77&lon=90.36&appid=d067dcd1380a4268df8c2c744618d441");
    var results = jsonDecode(response.body)  as Map;
    setState(() {
      this.temp = results['main']['temp'];
      this.description = results['weather']['0']['description'];
      this.currently = results['weather']['0']['main'];
      this.humidity = results['main']['humidity'];
      this.windspeed = results['wind']['speed'];
    });
  }

  void initState(){
    super.initState();
    this.getWeather();
  }*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.pink,
          title: Text("Today Weather Info",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.lightBlueAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Current Location is Comilla", style: TextStyle( fontSize: 20, color: Colors.white),),
                        SizedBox(height: 5,),
                        Text(temp != null? temp.toString()+ "\u00b0" : "34.56\u00b0", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.white),),
                        SizedBox(height: 5,),
                        Text(currently != null? currently.toString() : "Clouds", style: TextStyle( fontSize: 20, color: Colors.white),),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child:  Padding(
                          padding: EdgeInsets.all(20.0),
                          child: ListView(
                            children: <Widget>[
                              ListTile(
                                title: Text("Temperature", style: TextStyle(fontWeight: FontWeight.bold),),
                                leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                                trailing: Text(temp != null? temp.toString()+ "\u00b0" : "34.56\u00b0"),
                              ),
                              ListTile(
                                title: Text("Weather", style: TextStyle(fontWeight: FontWeight.bold),),
                                leading: FaIcon(FontAwesomeIcons.cloud),
                                trailing: Text(description != null? description.toString()+ "\u00b0" : "Rainy"),
                              ),
                              ListTile(
                                title: Text("Humidity", style: TextStyle(fontWeight: FontWeight.bold),),
                                leading: FaIcon(FontAwesomeIcons.sun),
                                trailing: Text(humidity != null? humidity.toString()+ "\u00b0" : "102"),
                              ),
                              ListTile(
                                title: Text("Wind Speed", style: TextStyle(fontWeight: FontWeight.bold),),
                                leading: FaIcon(FontAwesomeIcons.wind),
                                trailing: Text(windspeed != null? windspeed.toString()+ "\u00b0" : "66"),
                              ),
                            ],
                          ),
                        ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
                child: Container(
                  color: Colors.pink,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("Thank you! ", style: TextStyle( fontSize: 25, color: Colors.white),),

                      Text(" You have a good day...", style: TextStyle( fontSize: 25, color: Colors.white),)
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
