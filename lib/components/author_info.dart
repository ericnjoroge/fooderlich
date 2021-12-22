import 'package:flutter/material.dart';
import '../fooderlich_theme.dart';
import 'circle_image.dart';

class AuthorInfo extends StatefulWidget {
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
  State<AuthorInfo> createState() => _AuthorInfoState();
}

class _AuthorInfoState extends State<AuthorInfo> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleImage(
                imageProvider: widget.imageProvider,
                imageRadius: 28,
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.authorName,
                    style: FooderlichTheme.lightTextTheme.headline2,
                  ),
                  Text(
                    widget.title,
                    style: FooderlichTheme.lightTextTheme.headline3,
                  )
                ],
              )
            ],
          ),
          IconButton(
            icon: Icon(_isFavorited ? Icons.favorite : Icons.favorite_border),
            iconSize: 30,
            color: Colors.red[400],
            onPressed: () {
              setState(() {
                _isFavorited = !_isFavorited;
              });
              const snackBar = SnackBar(content: Text('Author Favorited'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ],
      ),
    );
  }
}
