//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholarchat/blocs/auth_bloc.dart';
import 'package:scholarchat/cubits/chat_cubit.dart';
//import 'package:scholarchat/cubits/auth_cubit.dart';
//import 'package:scholarchat/cubits/chat_cubit.dart';
//import 'package:scholarchat/cubits/chat_cubit.dart';
//import 'package:scholarchat/cubits/login_cubit.dart';
import 'package:scholarchat/pages/ChatPageView.dart';
import 'package:scholarchat/pages/register.dart';
import '../constant/constant_app.dart';
import '../widgets/build_textbutton.dart';
import '../widgets/build_textfilde.dart';

class LoginApp extends StatelessWidget {
  static String idd = "LoginApp";
  GlobalKey<FormState> formkey = GlobalKey();
  String? email, password;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState >(
      listener: (context, state) {
        if (state is LoginLoaging){
          isLoading = true;
        }else if (state is LoginSuccess){
          BlocProvider.of<ChatCubit>(context).getMessages();
          Navigator.pushNamed(context, Chatpage.id , arguments: email);
           isLoading = false;
        }else if (state is LoginFailuer){
          ExMethod(context, state.errormassages);
          isLoading = false;
        }
      },

      builder: (context , state) => ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: KPrimaryColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Spacer(),
                  Image.asset(Klogo),
                  const Text(
                    "Scholar Chat",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontFamily: 'Schyler'),
                  ),
                  const Spacer(),
                  Container(
                    width: double.infinity,
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  BuildTextFormFilde(
                    lablehiting: "Email",
                    onChanged: (data) {
                      email = data;
                    },
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  BuildTextFormFilde(
                    lablehiting: "password",
                    obscure: true,
                    onChanged: (data) {
                      password = data;
                    },
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  BuildTextButton(
                      title_button: 'Sign In',
                      ontap: () async {
                        if (formkey.currentState!.validate()) {
                          BlocProvider.of<AuthBloc>(context).add(LoginEvent(email: email!, password: password!));
                        } else {}
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'don\'t have an account ?',
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RegisterApp.id);
                          },
                          child: const Text(
                            '    Register',
                            style: TextStyle(color: Color(0xffc7e8e9)),
                          )),
                    ],
                  ),
                  const Spacer(
                    flex: 2,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void ExMethod(BuildContext contaxt, String massage) {
    ScaffoldMessenger.of(contaxt)
        .showSnackBar(SnackBar(content: Text(massage)));
  }

}

//  هذا الطريقة الاولى من دون استخدام ال (BlocProvider) والطريقة التي في الاعلى بستخدام BlocProvider طريقة احدث واسهل
/*
/*

class LoginApp extends StatefulWidget {
  const LoginApp({super.key});
  static String idd = "LoginApp";
  @override
  State<LoginApp> createState() => _LoginAppState();
}
class _LoginAppState extends State<LoginApp> {
  GlobalKey <FormState> formkey = GlobalKey();
 String? email , password;
 bool isLoagin = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoagin,
      child: Scaffold(
              backgroundColor: KPrimaryColor,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Form(
                  */
/*
                  * 1- هنا قمنا بوضع الكل ب وجد فورم لكي اعمل خاصيه الكي المفتاح
                  * 2- نقوم بعمل (GlobalKey <FormState> formkey = GlobalKey();)
                  * 3- هذه الخطوات لغرض الوصول الى بعض الخصائص المجوده في الفريم كي*//*

                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Spacer(),
                      Image.asset(Klogo),
                     const Text("Scholar Chat", style: TextStyle(fontSize: 25,
                          color: Colors.white,
                          fontFamily: 'Schyler'),),
                     const Spacer(),
                        Container(
                        width: double.infinity,
                        child:const Text(
                          'Sign In',style: TextStyle(
                          fontSize: 20,color: Colors.white,
                        ), //  textAlign: TextAlign.center, هذا الخاصيه في التيست اكدر احرك النص
                        ),
                       ),
                      const SizedBox(height: 14,),
                      BuildTextFormFilde(lablehiting: "Email",
                        onChanged: (data){
                          email = data;
                        },
                      ),
                      const SizedBox(height: 14,),
                      BuildTextFormFilde(lablehiting: "password",
                        obscure: true,
                        onChanged: (data){
                          password = data;
                        },),
                     const SizedBox(height: 14,),
                      BuildTextButton(title_button: 'Sign In',
                       ontap: () async{
                        */
/*
                        * 1- نقوم بوضع شرط لكي نحصل على تطابق اي ان تكون (TextFilde) غير فارغة
                        * 2- عند عمل النافيكيتر استخدم خاصية (arguments) الغرض عنده الذهاب الى اصفحة المعنية تاخذ معا ايميل
                        * 3- نستقبل هذا الايميل في الصفحه الاخرى بهذا ىالطريقة (   var email = ModalRoute.of(context)!.settings.arguments ;)
                        * 4- نستخدم الكلاس (FirebaseAuthException) في رمي الخطاء حتى تقوم بالطلاع على الكود*//*

                        if (formkey.currentState!.validate()){
                          isLoagin = true;
                          setState(() {});
                          try{
                           await RegisterUser();
                           Navigator.pushNamed( context, Chatpage.id , arguments: email);
                         } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                             ExMethod( context , 'No user found for that email.') ;
                            } else if (e.code == 'wrong-password') {
                              ExMethod( context , 'Wrong password provided for that user.') ;
                            }
                         }catch (e){
                           ExMethod(context , 'فشل التسجيل');
                          }
                          isLoagin = false;
                          setState(() {});
                      }else{}
                      }
                        ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         const Text('don\'t have an account ?' , style: TextStyle(color: Colors.white),),
                          GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, RegisterApp.id);
                              */
/*  Navigator.push(context, MaterialPageRoute(
                                  builder: (context){return SignUp();}));*//*

                            },
                              child:const Text('   Register' , style: TextStyle(color: Color(0xffc7e8e9)),)),
                        ],
                      ),
                     const Spacer(flex: 2,)
                    ],
                  ),
                ),
        ),

      ),
    );
  }

  void ExMethod (BuildContext contaxt , String massage){
    ScaffoldMessenger.of(contaxt).showSnackBar(SnackBar(content: Text(massage)));
  }

  Future<void>  RegisterUser() async {
     await FirebaseAuth.instance.signInWithEmailAndPassword(email: email!, password: password!);
  }
}

*/
*/