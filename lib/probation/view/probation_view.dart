import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmpl_hrm_admin/app/app.dart';
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
                  previous.status != current.status ||
                  previous.employees != current.employees,
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
                    return RefreshIndicator(
                      onRefresh: () async {
                        context.read<ProbationBloc>().add(
                              RefreshProbationEmployees(
                                context.read<AppBloc>().state.user.id,
                              ),
                            );
                      },
                      child: ListView.separated(
                        separatorBuilder: (_, __) => 12.heightBox,
                        itemCount: state.employees.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final employee = state.employees[index];
                          return Container(
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
                            child: ListTile(
                              isThreeLine: true,
                              dense: true,
                              title: Text(
                                '${employee.firstName} ${employee.lastName}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'EID: ${employee.eid}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 11,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  2.heightBox,
                                  Text(
                                    '${employee.probationTill?.date}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 11,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  )
                                ],
                              ),
                              trailing:
                                  BlocBuilder<ProbationBloc, ProbationState>(
                                buildWhen: (previous, current) =>
                                    previous.removeStatus !=
                                    current.removeStatus,
                                builder: (context, state) {
                                  return PopupMenuButton(
                                    itemBuilder: (context) {
                                      return [
                                        PopupMenuItem(
                                          child: const Text(
                                            'Remove from probation',
                                          ),
                                          onTap: () {
                                            context.read<ProbationBloc>().add(
                                                  RemoveFromProbation(
                                                    employee.uid!,
                                                  ),
                                                );
                                          },
                                        ),
                                      ];
                                    },
                                    icon: const Icon(Icons.more_vert),
                                    position: PopupMenuPosition.under,
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  case ProbationStatus.failure:
                    return Center(
                      child: Column(
                        children: [
                          const Text(
                            'Something went wrong',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              context.read<ProbationBloc>().add(
                                    RefreshProbationEmployees(
                                      context.read<AppBloc>().state.user.id,
                                    ),
                                  );
                            },
                            child: const Text('Retry'),
                          ),
                        ],
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
