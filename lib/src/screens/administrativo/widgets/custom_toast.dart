import 'package:flutter/material.dart';

class CustomToast extends StatelessWidget {
  const CustomToast(this.msg, this.toast, this.iconoColor, this.icono, {Key? key})
      : super(key: key);

  final String msg;
  final Color toast;
  final Color iconoColor;
  final IconData icono;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.only(bottom: 30),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        decoration: BoxDecoration(
          color: iconoColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: Icon(icono, color: Colors.white),
          ),
          Text(msg, style: const TextStyle(color: Colors.white)),
        ]),
      ),
    );
  }
}
