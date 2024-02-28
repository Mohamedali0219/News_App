import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/service/local_service/cache_helper.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeAppMode({fromShared}) {
    if (fromShared != null) {
      //? come from the shared preferences when we open the app
      isDark = fromShared;
      emit(NewsChangeModeState());
    } else {
      //? come from the button change mode
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(NewsChangeModeState());
      });
    }
  }
}
