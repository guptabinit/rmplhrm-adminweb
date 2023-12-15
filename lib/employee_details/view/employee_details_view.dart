import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmpl_hrm_admin/app/app.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/employee_details/employee_details.dart';
import 'package:rmpl_hrm_admin/utils/box.dart';

class EmployeeDetailsView extends StatelessWidget {
  const EmployeeDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        height: double.infinity,
        margin: const EdgeInsets.only(),
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                maxLines: 1,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Search employee',
                  hintStyle: const TextStyle(color: textGreyColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(36.0),
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: textGreyColor,
                  ),
                ),
                onChanged: (value) {
                  context.read<EmployeeDetailsBloc>().add(
                        EmployeeDetailsSearch(value),
                      );
                },
              ),
              16.heightBox,
              BlocBuilder<EmployeeDetailsBloc, EmployeeDetailsState>(
                builder: (context, state) {
                  switch (state.status) {
                    case EmployeeDetailsStatus.initial:
                    case EmployeeDetailsStatus.loading:
                      return const Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      );
                    case EmployeeDetailsStatus.success:
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
                            errorWidget: (_, __, error) => const Center(
                              child: Icon(
                                Icons.error,
                              ),
                            ),
                          ),
                        );
                      } else {
                        if (state.searching) {
                          return ListView.separated(
                            separatorBuilder: (_, __) => 12.heightBox,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.searchResults.length,
                            itemBuilder: (BuildContext context, int index) {
                              final employee = state.searchResults[index];
                              return EmployeeTab(employee: employee);
                            },
                          );
                        } else {
                          return ListView.separated(
                            separatorBuilder: (_, __) => 12.heightBox,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.employees.length,
                            itemBuilder: (BuildContext context, int index) {
                              final employee = state.employees[index];
                              return EmployeeTab(employee: employee);
                            },
                          );
                        }
                      }
                    case EmployeeDetailsStatus.failure:
                      return Center(
                        child: Column(
                          children: [
                            const Text(
                              'Something went wrong',
                              style: TextStyle(color: Colors.red),
                            ),
                            TextButton(
                              onPressed: () {
                                context.read<EmployeeDetailsBloc>().add(
                                      EmployeeDetailsFetched(
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
              12.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
