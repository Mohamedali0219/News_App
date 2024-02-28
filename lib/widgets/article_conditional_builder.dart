import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/widgets/article_item_build.dart';

class ArticleConditionalBuilder extends StatelessWidget {
  const ArticleConditionalBuilder({
    super.key,
    required this.list,
    this.isSearch = false,
  });

  final List list;
  final bool isSearch;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: list
          .isNotEmpty, //! isNotEmpty because the data laoaded when create the cubit
      builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => ArticleItem(article: list[index]),
        separatorBuilder: (context, index) {
          return const Divider(
            indent: 30,
            endIndent: 30,
          );
        },
        itemCount: list.length,
      ),
      fallback: (context) => isSearch
          ? Container()
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
