import 'package:flutter/material.dart';

class ImageView extends StatefulWidget {
  final String imagePath;
  const ImageView({super.key, required this.imagePath});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: SizedBox.expand(
            child: InteractiveViewer(
                child: Image.asset(
              widget.imagePath,
            )),
          ),
        ),
      ),
    );
  }
}
