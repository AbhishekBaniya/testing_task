import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gridsearchview/app/home/data_filter/data_filter_logic.dart';

class WordSearch extends StatefulWidget {
  const WordSearch({super.key, required this.text});

  final String text;

  @override
  State<WordSearch> createState() => _WordSearchState();
}

class _WordSearchState extends State<WordSearch> {
  var logic = Get.put(DataFilterLogic());
  //late final TextEditingController txtsearch;

  @override
  void initState() {
    super.initState();
    //txtsearch = TextEditingController();
  }

  @override
  void dispose() {
    //logic.textController.value.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final search = logic.textController.value.text.toLowerCase();
    final text = widget.text;
    final matches = search.allMatches(text.toLowerCase()).toList();
    final spans = <TextSpan>[];

    if (matches.isEmpty) {
      spans.add(TextSpan(text: text));
    } else {
      for (var i = 0; i < matches.length; i++) {
        final strStart = i == 0 ? 0 : matches[i - 1].end;
        final match = matches[i];
        spans.add(
          TextSpan(
            text: text.substring(
              strStart,
              match.start,
            ),
          ),
        );
        spans.add(
          TextSpan(
            text: text.substring(
              match.start,
              match.end,
            ),
            style: const TextStyle(
                color: Colors.blue, backgroundColor: Colors.yellow),
          ),
        );
      }
      spans.add(TextSpan(text: text.substring(matches.last.end)));
    }

    return Center(
      child: RichText(
          text: TextSpan(
        style: const TextStyle(
          fontSize: 20,
        ),
        children: spans,
      )),
    );
  }
}
