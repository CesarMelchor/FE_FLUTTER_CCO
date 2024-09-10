// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImageNetworkCarrusel extends StatelessWidget {
  late String imagen;
  ImageNetworkCarrusel({Key? key, required this.imagen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imagen,
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
    );
  }
}
