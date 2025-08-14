import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'movie.dart';

class MovieListView extends StatelessWidget {
  final List<Movie> movieList = Movie.getMovies();

  final List movies = [
    "Iron Man",
    "Home Alone",
    "Avengers",
    "Titanic",
    "Catch me if you can",
    "Avengers EndGame",
    "I Am Legend",
    "Encanto",
    "Hard Kill",
    "Eternals",
    "Vikings",
    "Back To The Outback",
    "The Matrix",
    "Maze Runner",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_download_outlined),
            label: 'Downloads',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.filter_9_plus_rounded,
            ),
            label: 'Subscriptions',
          ),
        ],
        elevation: 20.0,
      ),
      appBar: AppBar(
        title: Text(
          "Movies",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 20.0,
        leading: IconButton(
          icon: Icon(
            Icons.ondemand_video_rounded,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
              ),
              onPressed: () {}),
          IconButton(
            icon: Icon(
              Icons.cast_connected_rounded,
            ),
            onPressed: () {},
          ),
          IconButton(
              icon: Icon(
                Icons.notifications,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.manage_accounts_outlined,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),
      backgroundColor: Colors.grey,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(children: [
              movieCard(movieList[index], context),
              Positioned(top: 14.8, child: movieImage(movieList[index].poster)),
            ]);
          }),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 40),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          color: Colors.white,
          shadowColor: Colors.black87,
          elevation: 40.0,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 50.0),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          movie.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          "Rating: ${movie.imdbRating}",
                          style: TextStyle(fontSize: 15.0, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        child: Text(
                          "Released ${movie.released}",
                        ),
                      ),
                      Flexible(
                        child: Text(
                          movie.runtime,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          movie.rated,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    MovieListViewDetails(movieName: movie.title, movie: movie)))
      },
    );
  }

  Widget movieImage(String imageUrl) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}

class MovieListViewDetails extends StatelessWidget {
  final String movieName;
  final Movie movie;

  const MovieListViewDetails(
      {Key? key, required this.movieName, required this.movie})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.airplay_rounded,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.settings,
            ),
            onPressed: () {},
          ),
        ],
        title: Text("Description"),
        elevation: 15.0,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 735,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 350.0),
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.deepPurpleAccent,
                        ),
                        onPressed: () {},
                      ),
                      Text(
                        "Overview: ${movie.plot}",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0,
                        ),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "Title: ${movie.title}",
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                        child: Image.network(
                      movie.poster,
                      alignment: Alignment.topRight,
                      width: 200,
                      height: 50,
                    ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
