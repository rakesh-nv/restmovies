import 'package:flutter/cupertino.dart';

import '../utils/text.dart';

class TvShows extends StatelessWidget {
  final List tv;

  const TvShows({
    super.key,
    required this.tv,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text: 'Popular Tv Shows', size: 26),
          Container(
            // color: Colors.red,
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 270,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(
                                tv[index]['backdrop_path'] != null
                                    ? 'https://image.tmdb.org/t/p/w500' +
                                        tv[index]['backdrop_path']
                                    : 'https://via.placeholder.com/500x300?text=No+Image',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          child: ModifiedText(
                              text: tv[index]['original_name'] != null
                                  ? tv[index]['original_name']
                                  : 'loading'),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: tv.length,
            ),
          )
        ],
      ),
    );
  }
}
