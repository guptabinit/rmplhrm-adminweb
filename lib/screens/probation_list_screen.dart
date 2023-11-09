import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ProbationListScreen extends StatefulWidget {
  const ProbationListScreen({super.key});

  @override
  State<ProbationListScreen> createState() => _ProbationListScreenState();
}

class _ProbationListScreenState extends State<ProbationListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        padding: const EdgeInsets.only(top: 16),
        margin: const EdgeInsets.only(top: 0),
        decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Center(
          child: CachedNetworkImage(
            width: MediaQuery.of(context).size.width*0.7,
            imageUrl: "https://img.freepik.com/free-vector/empty-concept-illustration_114360-7416.jpg",
            fit: BoxFit.fitWidth,
            progressIndicatorBuilder: (context, url, downloadProgress) => Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
            errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
          ),
        ),
      ),
    );
  }
}
