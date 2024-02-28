import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/news_cubit/news_cubit.dart';
import 'package:news_app/cubits/news_cubit/news_states.dart';
import 'package:news_app/widgets/article_conditional_builder.dart';
import 'package:news_app/widgets/deflut_text_form_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var accessSearchList = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text('Search For News'),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: DefultTextFormField(
                  onChanged: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  hintText: 'Search For News',
                ),
              ),
              Expanded(
                child: ArticleConditionalBuilder(
                  list: accessSearchList.search,
                  isSearch: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
