import 'package:flutter/material.dart';
class BuildTextFormFilde extends StatelessWidget {
   BuildTextFormFilde({super.key, required this.onChanged , required this.lablehiting , this.obscure = false});
   Function(String)? onChanged;
  String? lablehiting;
  bool obscure;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      obscureText: obscure,
      validator: (data) {
        if(data!.isEmpty) {
          return 'the box is empty';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        label: Text(lablehiting! , style:const TextStyle(color: Color(0xffc7e8e9))),
        /*
   enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
    color: Colors.orange,
    */ // هذا الادات تعمل على وضع الحدود المربع قبل ان ادخل الى مربع النص
        enabledBorder:const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.white),
        ),
        //  ال (border) هذه الخاصيه تكون عامة على كل (TextFormField and TextField) يعني راح يكون كل شكل مربع النص بشكل واحد قبل او بعد الكتابة
        // اما اذا ارة ان يكون الشكل على مزاجي يعنس قبل الكتابه شي وبعد الكتابة شي ثاني استخدم (enabledBorder or disabledBorder ) وحده ترتب قبل الكتابة وحده بعدة
        border:const OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.white)),
      ),
    );
  }
}
