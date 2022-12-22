 import 'package:flutter/material.dart';
  class BuildTextButton extends StatelessWidget {
    BuildTextButton( {required this.title_button , required this.ontap} );
    String? title_button;
     VoidCallback ontap;
    @override
    Widget build(BuildContext context) {
      return  GestureDetector(
        onTap: ontap,
        child: Container(
            decoration: BoxDecoration(color: Colors.white
                , borderRadius: BorderRadius.circular(10)),
            width: double.infinity,
            height: 35,
            child:Center( child : Text(title_button!))),
      );
    }
  }
