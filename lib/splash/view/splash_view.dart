import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:rmpl_hrm_admin/admin_profile/admin_profile.dart';
import 'package:rmpl_hrm_admin/app/bloc/app_bloc.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/login/login.dart';
import 'package:rmpl_hrm_admin/main.dart';
import 'package:rmpl_hrm_admin/root/root.dart';
import 'package:rmpl_hrm_admin/splash/splash.dart';
import 'package:rmpl_hrm_admin/utils/box.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          switch (state.status) {
            case SplashStatus.loading:
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/LOGO.png',
                      width: 170,
                    ),
                  ),
                  28.heightBox,
                  const Text(
                    'RMPL',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4,
                      fontSize: 40,
                      // height: 2
                    ),
                  ),
                  4.heightBox,
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: mq.width * 0.45,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 4,
                      decoration: BoxDecoration(
                        color: lightGreyColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  16.heightBox,
                  const Text(
                    'Recorded Music Private Limited',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: whiteColor,
                      fontWeight: FontWeight.w500,
                      // letterSpacing: 4,
                      fontSize: 20,
                      // height: 2
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  const Text(
                    'ADMIN PANEL',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: whiteColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                  const Spacer(flex: 2),
                  const SizedBox(
                    height: 40,
                    child: LoadingIndicator(
                      indicatorType: Indicator.lineScale,
                      colors: [whiteColor],
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'Powered by Quickgick',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: whiteColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      // height: 2
                    ),
                  ),
                  const Spacer(),
                ],
              );
            case SplashStatus.loaded:
              return FlowBuilder(
                state: context.select((AppBloc bloc) => bloc.state.status),
                onGeneratePages: (state, pages) {
                  switch (state) {
                    case AppStatus.authenticated:
                      context.read<AdminProfileBloc>().add(
                            AdminProfileLoaded(
                              context.read<AppBloc>().state.user.id,
                            ),
                          );
                      return [RootPage.page()];
                    case AppStatus.unauthenticated:
                      return [LoginPage.page()];
                  }
                },
              );
          }
        },
      ),
    );
  }
}
