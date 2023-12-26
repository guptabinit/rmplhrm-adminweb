import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/employee_details/bloc/employee_details_bloc.dart';
import 'package:rmpl_hrm_admin/salary_details/bloc/update_salary_details_bloc.dart';
import 'package:rmpl_hrm_admin/utils/utils.dart';

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
                return ListView.builder(
                  itemCount: state.employees.length,
                  itemBuilder: (context, index) {
                    final date = DateTime.now();
                    final year = date.year;
                    final month = date.month;
                    final employee = state.employees[index];
                    final amount =
                        employee.salaryDetails?['$year']?['$month']?.amount;
                    final totalSalary =
                        (employee.basicSalary ?? 0) + (employee.hra ?? 0);
                    final salary = amount ?? totalSalary;
                    final time = employee.salaryDetails?['$year']?['$month']
                        ?.createdAt?.monthDate;
                    return CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      isThreeLine: true,
                      value: context
                          .watch<UpdateSalaryDetailsBloc>()
                          .state
                          .selectedEmployees
                          .any(
                            (element) => element.uid == employee.uid,
                          ),
                      onChanged: (value) {
                        if (value == true) {
                          context.read<UpdateSalaryDetailsBloc>().add(
                                UpdateSalaryDetailAction(
                                  employee: employee,
                                ),
                              );
                        } else {
                          context.read<UpdateSalaryDetailsBloc>().add(
                                UnselectedEmployeeChangedEvent(
                                  employee,
                                ),
                              );
                        }
                      },
                      title: Text(
                        '${employee.firstName} ${employee.lastName}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'INR $salary',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Text(
                            time ?? 'N/A',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                      secondary: context
                              .watch<UpdateSalaryDetailsBloc>()
                              .state
                              .selectedEmployees
                              .any(
                                (element) => element.uid == employee.uid,
                              )
                          ? null
                          : IconButton(
                              icon: Icon(
                                Icons.edit,
                                color: Theme.of(context).primaryColor,
                              ),
                              onPressed: () async {
                                final amount = await showDialog<String>(
                                  context: context,
                                  builder: (context) {
                                    final controller = TextEditingController();
                                    return AlertDialog(
                                      title: const Text('Update Salary'),
                                      content: TextFormField(
                                        minLines: 1,
                                        controller: controller,
                                        decoration: const InputDecoration(
                                          hintText: 'Amount',
                                        ),
                                        keyboardType: const TextInputType
                                            .numberWithOptions(
                                          decimal: true,
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          child: const Text('Update'),
                                          onPressed: () {
                                            Navigator.of(context).pop(
                                              controller.text,
                                            );
                                          },
                                        ),
                                        TextButton(
                                          child: const Text('Cancel'),
                                          onPressed: () {
                                            Navigator.of(context).pop(
                                              null,
                                            );
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                                if (context.mounted) {
                                  final am = double.tryParse(
                                    amount ?? '',
                                  );
                                  if (am != null && am > 0) {
                                    context.read<UpdateSalaryDetailsBloc>().add(
                                          UpdateSalaryDetailAction(
                                            employee: employee,
                                            amount: am,
                                          ),
                                        );
                                  }
                                }
                              },
                            ),
                    );
                  },
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.read<UpdateSalaryDetailsBloc>().add(
                UpdateSalaryDetailsAction(
                  context.read<EmployeeDetailsBloc>().state.employees,
                ),
              );
        },
        label: const Text('Update all'),
        icon: const Icon(Icons.checklist),
      ),
    );
  }
}
