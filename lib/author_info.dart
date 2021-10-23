import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';
import 'circle_image.dart';

class AuthorInfo extends StatelessWidget {
  final String authorName;
  final String title;
  final ImageProvider? imageProvider;

  const AuthorInfo({
    Key? key,
    required this.title,
    required this.authorName,
    this.imageProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        // TODO 3: add alignment
        children: [
          Row(
            children: [
              CircleImage(
                imageProvider: imageProvider,
                imageRadius: 28,
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    authorName,
                    style: FooderlichTheme.lightTextTheme.headline2,
                  ),
                  Text(
                    title,
                    style: FooderlichTheme.lightTextTheme.headline3,
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
