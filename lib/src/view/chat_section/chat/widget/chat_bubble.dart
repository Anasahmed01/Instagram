import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.text,
    required this.isCurrentUser,
  });
  final String text;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // asymmetric padding
      padding: EdgeInsets.fromLTRB(
        isCurrentUser ? 64.0 : 16.0,
        2,
        isCurrentUser ? 16.0 : 64.0,
        2,
      ),
      child: Align(
        // align the child within the container
        alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
        child: DecoratedBox(
          // chat bubble decoration
          decoration: BoxDecoration(
            color: isCurrentUser ? Colors.blue : Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: isCurrentUser ? Colors.white : Colors.black87,
                  fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
