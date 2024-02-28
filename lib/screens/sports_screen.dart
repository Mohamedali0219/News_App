import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/news_cubit/news_cubit.dart';
import 'package:news_app/cubits/news_cubit/news_states.dart';
import 'package:news_app/widgets/article_conditional_builder.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var accessSportsList = NewsCubit.get(context);
        return ArticleConditionalBuilder(list: accessSportsList.sports);
      },
    );
  }
}
