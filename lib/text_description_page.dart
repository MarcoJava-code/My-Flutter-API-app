import 'package:flutter/material.dart';

class TextDescriptionPage extends StatefulWidget {
  TextDescriptionPage(
      {this.title,
      this.author,
      this.description,
      this.urlToImage,
      this.publishedAt});

  final String title;
  final String author;
  final String description;
  final String urlToImage;
  final String publishedAt;

  @override
  _TextDescriptionPageState createState() => _TextDescriptionPageState();
}

class _TextDescriptionPageState extends State<TextDescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Image.network(
              widget.urlToImage,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 300.0, 0.0, 0.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Material(
                  borderRadius: BorderRadius.circular(35.0),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        widget.publishedAt.substring(0,10),
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(widget.description,
                        style: TextStyle(
                          fontSize: 22.0,
                        ),),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
