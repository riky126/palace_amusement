import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
final upcomingMovies = [
  MoviesCard(name: "Assassin's Creed Odyssey", details: desc, imagePath: movie_poster1),
  MoviesCard(name: "Dead Cells", details: desc, imagePath: movie_poster2),
  MoviesCard(name: "Stardew Valley", details: desc, imagePath: movie_poster3),
  MoviesCard(name: "No Man's Sky", details: desc, imagePath: movie_poster3),
];



class UpcomingMovies extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container (
        child: SingleChildScrollView (
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
              child: Row (

                crossAxisAlignment: CrossAxisAlignment.start,

                children: createList(),
                // [MovieCardWidget]
              ),
            ),
        ),
    );
  }

  List<Widget> createList() {
    List<Widget> cardList = new List();

    for (MoviesCard movie in upcomingMovies) {
      cardList.add(MovieCardWidget(upcomingMovie: movie,));
    }
    return cardList;
  }
}


class MovieCardWidget extends StatelessWidget {

  final MoviesCard upcomingMovie;

  const MovieCardWidget({Key key, this.upcomingMovie}) : super(key: key);

  @override
  Widget build(BuildContext context) {

      return Column (
          children: <Widget>[

            Padding (
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 2),
                child: ClipRRect(

                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  child: Container (
                    width: 108,
                    height: 160,
                    color: Colors.grey[700],

                    child: Image.asset(
                      upcomingMovie.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
            ),

            Padding (
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                child: Text('G: Action',style: smallTextStyle, textAlign: TextAlign.left,)
            ),

            Padding (
              padding: const EdgeInsets.all(6),
              child: SizedBox (
                width:  100,
                child: OutlineButton(
                    color: primaryColor,
                    textColor: Colors.grey[400],
                    borderSide: BorderSide(color: Colors.grey[400]),
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(6),
                    highlightedBorderColor: Colors.grey[400],
                    splashColor: Colors.blueGrey[800],
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(1.0),
                    ),
                    onPressed: () { /*...*/ },

                    child: Row (
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: Image.asset(
                              ticketsIcon,
                              width: 20,
                              height: 20,
                              color: Colors.grey[400],
                            ),
                          ),

                          Text(
                            "Buy Tickets",
                            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
                          ),
                        ]
                    )
                ),
              ),
            )
          ],
      );
  }
}