import 'package:avs/data/api_responses/location_response.dart';
import 'package:avs/data/providers/avs_api_client.dart';
import 'package:avs/logic/cubits/address_info_cubit.dart';
import 'package:avs/presentation/screens/authentication_screen.dart';
import 'package:avs/presentation/widgets/app_raised_button.dart';
import 'package:avs/presentation/widgets/app_snack_bar.dart';
import 'package:avs/presentation/widgets/auth_header.dart';
import 'package:avs/presentation/widgets/input/address_field.dart';
import 'package:avs/presentation/widgets/input/app_dropdown_button.dart';
import 'package:avs/presentation/widgets/input/app_text_form_field.dart';
import 'package:avs/presentation/widgets/input/async_dropdown_button.dart';
import 'package:avs/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          if (state.snackBar != null) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(state.snackBar)
                  .closed
                  .then(context.read<AddressInfoCubit>().clearOverlays);
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
                AddressField(
                  label: 'Street Address',
                  key: Key(state.streetAddress ?? '...'),
                  initialValue: state.streetAddress,
                  validator: Validator.isAddress,
                  onTap: cubit.onStreetAddressTap,
                ),
                authSpacer,
                AsyncDropDownButton<AddressResponseState>(
                  label: 'State',
                  initialHint: "Select State",
                  value: state.selectedAddressState,
                  itemBuilder: (item) => DropdownMenuItem(
                    value: item,
                    child: Text(item.name),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a valid State';
                    }
                    return null;
                  },
                  itemsUrl: baseUrl + '/utils/states',
                  fromMapFunction: AddressResponse.fromMap,
                  onChanged: (AddressResponseState value) {
                    cubit.addressStateChanged(value);
                    FocusScope.of(context).requestFocus(new FocusNode());
                  },
                ),
                authSpacer,
                AppDropDownButton<AddressResponseLocalGovernment>(
                  label: 'Local Government',
                  value: state.selectedAddressLocalGovernment,
                  hint: state.selectedAddressState == null
                      ? 'Select a state first'
                      : 'Select Local Government',
                  validator: (value) {
                    if (value == null) {
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
                    FocusScope.of(context).requestFocus(new FocusNode());
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
