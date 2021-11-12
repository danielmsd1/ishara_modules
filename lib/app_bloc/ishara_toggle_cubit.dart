//This cubit controls the behavior of the Ishara toggle.
import 'package:bloc/bloc.dart';

class IsharaCubit extends Cubit<bool> {
  IsharaCubit() : super(true);

  void changeValue() => emit(!state);
}
