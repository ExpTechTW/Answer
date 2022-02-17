import 'package:answer/api/Data.dart' as globals;
import 'package:answer/api/NetWork.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String alert = "";

class ClientPage extends StatelessWidget {
  const ClientPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("搶答"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoButton(
            color: Colors.green,
            child: const Text("搶答"),
            onPressed: () async {
              var data = await NetWork(
                  '{"Type":"answer","Code":"${globals.code}","Name":"${globals.name}"}');
              if (data["response"] == null) {
                alert = "發生錯誤 請刷新頁面";
                showAlert(context);
              } else if (data["response"] == "Name") {
                alert = "不要重複搶答";
                showAlert(context);
              } else if (data["response"] == "wait") {
                alert = "還沒開始搶答";
                showAlert(context);
              }
            },
          ),
          const SizedBox(
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}

Future<bool?> showAlert(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('通知!'),
        content: Text(alert),
        actions: <Widget>[
          TextButton(
            child: const Text('知道了'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
