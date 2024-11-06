// Create a expandable/ collapsable text widget
import 'package:flutter/material.dart';
import 'package:instagram/src/reuseable_widget/custom_text.dart';

class TextWrapper extends StatefulWidget {
  final String text;
  const TextWrapper({super.key, required this.text});

  @override
  State<TextWrapper> createState() => _TextWrapperState();
}

class _TextWrapperState extends State<TextWrapper>
    with TickerProviderStateMixin {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: ConstrainedBox(
              constraints: isExpanded
                  ? const BoxConstraints()
                  : const BoxConstraints(maxHeight: 70),
              child: CustomText.customSizedText(
                text: widget.text,
                maxLine: 100,
                size: 12,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ))),
      isExpanded
          ? OutlinedButton.icon(
              icon: const Icon(Icons.arrow_upward),
              label: const Text('Read less'),
              onPressed: () => setState(() => isExpanded = false))
          : TextButton.icon(
              icon: const Icon(Icons.arrow_downward),
              label: const Text('Read more'),
              onPressed: () => setState(() => isExpanded = true))
    ]);
  }
}
