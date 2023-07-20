import 'package:flutter_application_2/traning_cubit/cubit/traning_case_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TraningCaseCubit extends Cubit<TraningCaseState> {
  TraningCaseCubit() : super(TraningCaseInitial());

  final List<String> filters = [
    'All',
    'Favorites',
    'Recent',
    'Archived',
    'Shared',
    'Trash',
    'Spam'
  ];
  int selectedIndex = 0;
  String selectedFilterName = '';
  void onFilterSelected(int index) {
    selectedIndex = index;
    switch (index) {
      case 0:
        selectedFilterName = 'All';
        break;
      case 1:
        selectedFilterName = 'Favorites';
        break;
      case 2:
        selectedFilterName = 'Recent';
        break;
      case 3:
        selectedFilterName = 'Archived';
        break;
      case 4:
        selectedFilterName = 'Shared';
        break;
      case 5:
        selectedFilterName = 'Trash';
        break;
      case 6:
        selectedFilterName = 'Spam';
        break;
      default:
        selectedFilterName = '';
    }
    emit(ChangeFastBarState());
  }

  bool isPassword = true;
  void passwordChange() {
    isPassword = !isPassword;
    emit(ChangePasswordState());
  }

  String selectedValue = '';
  void handelRadio(String value) {
    selectedValue = value;
    emit(HandelRadioState());
  }
}
