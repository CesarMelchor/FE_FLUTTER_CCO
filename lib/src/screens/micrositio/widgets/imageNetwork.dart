// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImageNetwork extends StatelessWidget {
  late String imagen;
  late double widthImage;
  ImageNetwork({Key? key, required this.imagen, required this.widthImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Image.network(
      imagen,
      width: widthImage,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        return child;
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return Center(
            child: Image.asset(
              "assets/logos/Logo_cco_2a.gif",
              height: 100,
            ),
          );
        }
      },
      errorBuilder:
          (context, error, stackTrace) {
        return Container(width: widthImage, height: widthImage /2, color: Colors.grey,);
      }
    );
  }
}
