import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


const apiKey = '6ffd9c945f399b12a46edaa7f0092135';

class WeatherPage extends StatefulWidget {

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  double temperature;
  int humidity;
  String bgImg;

  Future getData() async {
    http.Response response = await http.get('http://api.openweathermap.org/data/2.5/weather?q=Belgrade&appid=$apiKey&units=metric');

    setState(() {
    if(response.statusCode == 200) {
      var data = response.body;

      this.temperature = jsonDecode(data)['main']['temp'];

      this.humidity = jsonDecode(data)['main']['humidity'];


      return jsonDecode(data);
    } else {
      print(response.statusCode);
      }
    });
  }


  @override
  void initState() {
    super.initState();
    getData();
  }


  @override
  Widget build(BuildContext context) {
    // setState(() {
    //
    // if(temperature < 5) {
    //   bgImg = 'images/climate_snow.jpg';
    // } else if(temperature >= 5 && temperature <15) {
    //   bgImg = 'images/climate_thunder.jpg';
    // } else if(temperature >= 15 && temperature <= 25) {
    //   bgImg = 'images/climate_sunny.jpg';
    // } else {
    //   bgImg = 'images/climate_hot.jpg';
    // } });


    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/climate_thunder.jpg'),
          ),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30.0,
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Icon(
                    Icons.arrow_back_outlined,
                    size: 40.0,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 180.0),
              Opacity(
                opacity: 0.6,
                child: Container(
                  color: Colors.grey[400],
                  child: Text('Currently $temperature°C in Belgrade',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 7.0,),
              Opacity(
                opacity: 0.6,
                child: Container(
                  color: Colors.grey[400],
                  child: Text('with $humidity % humidity',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
