import 'package:flutter/material.dart';
import 'package:restmovies/utils/text.dart';
import 'package:restmovies/widgets/toprated.dart';
import 'package:restmovies/widgets/trending.dart';
import 'package:restmovies/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List tv = [];

  final String apikey = '2b79b52e8e4673caaa1a50628979c18d';
  final readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyYjc5YjUyZThlNDY3M2NhYWExYTUwNjI4OTc5YzE4ZCIsIm5iZiI6MTczOTI5NDE5NC4wMDgsInN1YiI6IjY3YWI4NWYxNDcwNTFjNTRiZWIwYmQ4NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.8FbJUZGS071j6rXZ-G_3lLcUMhwkyN2EjCD6c7E4j-0';

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readAccessToken),
      logConfig: ConfigLogger(showLogs: true),
    );
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    print(tv);
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingMovies = trendingResult['results'];
      topRatedMovies = topRatedResult['results'];
      tv = tvResult['results'];
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: ModifiedText(text: 'Flutter Movie App ❤️'),
      ), //
      body: ListView(
        children: [
          TvShows(tv: tv),
          TrendingMovies(trending: trendingMovies),
          TopRatedMovies(topRated: topRatedMovies),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
