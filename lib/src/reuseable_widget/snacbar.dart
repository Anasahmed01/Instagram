import 'package:flutter/material.dart';

class CustomSnackbar extends StatelessWidget {
  final String message;
  final Color backgroundColor;
  final Duration duration;

  const CustomSnackbar({
    super.key,
    required this.message,
    this.backgroundColor = Colors.black,
    this.duration = const Duration(seconds: 3),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

void showCustomSnackbar(
    BuildContext context, GlobalKey containerKey, String message) {
  final overlay = Overlay.of(context);
  final container =
      containerKey.currentContext!.findRenderObject() as RenderBox;

  final position = container.localToGlobal(Offset.zero);
  final size = container.size;

  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: position.dy + size.height + 8.0, // Adjust the position as needed
      left: position.dx,
      width: size.width,
      child: Material(
        color: Colors.transparent,
        child: CustomSnackbar(message: message),
      ),
    ),
  );

  overlay.insert(overlayEntry);

  Future.delayed(const Duration(seconds: 3)).then((_) {
    overlayEntry.remove();
  });
}
