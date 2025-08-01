import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/models/articles.dart';
import 'package:news/models/news_data_response.dart';

class NewsItem extends StatelessWidget {
  final Articles article;

  const NewsItem({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? "",
                height: 220,
                width: double.infinity,
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              article.title ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(article.author?.split(" ").first ?? ""),
                Text(article.publishedAt?.substring(0, 10) ?? ""),
              ],
            )
          ],
        ),
      ),
    );
  }
}
