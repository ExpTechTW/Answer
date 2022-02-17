import 'package:answer/UI/ServerPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:answer/api/Data.dart' as globals;
import 'package:url_launcher/url_launcher.dart';

import 'SearchPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("主頁"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                color: Colors.red,
                child: const Text("創建搶答"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ServerPage(),
                        maintainState: false,
                      ));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CupertinoButton(
                color: Colors.blue,
                child: const Text("開始搶答"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchPage(),
                        maintainState: false,
                      ));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CupertinoButton(
                color: Colors.blue,
                child: const Text("開始搶答"),
                onPressed: () async {
                  await launch('');
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "版本: " + globals.ver,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
