import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarchat/cubits/chat_cubit.dart';
import 'package:scholarchat/modal/massagesmodal.dart';
import 'package:scholarchat/widgets/Chat_Container.dart';
import '../constant/constant_app.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class Chatpage extends StatelessWidget {
  static String id = "Chatpage";

  final ScrollController controller = ScrollController();
  TextEditingController textcontroller = TextEditingController();
  List<MassagesModal> massageslist = [];
  dynamic dete;
  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KPrimaryColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Klogo,
              width: 50,
            ),
            Text("Chat")
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                massageslist = BlocProvider.of<ChatCubit>(context).messagesList;
                return ListView.builder(
                    reverse: true,
                    controller: controller,
                    itemCount: massageslist.length,
                    itemBuilder: (context, index) {
                      return massageslist[index].id == email
                          ? ChatPageContianer(massagesdata: massageslist[index])
                          : ChatPageContianerfrinde(
                          massagesdata: massageslist[index]);
                    });
              },
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textcontroller,
                onChanged: (data) {
                  dete = data;
                },
                decoration: InputDecoration(
                  hintText: "Send Massage",
                  suffixIcon: GestureDetector(
                      onTap: () {
                          BlocProvider.of<ChatCubit>(context).sendMessages(mess: dete, email: email);
                        textcontroller.clear();
                        controller.animateTo(
                          0,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.linearToEaseOut,
                        );
                      },
                      child: const Icon(
                        Icons.send,
                        color: KPrimaryColor,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: KPrimaryColor,
                          width: 2,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: KPrimaryColor,
                          width: 2,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(
                        20,
                      )),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: KPrimaryColor,
                        width: 10,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

//  هذا الطريقة الاولى من دون استخدام ال (BlocProvider) والطريقة التي في الاعلى بستخدام BlocProvider طريقة احدث واسهل
/*
class Chatpage extends StatefulWidget {
  static String id = "Chatpage";
  @override
  State<Chatpage> createState() => _ChatpageState();
}
class _ChatpageState extends State<Chatpage> {
  /*
  * 1- نستخدم ( FirebaseFirestore firestore = FirebaseFirestore.instance;) حتى استطيع التعامل مع ال FireBase من خلال هذا الوبجكت
  * 2- نستخدم ( CollectionReference massages = FirebaseFirestore.instance.collection(KMassages);) هنا قمت بعمل اوبجكت يستيع الوصول الى ال Collection الموجودة في Firebase حتى استطيع ان اقوم بعمل (اضافة او قراءة) من هذا ال Collection التي قمت انا بنشاءها في الفاير بيس   */
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference massages =
  FirebaseFirestore.instance.collection(KMassages);

/*
* 1- تستخدم ال ( final ScrollController controller = ScrollController();) حتى في الست فيو استخدم خاصيه القفز الى اخر اليست كما يوجد في الاسفل
* 2- تستخدم ال (TextEditingController textcontroller = TextEditingController();) حتى استخم خاصية حذف ما يوجد في (Textfilde) عند الارسال كا هو مجود في الاسفل*/
  final ScrollController controller = ScrollController();
  TextEditingController textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    dynamic date;
    /*
 هذا الطريقة تستخدم في استقبال قيمة قادمة من صفحة اخرى بواسطة النفيكيتر
   String email = ModalRoute.of(context)!.settings.arguments as String; هذا طريقة اخرى
   اما ما معنى (as String) هو اذا كنت متاكد من القيمة القادمة مية في المية انها سترنك راح اكدر اخليه بمتغير نوع سترنك
   */
    var email = ModalRoute.of(context)!.settings.arguments;
    /*
   * - هنا توجد طريقتان في جلب البيانات وهي
      * 1- هذه (FutureBuilder) وهي تقوم برسال البيانات مرة واحده بعده تحديثها وتستخدم بعض الخاصيات كما هو في (docs firebase) . هي وجدد تقوم ببناء UI على اساس داته تأتي من المستقبل ونقوم بعطاء نوع البيانات التي راح تستدعه  <DocumentSnashagt> الي من سويت get تستدي البيانات راح يكون هذا هو نوع البيانات اي استلمة
   * 2- هذه (StreamBuilder)  وهي تقوم برسال البيانات في كل مرة تقوم بتحديث تاتي بها على الفور بعد التحديثها في (docs firebase  */
    return StreamBuilder<QuerySnapshot>(
        هذا orderBy(KTimeMassages,descending: true) الفكشن تقوم بجلب تاريخ الرسالة اما(descending) تقوم بجلب البيانات تنازلين اي من اخر رسالة وصلة
      stream: massages.orderBy(KTimeMassages, descending: true).snapshots(),
    // ال Snapshat هاي لي راح تسقبل حاوية البيانات وليس البيانات نفسها راح ينحط بيه حويات البيانات وليس البيانات
      builder: (context, snapshot) {
        List<MassagesModal> massageslist = [];
        for (int i = 0; i < snapshot.data!.docs.length; i++) {
          massageslist.add(MassagesModal.jsondata(snapshot.data!.docs[i]));
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: KPrimaryColor,
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Klogo,
                  width: 50,
                ),
                Text("Chat")
              ],
            ),
          ),
          body: Column(
            children: [
              // هذه ال (Expanded) تعمل على اعطاء التيست مسحه تتحرك فيها داخل الكولوم
            Expanded(
                child: ListView.builder(
                    reverse: true, // هذا الخاصية تسمح بعكس اليست فيو
                    controller: controller,
                    itemCount: massageslist.length,
                    itemBuilder: (context, index) {
                      return massageslist[index].id == email
                          ? ChatPageContianer(massagesdata: massageslist[index])
                          : ChatPageContianerfrinde(
                          massagesdata: massageslist[index]);
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    controller: textcontroller,
                    onChanged: (data) {
                      date = data;
                    },
                    decoration: InputDecoration(
                        hintText: "Send Massage",
                        suffixIcon: GestureDetector(
                            onTap: () {
                              massages.add({
                                'fullname': date,
                                KTimeMassages: DateTime.now(),
                                'id': email
                              });
                              textcontroller.clear();
                              /*
                                * 1- هذه طريقة الانتقال الى اخر اليست فيو (animateTo)
                                * 2- طريقة الثاني هي استخدان فكشن (jump To)*/
                              controller.animateTo(
                                0,
                                // controller.position.maxScrollExtent, هنا نعطي قيمة للوصول الى اخر اليست فيو
                                duration: Duration(milliseconds: 500),
                                // هنا سرعة الانتقال الى اخر اليس فيو
                                curve: Curves
                                    .linearToEaseOut, // هنا شكل الانتقال الى اخر اليست فيو
                              );
                            },
                            child: const Icon(
                              Icons.send,
                              color: KPrimaryColor,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: KPrimaryColor,
                                width: 2,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(20)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: KPrimaryColor,
                                width: 2,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(20))
                      /*border: OutlineInputBorder(
                  borderSide: BorderSide(color: KPrimaryColor , width: 10, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(20),*/ //  هذا البوردر بشكل عام لل (TextFilde) قبل وبعد الكتابة نفس الشكل يكون  .... اما فوق سويته بشكل خاص قبل وبعد الكتابة كلمن وشكله من خلال ال (enabledBorder and focusedBorder)

                    )),
              ),
            ],
          ),
        );
      },
    );
  }
}

/*cupertino_icons: ^1.0.2
  cloud_firestore: ^4.0.5*/
*/