import 'package:flutter/material.dart';
import 'package:palace_amusement/styleguide/text_styles.dart';
import 'package:palace_amusement/icons_assets.dart';
import '../styleguide/colors.dart';

class MoviesCard {
  final String name;
  final String details;
  final String imagePath;

  const MoviesCard({this.name, this.details, this.imagePath});
}


final String desc = 'The grand and epic adaptation of THE LION KING demands to be seen on the big screen, and it has returned to AMC, now through 10/17!';
final playMovies = [
  MoviesCard(name: "Assassin's Creed Odyssey", details: desc, imagePath: placeholder_image),
  MoviesCard(name: "Dead Cells", details: desc, imagePath: placeholder_image2),
  MoviesCard(name: "Stardew Valley", details: desc, imagePath: placeholder_image3),
  MoviesCard(name: "No Man's Sky", details: desc, imagePath: placeholder_image4),
];


class HomeMoveList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(

        child: Column (
          children: createList(),
            // Text("movie list", style: simpleTextStyle),
        ),

    );
  }

  List<Widget> createList() {
    List<Widget> cardList = new List();

    for (MoviesCard card in playMovies) {
        cardList.add(MoviesPlaying(playingMovie: card,));
    }
    return cardList;
  }
}


class MoviesPlaying extends StatelessWidget {

  final MoviesCard playingMovie;

  const MoviesPlaying({Key key, this.playingMovie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = 260.0;
    final screenWidth = MediaQuery.of(context).size.width - 40;

    return Padding(
        padding: const EdgeInsets.only(right: 0, bottom: 16, top: 16),
        child: Column(
          children: <Widget>[
            ClipRRect(

              borderRadius: BorderRadius.all(Radius.circular(16)),
              child: Container(
                width: screenWidth,
                height: screenHeight,
                color: Colors.grey[700],

                child: Image.asset(

                  playingMovie.imagePath,
                  fit: BoxFit.cover,
                ),
              )

            ),
            Padding (
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
              child: Text(playingMovie.name, style: movieTitleTextStyle, textAlign: TextAlign.center,),
            ),

            Padding (
              padding: const EdgeInsets.fromLTRB(16, 3, 16, 6),
              child: Text(playingMovie.details, style: movieDescTextStyle, textAlign: TextAlign.center,),
            ),

            Padding (
              padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
              child: SizedBox (
                  width: screenWidth - 80,
                  child: FlatButton(
                          color: primaryColor,
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
                          padding: EdgeInsets.only(left: 20, right: 20, bottom: 8, top: 8),
                          splashColor: Colors.blueAccent,
                          onPressed: () { /*...*/ },

                          child: Row (
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                               Padding(
                                 padding: const EdgeInsets.only(right: 6),
                                 child: Image.asset(
                                   ticketsIcon,
                                   width: 25,
                                   height: 25,
                                   color: Colors.white,
                                 ),
                               ),

                               Text(
                                 "Buy Tickets",
                                 style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
                               ),
                           ]
                      )
                  ),
              ),
            )

          ],
        ),

    );
  }
}