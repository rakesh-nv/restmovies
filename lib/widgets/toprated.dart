import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/text.dart';

class TopRatedMovies extends StatelessWidget {
  final List topRated;

  const TopRatedMovies({super.key, required this.topRated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text: 'Top rated Movies', size: 26),
          Container(
            //color: Colors.red,
            height: 260,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {


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
                                      topRated[index]['poster_path']),
                            ),
                          ),
                        ),
                        Container(
                          child: ModifiedText(
                              text: topRated[index]['title'] != null
                                  ? topRated[index]['title']
                                  : 'loading'),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: topRated.length,
            ),
          )
        ],
      ),
    );
  }
}
