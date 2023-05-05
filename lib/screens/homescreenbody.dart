import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../services/apiservices.dart';
import '../../widgets/customgridview.dart';
import '../../widgets/customwidgets.dart';
import 'movie_detailscreen.dart';
import 'tvshow_detailscreen.dart';

class HomeScreenbody extends StatefulWidget {
  @override
  State<HomeScreenbody> createState() => _HomeScreenbodyState();
}

class _HomeScreenbodyState extends State<HomeScreenbody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        FutureBuilder(
          future: ApiService().getTrendingAll(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return CarouselSlider.builder(
                itemCount: 10,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        InkWell(
                  onTap: () {
                    if (snapshot.data[itemIndex].mediaType == 'movie') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MovieDescription(
                                  id: snapshot.data[itemIndex].id,
                                )),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TVDescription(
                                  id: snapshot.data[itemIndex].id,
                                )),
                      );
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      child: Stack(
                        children: <Widget>[
                          Image.network(
                            'https://image.tmdb.org/t/p/original/${snapshot.data[itemIndex].posterPath}',
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                options: CarouselOptions(
                  aspectRatio: 10 / 9,
                  viewportFraction: 0.9,
                ),
              );
            } else {
              return CarouselSlider.builder(
                itemCount: 10,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        Container(
                  width: 270,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                ),
                options: CarouselOptions(
                  aspectRatio: 9 / 9,
                  viewportFraction: 0.2,
                ),
              );
            }
          },
        ),
        Namebar(
          namebar: 'Trending Movies',
          navigate: GridViewDatamovie(
            futre: ApiService().getTrendingMovie(),
          ),
        ),
        ListViewDatamovie(
          futre: ApiService().getTrendingMovie(),
        ),
        Namebar(
          namebar: 'Trending Tv shows',
          navigate: GridViewDatatv(
            futre: ApiService().getTrendingTVshow(),
          ),
        ),
        ListViewDatatv(
          futre: ApiService().getTrendingTVshow(),
        ),
      ],
    );
  }
}
