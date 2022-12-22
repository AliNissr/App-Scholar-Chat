import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:scholarchat/modal/massagesmodal.dart';

import '../constant/constant_app.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  CollectionReference massages = FirebaseFirestore.instance.collection(KMassages);
  List<MassagesModal> messagesList =[];
  void sendMessages({required String mess, required String email}) {
    try {
      massages.add({'fullname': mess, KTimeMassages: DateTime.now(), 'id': email});
    } on Exception catch (e) {
      print (e);
    }
  }

  void getMessages (){

    massages.orderBy(KTimeMassages, descending: true).snapshots().listen((event) {
      // هذا ال Listen هذه تقوم بسماع او الاصغاء الى docs في الفاير بيس اي عنده ما يحدث تحديث هناك تقوم بالاخبار حتى يتم بعث ChatSuccess
      messagesList.clear();
      for (var doc in event.docs){
        messagesList.add( MassagesModal.jsondata(doc));
      }
      emit(ChatSuccess(massge: messagesList));
    });
  }
}
