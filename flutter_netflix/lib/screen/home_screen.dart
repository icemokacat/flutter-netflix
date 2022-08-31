import 'package:cloud_firestore/cloud_firestore.dart';
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
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late Stream<QuerySnapshot> streamData;

  @override
  void initState() {
    super.initState();
    streamData = firestore.collection('movie').snapshots();
  }

  Widget _fetchData(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('movie').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            // 데이터를 못 가져왔을때 로딩바
            return const LinearProgressIndicator();
          }

          // 데이터가 있다면 실제 위젯을 가져옴
          return _buildBody(context, snapshot.data!.docs);
        });
  }

  Widget _buildBody(BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Movie> movies = snapshot.map((d) => Movie.fromSnapshot(d)).toList();

    return ListView(children: [
      Stack(
        children: [CarouselImage(movies: movies), const TopBar()],
      ),
      CircleSlider(movies: movies),
      BoxSlider(movies: movies)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return _fetchData(context);
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
