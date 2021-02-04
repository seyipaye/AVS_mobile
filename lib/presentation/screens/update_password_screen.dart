import 'package:avs/data/providers/update_provider.dart';
import 'package:avs/data/repositories/update_repository.dart';
import 'package:avs/logic/cubits/authentication_cubit.dart';
import 'package:avs/logic/cubits/update_password_cubit.dart';
import 'package:avs/logic/cubits/update_password_state.dart';
import 'package:avs/presentation/widgets/app_raised_button.dart';
import 'package:avs/presentation/widgets/input/app_text_form_field.dart';
import 'package:avs/presentation/widgets/page_title.dart';
import 'package:avs/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdatePasswordScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final space = SizedBox(
    height: 50,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdatePasswordCubit(
        UpdateRepository(
          UpdateProvider(
            BlocProvider.of<AuthenticationCubit>(context),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          title: Text(
            'Update Password',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xff151522),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                // PageHeader(title: 'Update Password'),
                // space,
                BlocConsumer<UpdatePasswordCubit, UpdatePasswordState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    final bloc = context.watch<UpdatePasswordCubit>();
                    return Form(
                      key: formKey,
                      autovalidateMode: state.autovalidateMode,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          AppTextFormField(
                            label: 'Old Password',
                            hintText: '*******',
                            obscureText: state.hideOldPassword,
                            onSaved: (value) => bloc.oldPassword = value.trim(),
                            validator: Validator.isEightDigit,
                            suffixIcon: IconButton(
                              icon: state.hideOldPassword
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.remove_red_eye),
                              onPressed: () => bloc.togglePasswordVisibility(0),
                            ),
                          ),
                          space,
                          AppTextFormField(
                            label: 'New Password',
                            hintText: '*******',
                            obscureText: state.hideNewPassword,
                            onSaved: (value) => bloc.newPassword = value.trim(),
                            validator: Validator.isEightDigit,
                            suffixIcon: IconButton(
                              icon: state.hideNewPassword
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.remove_red_eye),
                              onPressed: () => bloc.togglePasswordVisibility(1),
                            ),
                          ),
                          space,
                          AppTextFormField(
                            label: 'Confirm Password',
                            hintText: '*******',
                            obscureText: state.hideConfirmPassword,
                            onSaved: (value) =>
                                bloc.confirmPassword = value.trim(),
                            validator: Validator.isEightDigit,
                            suffixIcon: IconButton(
                              icon: state.hideConfirmPassword
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.remove_red_eye),
                              onPressed: () => bloc.togglePasswordVisibility(2),
                            ),
                          ),
                          space,
                          AppRaisedButton(
                            onPressed: (context) {
                              bloc.handleClick(context);
                            },
                            isLoading: state.isLoading,
                            text: 'Update Password',
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
