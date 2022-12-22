import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarchat/cubits/auth_cubit.dart';
import 'package:scholarchat/cubits/chat_cubit.dart';
import 'package:scholarchat/firebase_options.dart';
import 'package:scholarchat/pages/ChatPageView.dart';
import 'package:scholarchat/pages/login_page.dart';
import 'package:scholarchat/pages/register.dart';
 main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // هنا نقوم بضافة هذا الخاصية كما هو بالتعليق تحت
  // لكن تم لغاء هذا الطريقه وتوجد طريقه غيرها
 // BlocOverrides.runZoned(() {
 //   runApp( ChatApp());
 //   blocObserver : SimpleBlocObserver();
 //},);
   runApp(ChatApp());
}
class ChatApp extends StatelessWidget {
  const ChatApp({super.key});
  @override
  Widget build(BuildContext context) {
    //  عند عمل اكثر من cubit لا نستخدم ال BlocProvider لانها تستدعي Cubit واحده لذالك نستخدم ال MultiBlocProvider التي توفر لي استخدام اكتر من BlocProvider
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(),),
       // BlocProvider(create: (context) => LoginCubit()),
       // BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => ChatCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: { RegisterApp.id : (context) => RegisterApp() ,
          LoginApp.idd : (context) =>  LoginApp() ,
          Chatpage.id : (context) => Chatpage(),
          Chatpage.id : (context) => Chatpage(),
        },
        initialRoute: 'LoginApp',
      ),
    );
  }
}


//  هذا الطريقة الاولى من دون استخدام ال (BlocProvider) والطريقة التي في الاعلى بستخدام BlocProvider طريقة احدث واسهل
/*
main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( ChatApp());
}
class ChatApp extends StatelessWidget {
  const ChatApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: { RegisterApp.id : (context) => RegisterApp() ,
        LoginApp.idd : (context) =>  LoginApp() ,
        Chatpage.id : (context) => Chatpage(),
        Chatpage.id : (context) => Chatpage(),
      },
      initialRoute: 'LoginApp',
    );
  }
}*/