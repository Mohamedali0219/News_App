import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/screens/web_view_screen.dart';
import 'package:news_app/widgets/navigator_method.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key, required this.article});
  final dynamic article;
  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return InkWell(
      onTap: () => navigatTo(context, WebViewScreen(url: article['url'])),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(article['urlToImage'] ??
                    'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: SizedBox(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      article['title'],
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    formatter.format(DateTime.parse(article['publishedAt'])),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
