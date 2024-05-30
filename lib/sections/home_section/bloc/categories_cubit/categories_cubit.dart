import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<int> {
  CategoriesCubit() : super(0);

  void changeTab(int newTab) {
    emit(newTab);
  }
}