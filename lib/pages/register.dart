//import 'package:firebase_auth/firebase_auth.dart' ;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholarchat/blocs/auth_bloc.dart';
//import 'package:scholarchat/cubits/auth_cubit.dart';
//import 'package:scholarchat/cubits/register_cubit.dart';
import 'package:scholarchat/pages/ChatPageView.dart';
import '../constant/constant_app.dart';
import '../widgets/build_textbutton.dart';
import '../widgets/build_textfilde.dart';


class RegisterApp extends StatelessWidget {
  static String id = 'RegisterPageApp';
  String? email , password;
  GlobalKey <FormState> formkeyregister = GlobalKey();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc , AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading){
          isLoading = true;
        }else if (state is RegisterSuccess){
          Navigator.pushNamed(context, Chatpage.id , arguments: email);
          isLoading = false;
        }else if (state is RegisterFailuer){
          exceptionmethod(context, state.errormassage);
          isLoading = false;
        }
      },

      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: KPrimaryColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Form(
              key: formkeyregister,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Spacer(),
                  Image.asset(Klogo),
                 const  Text("Scholar Chat", style: TextStyle(fontSize: 25,
                      color: Colors.white,
                      fontFamily: 'Schyler'),),
                  const Spacer(),
                  Container(
                    width: double.infinity,
                    child:const Text(
                      'Register',style: TextStyle(
                      fontSize: 20,color: Colors.white,
                    ), //  textAlign: TextAlign.center, هذا الخاصيه في التيست اكدر احرك النص
                    ),
                  ),
                  const SizedBox(height: 14,),

                  BuildTextFormFilde(lablehiting: "Email", obscure: false,
                    onChanged: (data){
                    email = data;},),

                  const SizedBox(height: 14,),

                  BuildTextFormFilde(lablehiting: "password",
                      onChanged: (data){
                        password = data ;},),

                  const SizedBox(height: 14,),

                  BuildTextButton(title_button: 'Register',
                    ontap: () async {
                        if (formkeyregister.currentState!.validate()) {
                          BlocProvider.of<AuthBloc>(context).add(RegisterEvent(email: email!, password: password!));
                        }
                    },
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     const  Text('already have an account ?' , style: TextStyle(color: Colors.white),),
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                          /*
                           * تم استخدام ال (pushNamed) اعتباره اسهل وتم شرح طريقة الاعمل في دفتر الملاحضات رقم المحاضرة #147
                            * وهذا الطريقة تعتمد على استخدام الخاصيه (routes) عباره عن ماب في (MaterailApp)
                            *                     Navigator.pushNamed(context, 'LoginApp');
                           */
                        /*  Navigator.push(context, MaterialPageRoute(
                              builder: (context){return LoginApp();}));*/
                        },
                          child:const Text('   Sign In' , style: TextStyle(color: Color(0xffc7e8e9)),)),
                    ],
                  ),
                  const Spacer(flex: 2,)


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void exceptionmethod(BuildContext context , String massage) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(massage),));
  }
}


//  هذا الطريقة الاولى من دون استخدام ال (BlocProvider) والطريقة التي في الاعلى بستخدام BlocProvider طريقة احدث واسهل
/*
/*

class RegisterApp extends StatelessWidget {
  RegisterApp({super.key});

  static String id = 'RegisterPageApp';
  String? email , password;
  GlobalKey <FormState> formkeyregister = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          key: formkeyregister,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Spacer(),
              Image.asset(Klogo),
              const  Text("Scholar Chat", style: TextStyle(fontSize: 25,
                  color: Colors.white,
                  fontFamily: 'Schyler'),),
              const Spacer(),
              Container(
                width: double.infinity,
                child:const Text(
                  'Register',style: TextStyle(
                  fontSize: 20,color: Colors.white,
                ), //  textAlign: TextAlign.center, هذا الخاصيه في التيست اكدر احرك النص
                ),
              ),
              const SizedBox(height: 14,),

              BuildTextFormFilde(lablehiting: "Email",
                onChanged: (data){
                  email = data;},),

              const SizedBox(height: 14,),

              BuildTextFormFilde(lablehiting: "password",
                onChanged: (data){
                  password = data ;},),

              const SizedBox(height: 14,),

              BuildTextButton(title_button: 'Register',
                ontap: () async {
                  try {
                    if (formkeyregister.currentState!.validate()) {
                      await methodfirebase();
                    }
                    Navigator.pushNamed(context , Chatpage.id , arguments: email);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      exceptionmethod(context , 'The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      exceptionmethod(context , 'The account already exists for that email.');
                    }
                  } catch (e) {
                    exceptionmethod(context , 'the Email fail');
                  }
                },
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const  Text('already have an account ?' , style: TextStyle(color: Colors.white),),
                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                        */
/*
                       * تم استخدام ال (pushNamed) اعتباره اسهل وتم شرح طريقة الاعمل في دفتر الملاحضات رقم المحاضرة #147
                        * وهذا الطريقة تعتمد على استخدام الخاصيه (routes) عباره عن ماب في (MaterailApp)
                        *                     Navigator.pushNamed(context, 'LoginApp');
                       *//*

                        */
/*  Navigator.push(context, MaterialPageRoute(
                          builder: (context){return LoginApp();}));*//*

                      },
                      child:const Text('   Sign In' , style: TextStyle(color: Color(0xffc7e8e9)),)),
                ],
              ),
              const Spacer(flex: 2,)


            ],
          ),
        ),
      ),
    );
  }

  void exceptionmethod(BuildContext context , String massage) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(massage),));
  }

  Future<void> methodfirebase() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
*/
*/