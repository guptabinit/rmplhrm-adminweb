import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmpl_hrm_admin/components/divider_with_padding.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/employee_details/bloc/employee_details_bloc.dart';

class SalaryDetailsView extends StatelessWidget {
  const SalaryDetailsView({super.key});

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
        child: BlocBuilder<EmployeeDetailsBloc, EmployeeDetailsState>(
          builder: (context, state) {
            switch (state.status) {
              case EmployeeDetailsStatus.initial:
              case EmployeeDetailsStatus.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case EmployeeDetailsStatus.success:
                return Column(
                  children: [
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: false,
                      onChanged: (_) {},
                      title: const Text(
                        'Select All',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const DividerWithPadding(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.employees.length,
                        itemBuilder: (context, index) {
                          final employee = state.employees[index];
                          return CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            value: false,
                            onChanged: (value) {},
                            title: Text(
                              '${employee.firstName} ${employee.lastName}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text(
                              'INR ${(employee.basicSalary ?? 0) + (employee.hra ?? 0)}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            secondary: IconButton(
                               icon: Icon(
                                Icons.edit,
                                color: Theme.of(context).primaryColor,
                              ),
                              onPressed: () {},
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              case EmployeeDetailsStatus.failure:
                return const Center(
                  child: Text(
                    'Something went wrong',
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
