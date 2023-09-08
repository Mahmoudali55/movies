// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movies/screen/movie.dart';

class Genre extends StatelessWidget {
  final String title;
  final List movies;
  const Genre({super.key, required this.title, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      final item = movies[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MovieDetalis(
                                          title: item['title'],
                                          cover: item['cover'],
                                          rating: item['rating'],
                                          year: item['year'],
                                          duration: item['duration'],
                                          summary: item['summary'],
                                          director: item['director'],
                                          video: item['video'],
                                        )));
                          },
                          child: Container(
                            color: Colors.red,
                            child: Image(
                              image: NetworkImage(
                                item['cover'],
                              ),
                              errorBuilder: (context, exception, stackTrack) =>
                                  Image(
                                image: NetworkImage(
                                    'https://cloud.filmdb.elcapitantheatre.com/FilmImages/56/1/309/AWOW%20Poster%20New.png'),
                                fit: BoxFit.cover,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
