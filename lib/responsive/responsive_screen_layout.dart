import 'package:flutter/material.dart';
import 'package:rmpl_hrm_admin/constants/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({required this.webScreenLayout, required this.monbileScreenLayout, super.key});

  final Widget webScreenLayout;
  final Widget monbileScreenLayout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if(constraints.maxWidth > webScreenSize){
          return webScreenLayout;
        }
        else{
          return monbileScreenLayout;
        }
      },
    );
  }
}