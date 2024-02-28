import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/news_cubit/news_cubit.dart';
import 'package:news_app/cubits/news_cubit/news_states.dart';
import 'package:news_app/widgets/article_conditional_builder.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var accessScinceList = NewsCubit.get(context); //? get object from cubit
        return ArticleConditionalBuilder(list: accessScinceList.science);
      },
    );
  }
}
