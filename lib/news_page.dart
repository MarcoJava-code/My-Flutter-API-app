import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_swiper/flutter_swiper.dart';
import 'text_description_page.dart';

const apiKey = 'affae0b3873e4454a40e530c246bc2be';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  List data;

  Future fetchData() async {
    http.Response response = await http.get(
        'http://newsapi.org/v2/everything?q=tech&apiKey=$apiKey');

    var fetchData = jsonDecode(response.body);

    setState(() {
      data = fetchData['articles'];
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TextDescriptionPage(
                    author: data[index]['author'],
                    title: data[index]['title'],
                    description: data[index]['description'],
                    publishedAt: data[index]['publishedAt'],
                    urlToImage: data[index]['urlToImage'],
                  )));
                },
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35)),
                        child: Image.network(data[index]['urlToImage'],
                        fit: BoxFit.cover,
                          height: 400.0,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(0.0, 350.0, 0.0, 0.0),
                      child: Container(
                        height: 200.0,
                        width: 400.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(35.0),
                          elevation: 10.0,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 20.0),
                                child: Text(data[index]['title'],
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          itemCount: data == null ? 0 : data.length,
          viewportFraction: 0.8,
          autoplay: true,
          scale: 0.9,
        ),
      ),
    );
  }
}