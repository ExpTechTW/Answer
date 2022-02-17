import 'package:answer/api/Data.dart' as globals;
import 'package:answer/api/NetWork.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ClientPage.dart';

String alert = "";

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPage createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  final GlobalKey _key = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _code = TextEditingController();
  final FocusNode _n = FocusNode();
  final FocusNode _c = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _code.dispose();
    _c.dispose();
    _name.dispose();
    _n.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("登入"),
      ),
      body: Column(
        children: [
          Form(
            key: _key,
            child: Column(
              children: [
                TextFormField(
                  focusNode: _n,
                  controller: _name,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.drive_file_rename_outline),
                    labelText: "用戶名稱",
                    hintText: "請輸入 用戶名稱",
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return "用戶名稱 不為空";
                    }
                  },
                  onFieldSubmitted: (v) {},
                ),
                TextFormField(
                  focusNode: _c,
                  controller: _code,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.code),
                    labelText: "房間號",
                    hintText: "請輸入 房間號",
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return "房間號 不為空";
                    }
                  },
                  onFieldSubmitted: (v) {},
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if ((_key.currentState as FormState).validate()) {
                      globals.code = _code.text;
                      globals.name = _name.text;
                      var data = await NetWork(
                          '{"Type":"join","Code":"${globals.code}","Name":"${globals.name}"}');
                      if (data["response"] == null) {
                        alert = "查無該房間";
                        showAlert(context);
                      } else if (data["response"] == "Name") {
                        alert = "該用戶名稱已被使用";
                        showAlert(context);
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ClientPage(),
                              maintainState: false,
                            ));
                      }
                    }
                  },
                  child: const Text("開始"),
                ),
              ],
            ),
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
