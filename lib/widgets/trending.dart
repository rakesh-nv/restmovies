import 'package:flutter/material.dart';
import 'package:restmovies/utils/text.dart';

import 'description.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({
    super.key,
    required this.trending,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text: 'Trending Movies', size: 26),
          Container(
            //color: Colors.blue,
            height: 260,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: trending[index]['title'],
                          description: trending[index]['overview'],
                          bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                              trending[index]['backdrop_path'],
                          posterUrl: 'https://image.tmdb.org/t/p/w500' +
                              trending[index]['poster_path'],
                          vote: trending[index]['vote_average'].toString(),
                          launchOn: trending[index]['release_date'],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      trending[index]['poster_path']),
                            ),
                          ),
                        ),
                        Container(
                          child: ModifiedText(
                              text: trending[index]['title'] != null
                                  ? trending[index]['title']
                                  : 'loading'),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: trending.length,
            ),
          )
        ],
      ),
    );
  }
}
