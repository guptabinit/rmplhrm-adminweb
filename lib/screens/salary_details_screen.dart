import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:rmpl_hrm_admin/constants/colors.dart';

class SalaryDetailScreen extends StatefulWidget {
  const SalaryDetailScreen({super.key});

  static Route<void> route() => MaterialPageRoute(
        builder: (_) => const SalaryDetailScreen(),
      );

  @override
  State<SalaryDetailScreen> createState() => _SalaryDetailScreenState();
}

class _SalaryDetailScreenState extends State<SalaryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        padding: const EdgeInsets.only(top: 16),
        margin: const EdgeInsets.only(),
        decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Center(
          child: CachedNetworkImage(
            width: MediaQuery.of(context).size.width * 0.7,
            imageUrl:
                'https://img.freepik.com/free-vector/empty-concept-illustration_114360-7416.jpg',
            fit: BoxFit.fitWidth,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
              child:
                  CircularProgressIndicator(value: downloadProgress.progress),
            ),
            errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
          ),
        ),
      ),
    );
  }
}
