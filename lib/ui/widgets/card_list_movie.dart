import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_db_flutter/util/index.dart';

class CardListMovies extends StatelessWidget {
  final String image;
  final String vote;
  final String title;
  final String releaseDate;
  final List<Widget> genre;
  final String overview;

  const CardListMovies(
      {Key key,
      this.image,
      this.vote,
      this.title,
      this.releaseDate,
      this.genre,
      this.overview})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 250,
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Container(
              width: size.width * 0.35,
              height: 200,
              child: CachedNetworkImage(
                fit: BoxFit.fitHeight,
                imageUrl: image,
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Spacer(),
            Container(
              width: size.width * 0.65 - 50,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 40,
                        height: 40,
                        child: Stack(
                          children: <Widget>[
                            Center(
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                            Center(
                              child: Container(
                                width: 30,
                                height: 30,
                                child: CircularProgressIndicator(
                                  strokeWidth: 3.0,
                                  valueColor: AlwaysStoppedAnimation<Color>(GetRatingColor.getColor(double.parse(vote))),
                                  backgroundColor: Colors.grey,
                                  value: double.parse(vote) / 10.0,
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                  width: 30,
                                  height: 30,
                                  child: Center(
                                    child: Text(
                                      (double.parse(vote) * 10.0).floor().toString() + '%',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 11,
                                          color: Colors.white),
                                    ),
                                  ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 20),
                            ),
                            Text(
                              releaseDate,
                              style: TextStyle(
                                  color: Colors.grey[800], fontSize: 14),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: size.width * 0.65 - 50,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: genre,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: size.width * 0.65 - 50,
                    child: Text(
                      overview,
                      softWrap: true,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
