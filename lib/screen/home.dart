// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:movies/provider/movice_provider.dart';
import 'package:movies/widget/genre.dart';
import 'package:movies/widget/header.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<MovieProvider>(context).fetchMovies();

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderScreen(),
            Genre(
              title: 'Action',
              movies: Provider.of<MovieProvider>(context).actionMovies,
            ),
            Genre(
              title: 'Drama',
              movies: Provider.of<MovieProvider>(context).dramaMovies,
            ),
            Genre(
              title: 'Comedy',
              movies: Provider.of<MovieProvider>(context).comedyMovies,
            ),
            Genre(
              title: 'Adventured',
              movies: Provider.of<MovieProvider>(context).adventureMovies,
            ),
            Genre(
              title: 'Animstion',
              movies: Provider.of<MovieProvider>(context).animationMovies,
            )
          ],
        ),
      ),
    );
  }
}
