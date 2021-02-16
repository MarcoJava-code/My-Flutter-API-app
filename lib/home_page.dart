import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter_app_try_two/news_page.dart';
import 'package:flutter_app_try_two/weather_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/nature-colorful-wallpaper.jpg'),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 175.0,
            ),
            AvatarGlow(
              glowColor: Colors.white,
              endRadius: 120.0,
              duration: Duration(milliseconds: 2000),
              showTwoGlows: true,
              child: Material(
                elevation: 8.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 70,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/bio_photo.png'),
                    radius: 67,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text('Embrace new endeavours',
              style: TextStyle(
                fontFamily: 'Beach',
                fontSize: 30.0,
                color: Color(0xFFd99530),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Container(
                    height: 50.0,
                    width: 130.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: RaisedButton(
                        color: Colors.orange.shade100,
                        elevation: 30.0,
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return WeatherPage();}));
                      },
                        child: Text('Check weather',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          letterSpacing: 3.0,
                          fontFamily: 'Jomhuria',
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50.0,
                  width: 130.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: RaisedButton(
                      color: Colors.orange.shade100,
                      elevation: 30.0,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NewsPage()));
                      },
                      child: Text('World tech news',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          letterSpacing: 3.0,
                          fontFamily: 'Jomhuria',
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
