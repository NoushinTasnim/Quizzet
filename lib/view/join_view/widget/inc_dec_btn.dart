import 'package:flutter/material.dart';

class IncDecBtnWidget extends StatelessWidget {

  IncDecBtnWidget({
    super.key,
    required this.onTap,
    required this.icon,
  });

  var onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.purple,
        ),
        child: Icon(
          icon,
          size: 20,
        ),
      ),
    );
  }
}