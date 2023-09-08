// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:movies/screen/movie.dart';

class HeaderScreen extends StatefulWidget {
  const HeaderScreen({super.key});

  @override
  State<HeaderScreen> createState() => _HeaderScreenState();
}

class _HeaderScreenState extends State<HeaderScreen> {
  String title = '  ';
  String coverUrl = '';
  double rating = 0.0;
  int year = 0;
  String duration = '';
  String summary = '';
  String director = '';
  String video = '';
  Future getForYouMoves() async {
    Random random = Random();
    int randomNumber = random.nextInt(9);
    final response = await http
        .get(Uri.parse('https://salardev.com/devs/moviesProject/movies.json'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        title = data['foryou'][randomNumber]['title'];
        coverUrl = data['foryou'][randomNumber]['cover'];
        rating = data['foryou'][randomNumber]['rating'];
        year = data['foryou'][randomNumber]['year'];
        duration = data['foryou'][randomNumber]['duration'];
        summary = data['foryou'][randomNumber]['summary'];
        director = data['foryou'][randomNumber]['director'];
        video = data['foryou'][randomNumber]['video'];
      });
    } else {
      if (kDebugMode) {
        print('A networ error occurred');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getForYouMoves();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetalis(
                      title: title,
                      cover: coverUrl,
                      rating: rating,
                      year: year,
                      duration: duration,
                      summary: summary,
                      director: director,
                      video: video,
                    )));
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(color: Colors.black),
            child: coverUrl == ''
                ? Container()
                : Image.network(
                    coverUrl,
                    fit: BoxFit.cover,
                  ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                width: 500,
                height: 250,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black])),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w700),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            rating.toString(),
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
