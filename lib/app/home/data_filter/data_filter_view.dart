import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../widgets/text_search_widget.dart';
import 'data_filter_logic.dart';

class DataFilterPage extends StatelessWidget {
  const DataFilterPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<DataFilterLogic>();
    return Scaffold(
      key: UniqueKey(),
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          title,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          style: const TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: TextFormField(
              controller: logic.textController.value,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
              ],
              maxLength: 1,
              decoration: InputDecoration(
                //fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.pinkAccent),
                ),

                hintText: "Write Here!",
                hintStyle: const TextStyle(color: Colors.pinkAccent),
                //fillColor: Colors.green
              ),
              /*validator: (val) {
                if (val.length == 0) {
                  return "Email cannot be empty";
                } else {
                  return null;
                }
              },*/
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(
                color: Colors.pink,
                fontFamily: "Poppins",
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              scrollDirection: Axis.vertical,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 8.0,
              children: List.generate(
                growable: true,
                logic.alphabet.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 150.0,
                    width: 150.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.pinkAccent),
                      borderRadius: BorderRadius.circular(
                        100.0,
                      ),
                    ),
                    child: WordSearch(
                      text: logic.alphabet.value[index],
                    ), /*Text(
                      logic.alphabet[index],
                      style: const TextStyle(color: Colors.red),*/
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
