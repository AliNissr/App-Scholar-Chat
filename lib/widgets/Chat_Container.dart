import 'package:flutter/material.dart';
import 'package:scholarchat/modal/massagesmodal.dart';
import '../constant/constant_app.dart';

class ChatPageContianer extends StatelessWidget {
  ChatPageContianer({super.key, required this.massagesdata});
  MassagesModal massagesdata;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        padding:const EdgeInsets.only(left: 14 , top: 32 , bottom: 32 , right: 16),
        margin:const EdgeInsets.all(8),
        decoration:const BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(30),
              bottomRight: Radius.circular(30), topLeft: Radius.circular(30)
              ),
          color: KPrimaryColor,
        ),
        child: Text(massagesdata.massage,
          style:const TextStyle(color: Colors.white ),),
      ),
    );
  }
}

class ChatPageContianerfrinde extends StatelessWidget {
  ChatPageContianerfrinde({super.key, required this.massagesdata});
  MassagesModal massagesdata;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(

        padding: EdgeInsets.only(left: 14 , top: 32 , bottom: 32 , right: 16),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30), topLeft: Radius.circular(30)
          ),
          color: Color(0xff016c86),
        ),
        child: Text(massagesdata.massage ,
          style: TextStyle(color: Colors.white ),),
      ),
    );
  }

}