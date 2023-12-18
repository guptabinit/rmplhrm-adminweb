import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class EmptyItems extends StatelessWidget {
  const EmptyItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CachedNetworkImage(
        width: MediaQuery.of(
              context,
            ).size.width *
            0.7,
        imageUrl:
            'https://img.freepik.com/free-vector/empty-concept-illustration_114360-7416.jpg',
        fit: BoxFit.fitWidth,
        progressIndicatorBuilder: (
          _,
          __,
          downloadProgress,
        ) =>
            Center(
          child: CircularProgressIndicator(
            value: downloadProgress.progress,
          ),
        ),
        errorWidget: (context, url, error) => const Center(
          child: Icon(
            Icons.error,
          ),
        ),
      ),
    );
  }
}
