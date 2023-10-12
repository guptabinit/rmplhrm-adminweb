import 'package:flutter/material.dart';
import 'package:rmpl_hrm_admin/constants/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {

  final Widget webScreenLayout;
  final Widget monbileScreenLayout;
  const ResponsiveLayout({super.key, required this.webScreenLayout, required this.monbileScreenLayout});

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