import 'package:flutter/material.dart';
import 'package:rmpl_hrm_admin/components/buttons/main_button.dart';
import 'package:rmpl_hrm_admin/components/custom_textfield.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/utils/box.dart';

class AddSalaryDetailView extends StatelessWidget {
  const AddSalaryDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        titleSpacing: 0,
        title: const Text(
          'Add salary detail',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: whiteColor,
          ),
        ),
        iconTheme: const IconThemeData(
          color: whiteColor,
        ),
      ),
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
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const _EmployeeNameField(),
                16.heightBox,
                const _SalaryAmountField(),
                12.heightBox,
                const _MonthField(),
                const Spacer(),
                const _AddButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EmployeeNameField extends StatelessWidget {
  const _EmployeeNameField();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Employee Name',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        8.heightBox,
        DropdownButtonFormField(
          items: ['John', 'Jain', 'Max']
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ),
              )
              .toList(),
          onChanged: (value) {},
          hint: const Text('Select Employee'),
        ),
      ],
    );
  }
}

class _SalaryAmountField extends StatelessWidget {
  const _SalaryAmountField();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Salary Amount',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        8.heightBox,
        const CustomTextFormField(
          text: 'e.g. 40000.00',
        ),
      ],
    );
  }
}

class _MonthField extends StatelessWidget {
  const _MonthField();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Month',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        8.heightBox,
        CustomTextFormField(
          text: 'Select Month',
          readOnly: true,
          suffixIcon: const Icon(Icons.calendar_month),
          onTap: () async {
            await showDatePicker(
              context: context,
              firstDate: DateTime(1990),
              lastDate: DateTime.now().add(
                const Duration(days: 30),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton();

  @override
  Widget build(BuildContext context) {
    return MainButton(
      title: 'Add',
      onTap: () {},
    );
  }
}
