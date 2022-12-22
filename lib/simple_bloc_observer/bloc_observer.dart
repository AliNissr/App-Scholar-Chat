import 'package:flutter_bloc/flutter_bloc.dart';

/*
* 1- نقوم بعمل كلاس ترث من BlocObserver نضع في داخلها (onTransition and onChange)
* 2- نذهب الى main ونضيف Blocoverride
* 3- هذا الفكشنات واحده تعمل مع ال Bloc وهي ال onTransition والثانية تعمل مع اCubit وهي ال onChange
* 4- عمل هذا الفكشنز هي معرفة تحرك وتنقل ال Cubit and Bloc */
class SimpleBlocObserver extends BlocObserver{
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print ('Transition = $transition');
  }
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print ('Change = $change');
  }
}
