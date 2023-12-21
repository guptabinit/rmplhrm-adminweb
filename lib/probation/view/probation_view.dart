import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/probation/probation.dart';
import 'package:rmpl_hrm_admin/utils/box.dart';
import 'package:rmpl_hrm_admin/utils/utils.dart';

class ProbationView extends StatelessWidget {
  const ProbationView({super.key});

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
        child: SizedBox(
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<ProbationBloc, ProbationState>(
              buildWhen: (previous, current) =>
                  previous.status != current.status,
              builder: (context, state) {
                state.status.log();
                switch (state.status) {
                  case ProbationStatus.initial:
                  case ProbationStatus.loading:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case ProbationStatus.success:
                    if (state.employees.isEmpty) {
                      return Center(
                        child: CachedNetworkImage(
                          width: MediaQuery.of(context).size.width * 0.7,
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
                    return ListView.separated(
                      separatorBuilder: (_, __) => 12.heightBox,
                      itemCount: state.employees.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final employee = state.employees.elementAt(index);
                        return Container(
                          width: 327,
                          height: 67,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 1,
                                color: Color(0xFFD0D0D0),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(2, 2),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 11,
                                top: 10,
                                child: SizedBox(
                                  width: 305,
                                  child: Text(
                                    'Name: ${employee.firstName} ${employee.lastName}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 11,
                                top: 39,
                                child: Text(
                                  'EID: ${employee.eid}',
                                  style: const TextStyle(
                                    color: Color(0xFF828282),
                                    fontSize: 11,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 101,
                                top: 39,
                                child: Text(
                                  'Till Date: ${employee.probationTill?.date}',
                                  style: const TextStyle(
                                    color: Color(0xFF828282),
                                    fontSize: 11,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  case ProbationStatus.failure:
                    return const Center(
                      child: Text(
                        'Something went wrong',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
