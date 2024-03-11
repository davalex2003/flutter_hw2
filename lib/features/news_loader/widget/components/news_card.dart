import 'package:flutter/material.dart';
import 'package:flutter_news/features/news_loader/data/models/news_model.dart';
import 'package:flutter_news/features/news_loader/widget/pages/detail_page.dart';
import 'package:flutter_news/common/widget/news_cache_image.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.news, this.isFavourite = false});
  final bool isFavourite;
  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  NewsDetailPage(news: news, isFavourite: isFavourite)),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Flexible(
              child: NewsCacheImage(
                width: 220,
                height: 160,
                news.urlToImage,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(width: 16),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(news.title, style: theme.textTheme.titleMedium),
                  const SizedBox(height: 16),
                  Text(
                    news.author,
                    style: const TextStyle(color: Colors.amber),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
