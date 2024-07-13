import 'package:flutter_bloc/flutter_bloc.dart';

class TriviaSelectedSliderCubit extends Cubit<int> {
  TriviaSelectedSliderCubit() : super(0);

  void updateSelectedIndicator(int value) {
    emit(value);
  }

  void resetIndicator() {
    emit(0);
  }
}
