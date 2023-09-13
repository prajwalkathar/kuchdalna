import 'package:flutter/material.dart';

class GridImg extends StatefulWidget {
  final String imagePath;
  final bool isSeleted;
  final Function(bool?)? onSelected;
  const GridImg(
      {super.key,
      required this.imagePath,
      required this.onSelected,
      required this.isSeleted});

  @override
  State<GridImg> createState() => _GridImgState();
}

class _GridImgState extends State<GridImg> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox.expand(
                child: Image.network(
                  widget.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Checkbox(
                value: widget.isSeleted,
                onChanged: widget.onSelected,
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 80,
                  padding: EdgeInsets.all(10),
                  decoration:
                      BoxDecoration(color: Colors.white.withOpacity(0.5)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(),
                      ),
                      Text("Details ->"),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
