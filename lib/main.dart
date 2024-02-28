import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/app_cubit/app_cubit.dart';
import 'package:news_app/cubits/bloc_observer.dart';
import 'package:news_app/cubits/news_cubit/news_cubit.dart';
import 'package:news_app/layouts/news_layout.dart';
import 'package:news_app/service/local_service/cache_helper.dart';
import 'package:news_app/service/remote_service/dio_helper.dart';
import 'package:news_app/widgets/theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool? isDark =
      CacheHelper.getBoolean(key: 'isDark'); //! from shared preferences

  runApp(MyApp(
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isDark});
  final bool? isDark;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AppCubit()..changeAppMode(fromShared: isDark)),
        BlocProvider(
          create: (context) => NewsCubit()
            ..getBusiness(), //? ..getBusiness()..getSports()..getScience() [if the bussiness is not empty] need this case of coming data of three category in the same time))
        )
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ligthTheme(),
            darkTheme: darkTheme(),
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: const Directionality(
              //* ltr => left to right
              textDirection: TextDirection.ltr,
              child: NewsLayout(),
            ),
          );
        },
      ),
    );
  }
}
