import 'package:avs/data/api_responses/location_response.dart';
import 'package:avs/data/providers/avs_api_client.dart';
import 'package:avs/logic/cubits/address_info_cubit.dart';
import 'package:avs/logic/cubits/user_info_cubit.dart';
import 'package:avs/presentation/screens/authentication_screen.dart';
import 'package:avs/presentation/widgets/app_raised_button.dart';
import 'package:avs/presentation/widgets/app_snack_bar.dart';
import 'package:avs/presentation/widgets/auth_header.dart';
import 'package:avs/presentation/widgets/dialogs.dart';
import 'package:avs/presentation/widgets/input/app_dropdown_button.dart';
import 'package:avs/presentation/widgets/input/app_text_form_field.dart';
import 'package:avs/presentation/widgets/input/async_dropdown_button.dart';
import 'package:avs/utils/constants.dart';
import 'package:avs/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';

class AddressInfoPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final PageController controller;
  final userRepository;
  final authenticationCubit;

  AddressInfoPage(
    this.controller,
    this.authenticationCubit,
    this.userRepository,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddressInfoCubit(
        userRepository,
        authenticationCubit,
        controller: controller,
      ),
      child: Column(
        children: [
          AuthAppBar(
            title: 'Almost there, ${authenticationCubit.user?.firstName}',
            subTitle: 'Please provide your address',
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

  SingleChildScrollView _buildForm() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: BlocConsumer<AddressInfoCubit, AddressInfoState>(
        listener: (context, state) {
          if (state.hasError) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                AppSnackBar.error(state.errorMessage),
              );
          }

          if (state.showCompletionDialog) {
            final userInfoCubit = context.read<UserInfoCubit>();

            showDialog(
              context: context,
              builder: (_) {
                return AppDialog(
                  icon: Icon(
                    LineIcons.check_circle,
                    size: 125,
                    color: Colors.lightGreen,
                  ),
                  content:
                      "Well done, ${userInfoCubit.firstName}! You've completed the first stage of the registration process. Complete your profile to start earning money as an Agent",
                  onPositivePressed: userInfoCubit.onPositivePressed,
                  onNegativePressed: userInfoCubit.onNegativePressed,
                );
              },
            );
          }
        },
        builder: (context, state) {
          final cubit = context.watch<AddressInfoCubit>();

          //print(state);
          return Form(
            key: formKey,
            autovalidateMode: state.autovalidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Please enter the address where you currently reside, as this will be used as your base location for receiving verification requests',
                ),
                SizedBox(height: 20),
                AppTextFormField(
                  label: 'Street Address',
                  onSaved: (String val) => cubit.streetAddress = val,
                  validator: Validator.isAddress,
                ),
                authSpacer,
                AsyncDropDownButton<AddressResponseState>(
                  label: 'State',
                  initialHint: "Select State",
                  itemBuilder: (item) => DropdownMenuItem(
                    value: item,
                    child: Text(item.name),
                  ),
                  validator: (value) {
                    if (value != null) {
                      return 'Please select a valid State';
                    }
                    return null;
                  },
                  itemsUrl: baseUrl + '/utils/states',
                  fromMapFunction: AddressResponse.fromMap,
                  onChanged: cubit.addressStateChanged,
                ),
                authSpacer,
                AppDropDownButton<AddressResponseLocalGovernment>(
                  label: 'Local Government',
                  value: state.selectedAddressLocalGovernment,
                  hint: state.selectedAddressState == null
                      ? 'Select a state first'
                      : 'Select Local Government',
                  validator: (value) {
                    if (value != null) {
                      return 'Please select a valid Local Government';
                    }
                    return null;
                  },
                  items: state.selectedAddressState?.locals
                      ?.map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e.name,
                          )))
                      ?.toList(),
                  onChanged: (value) {
                    cubit.addressLocalGovernment = value;
                  },
                ),
                authSpacer,
                AppTextFormField(
                  label: 'Postal code',
                  onSaved: (String val) => cubit.postalCode = val,
                  validator: Validator.isPostalCode,
                  keyboardType: TextInputType.phone,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
                authSpacer,
                AppRaisedButton(
                  text: 'Submit',
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
