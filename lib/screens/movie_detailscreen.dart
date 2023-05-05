import 'package:flutter/material.dart';

import '../../services/apiservices.dart';
import '../../widgets/constant.dart';

class MovieDescription extends StatelessWidget {
  final int id;

  MovieDescription({
    Key? key,
    required this.id,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(canvasColor: oppositecolor),
        home: Scaffold(
          body: FutureBuilder(
            future: ApiService().getMovieDetail(id.toString()),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Stack(children: [
                  Column(children: [
                    ClipRRect(
                      child: (snapshot.data.backdropPath == null)
                          ? Container(
                              height: 400,
                              width: 1000,
                              color: uppermodecolor,
                            )
                          : Container(
                              height: 400,
                              width: 1000,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                    bottom: Radius.circular(15)),
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/original/${snapshot.data.backdropPath}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 30),
                        child: Text(
                          snapshot.data.title,
                          style: TextStyle(
                              fontSize: 24,
                              color: uppermodecolor,
                              fontWeight: FontWeight.w300),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 26,
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 9),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: Colors.white24,
                          ),
                          child: Text(
                            (snapshot.data.releaseDate == '')
                                ? 'N/A'
                                : snapshot.data.releaseDate
                                    .toString()
                                    .substring(0, 10),
                            style:
                                TextStyle(fontSize: 16, color: uppermodecolor),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          '|',
                          style: TextStyle(fontSize: 30, color: uppermodecolor),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 22,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              snapshot.data.voteAverage.toString(),
                              style: TextStyle(
                                  fontSize: 19, color: uppermodecolor),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          '|',
                          style: TextStyle(fontSize: 30, color: uppermodecolor),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          '${snapshot.data.runtime} min',
                          style: TextStyle(fontSize: 16, color: uppermodecolor),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        snapshot.data.overview,
                        style: TextStyle(
                            fontSize: 18,
                            color: uppermodecolor,
                            fontWeight: FontWeight.w200),
                      ),
                    ),
                  ]),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 40),
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blueAccent,
                        ),
                        child: Center(
                          child: Text(
                            'WATCH NOW',
                            style:
                                TextStyle(fontSize: 15, color: uppermodecolor),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]);
              } else {
                return Container();
              }
            },
          ),
        ));
  }
}