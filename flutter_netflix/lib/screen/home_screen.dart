import 'package:flutter/material.dart';
import 'package:flutter_netflix/widget/box_slider.dart';
import 'package:flutter_netflix/widget/carousel_slider.dart';
import 'package:flutter_netflix/widget/circle_slider.dart';

import '../model/model_movie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> movies = [
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'test_movie_1.png',
      'like': false,
    }),
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'test_movie_1.png',
      'like': false,
    }),
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'test_movie_1.png',
      'like': false,
    }),
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'test_movie_1.png',
      'like': false,
    }),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: <Widget>[
            const TopBar(),
            CarouselImage(movies: movies),
          ],
        ),
        CircleSlider(
          movies: movies,
        ),
        BoxSlider(
          movies: movies,
        ),
      ],
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            'images/coffee_icon.png',
            fit: BoxFit.contain,
            height: 25,
          ),
          Container(
              padding: const EdgeInsets.only(right: 1),
              child: const Text(
                'TV 프로그램',
                style: TextStyle(fontSize: 14),
              )),
          Container(
              padding: const EdgeInsets.only(right: 1),
              child: const Text(
                '영화',
                style: TextStyle(fontSize: 14),
              )),
          Container(
              padding: const EdgeInsets.only(right: 1),
              child: const Text(
                '내가 찜한 콘텐츠',
                style: TextStyle(fontSize: 14),
              )),
        ],
      ),
    );
  }
}
