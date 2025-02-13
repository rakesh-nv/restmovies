import 'package:flutter/material.dart';
import 'package:restmovies/utils/text.dart';

class Description extends StatelessWidget {
  final String name, description, bannerUrl, posterUrl, vote, launchOn;

  const Description({
    super.key,
    required this.name,
    required this.description,
    required this.bannerUrl,
    required this.posterUrl,
    required this.vote,
    required this.launchOn,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        bannerUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: ModifiedText(text: '⭐ Average Ration -$vote',size: 18,),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
