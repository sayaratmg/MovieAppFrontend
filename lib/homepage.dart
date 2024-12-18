import 'package:flutter/material.dart';

class MainHomePage extends StatelessWidget {
  final List<Map<String, dynamic>> movies = [
    {
      "title": "Inception",
      "rating": 4.5,
      "poster": "https://via.placeholder.com/100x150",
    },
    {
      "title": "Interstellar",
      "rating": 4.7,
      "poster": "https://via.placeholder.com/100x150",
    },
    {
      "title": "The Dark Knight",
      "rating": 4.8,
      "poster": "https://via.placeholder.com/100x150",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Ratings App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Navigate to Search Page
              showSearch(context: context, delegate: MovieSearchDelegate(movies));
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                // Navigate to Profile Page
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Navigate to Settings Page
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              onTap: () {
                // Handle logout
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return Card(
              elevation: 4.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: Image.network(
                  movie['poster'],
                  width: 50,
                  height: 75,
                  fit: BoxFit.cover,
                ),
                title: Text(movie['title']),
                subtitle: Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text(movie['rating'].toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                onTap: () {
                  // Navigate to Movie Details Page
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class MovieSearchDelegate extends SearchDelegate {
  final List<Map<String, dynamic>> movies;

  MovieSearchDelegate(this.movies);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = movies
        .where((movie) => movie['title'].toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final movie = results[index];
        return ListTile(
          leading: Image.network(
            movie['poster'],
            width: 50,
            height: 75,
            fit: BoxFit.cover,
          ),
          title: Text(movie['title']),
          subtitle: Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 16),
              const SizedBox(width: 4),
              Text(movie['rating'].toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          onTap: () {
            // Navigate to Movie Details Page
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = movies
        .where((movie) => movie['title'].toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final movie = suggestions[index];
        return ListTile(
          leading: Image.network(
            movie['poster'],
            width: 50,
            height: 75,
            fit: BoxFit.cover,
          ),
          title: Text(movie['title']),
          onTap: () {
            query = movie['title'];
            showResults(context);
          },
        );
      },
    );
  }
}
