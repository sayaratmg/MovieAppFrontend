import 'package:flutter/material.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Map movie;

  MovieDetailsScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie['title']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movie['genre'],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(movie['plot_summary']),
            SizedBox(height: 20),
            Text('Release Year: ${movie['release_year']}'),
          ],
        ),
      ),
    );
  }
}