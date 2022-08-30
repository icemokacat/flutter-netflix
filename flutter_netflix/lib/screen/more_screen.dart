import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 50),
            child: const CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('images/coffee_icon.png'),
              backgroundColor: Colors.white60,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 15),
            child: const Text(
              'Moka',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: 140,
            height: 5,
            color: Colors.red,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Linkify(
              text: 'https://github.com/icemokacat',
              onOpen: ((link) async {
                if (await canLaunch(link.url)) {
                  await launch(link.url);
                }
              }),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              linkStyle: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: FlatButton(
                onPressed: () {},
                child: Container(
                  padding: const EdgeInsets.all(5),
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '프로필 수정하기',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    ));
  }
}
