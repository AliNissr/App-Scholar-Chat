part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}
class ChatSuccess extends ChatState {
  List<MassagesModal> massge ;
  ChatSuccess({required this.massge});
}
