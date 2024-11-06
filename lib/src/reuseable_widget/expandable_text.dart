import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

Widget build(BuildContext context, String content) {
  return ExpandableText(
    content,
    expandText: 'show more',
    collapseText: 'show less',
    maxLines: 1,
    linkColor: Colors.blue,
  );
}
