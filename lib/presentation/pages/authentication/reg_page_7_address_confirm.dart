import 'package:avs/logic/cubits/address_confirm_cubit.dart';
import 'package:avs/presentation/screens/authentication_screen.dart';
import 'package:avs/presentation/widgets/app_raised_button.dart';
import 'package:avs/presentation/widgets/app_snack_bar.dart';
import 'package:avs/presentation/widgets/auth_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressConfirmPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final PageController controller;
  final userRepository;
  final authenticationCubit;

  AddressConfirmPage(
    this.controller,
    this.authenticationCubit,
    this.userRepository,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddressConfirmCubit(
        userRepository,
        authenticationCubit,
        controller: controller,
      ),
      child: Column(
        children: [
          AuthAppBar(
            title:
                '${authenticationCubit.user?.firstName}, This is the final step, we promise',
            subTitle: 'Please verify your address',
          ),
          SizedBox(height: 20.0),
          // Body
          Expanded(
            child: _buildForm(),
          )
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: BlocConsumer<AddressConfirmCubit, AddressConfirmState>(
        listener: (context, state) {
          final cubit = context.read<AddressConfirmCubit>();

          if (state.hasError) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                AppSnackBar.error(state.errorMessage),
              ).closed.then((value) {
                context.read<AddressConfirmCubit>().dialogClosed();
              });
          }

          if (state.dialog != null) {
            showDialog(
              context: context,
              builder: (_) {
                return state.dialog;
              },
            ).then((value) => cubit.dialogClosed());
          }
        },
        builder: (context, state) {
          final cubit = context.watch<AddressConfirmCubit>();

          //print(state);
          return Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Please stand at the location you previously entered and click the 'Verify Address' button",
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Image.asset('assets/images/verify_address.png'),
                ),
                authSpacer,
                AppRaisedButton(
                  text: 'Verify Address',
                  isLoading: state.isLoading,
                  onPressed: cubit.handleContinue, //nextPage,
                ),
                authSpacer,
              ],
            ),
          );
        },
      ),
    );
  }
}
