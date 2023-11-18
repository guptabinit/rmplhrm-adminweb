import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:rmpl_hrm_admin/components/custom_button.dart';
import 'package:rmpl_hrm_admin/components/custom_textfield.dart';
import 'package:rmpl_hrm_admin/constants/colors.dart';
import 'package:rmpl_hrm_admin/constants/dimensions.dart';
import 'package:rmpl_hrm_admin/login/login.dart';
import 'package:rmpl_hrm_admin/main.dart';
import 'package:rmpl_hrm_admin/utils/box.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status.isSuccess) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                backgroundColor: Colors.green,
                content: Text('Login successful'),
              ),
            );
        }
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.errorMessage ?? 'Login failed'),
              ),
            );
        }
      },
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/images/LOGO.png',
                  width: 170,
                ),
              ),
            ),
            Container(
              // height: mq.height * 0.6,
              width: double.infinity,
              padding: mq.width > webScreenSize
                  ? EdgeInsets.symmetric(
                      horizontal: mq.width * 0.3,
                      vertical: 20,
                    )
                  : const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
              decoration: const BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  12.heightBox,
                  const Center(
                    child: Text(
                      'ADMIN LOGIN',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: darkColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  20.heightBox,
                  const _LoginEmailInputField(),
                  20.heightBox,
                  const _LoginPasswordInputField(),
                  20.heightBox,
                  const _LoginButton(),
                  8.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Need some help?',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Contact Developers',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginEmailInputField extends StatelessWidget {
  const _LoginEmailInputField();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Enter admin email address',
          style: TextStyle(
            fontFamily: 'Inter',
            color: darkColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        8.heightBox,
        BlocBuilder<LoginCubit, LoginState>(
          buildWhen: (previous, current) => previous.email != current.email,
          builder: (context, state) {
            return CustomTextFormField(
              text: 'admin@rmpl.com',
              inputType: TextInputType.emailAddress,
              onChanged: (String? value) =>
                  context.read<LoginCubit>().emailChanged(value),
              errorText: state.email.displayError?.text,
            );
          },
        ),
      ],
    );
  }
}

class _LoginPasswordInputField extends StatelessWidget {
  const _LoginPasswordInputField();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Enter your password',
          style: TextStyle(
            fontFamily: 'Inter',
            color: darkColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        8.heightBox,
        BlocBuilder<LoginCubit, LoginState>(
          buildWhen: (previous, current) =>
              previous.password != current.password,
          builder: (context, state) {
            return CustomTextFormField(
              text: '************',
              isPassword: true,
              errorText: state.password.displayError?.text,
              onChanged: (String? value) =>
                  context.read<LoginCubit>().passwordChanged(value),
            );
          },
        ),
      ],
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : CustomButton(
                onPress: !state.isValid
                    ? null
                    : () => context.read<LoginCubit>().login(),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: whiteColor,
                  ),
                ),
              );
      },
    );
  }
}
