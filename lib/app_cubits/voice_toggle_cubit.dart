import 'package:bloc/bloc.dart';

//This cubit controls the behavior of the voice switch toggle.
class VoiceCubit extends Cubit<bool> {
  VoiceCubit() : super(true);

  void changeValue() => emit(!state);
}
