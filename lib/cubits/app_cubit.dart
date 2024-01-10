import 'package:bloc/bloc.dart';
import 'package:myapp/model/data_model.dart';
import 'package:myapp/services/data_services.dart';
import 'app_cubits_states.dart';

class Appcubits extends Cubit<CubitStates> {
  final DataServices data;
  late final places;
  Appcubits(this.data) : super(InitialState()) {
    emit(WelcomeState());
  }

  void getData() async {
    try {
      places = await data.getDataFromAPi();
      emit(LoadedState(places));
    } catch (e) {
      e.toString();
    }
  }

  void goDetailPage(DataModel data) async {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }

 goToLoginScreen() {
    emit(LoadingState());
  }
}
