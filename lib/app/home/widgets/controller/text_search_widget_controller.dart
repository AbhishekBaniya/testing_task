import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextSearchController extends GetxController {
  var parts = <InlineSpan>[].obs;
  var i = 0.obs;
  var matchIndex = 0.obs;

  @override
  void onInit() {
    ///TODO
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void getHighLighten({required String searchString, required String content}) {
    final matches = searchString.isEmpty
        ? <RegExpMatch>[]
        : RegExp(searchString).allMatches(content).toList();

    if (matches.isEmpty) {
      parts.value.add(TextSpan(
          text: content,
          style: TextStyle(color: Colors.red, backgroundColor: Colors.yellow)));
    } else {
      while (true) {
        // if we moved through all matches, we can stop, and the rest
        // of the text is not going to be bold
        if (matchIndex.value >= matches.length) {
          final end = content.substring(matches.last.end);
          if (end.isNotEmpty) {
            parts.value.add(TextSpan(
                text: content.substring(matches.last.end),
                style: TextStyle(
                    color: Colors.red, backgroundColor: Colors.yellow)));
          }
          break;
        }
        final match = matches[matchIndex.value];
        // if the start of the current match is after the current index
        // then this parts should not be bold until the start of the match
        if (match.start > i.value) {
          final slice = content.substring(i.value, match.start);
          parts.value.add(TextSpan(
              text: slice,
              style: TextStyle(
                  color: Colors.red, backgroundColor: Colors.yellow)));
          i.value = match.start;
          continue;
        }
        // this part here is where it gets bold
        final slice = content.substring(match.start, match.end);
        parts.value.add(TextSpan(
          text: slice,
          style: const TextStyle(
              fontWeight: FontWeight.bold, backgroundColor: Colors.yellow),
        ));
        matchIndex.value += 1;
        i.value = match.end;
      }
    }
  }
}
