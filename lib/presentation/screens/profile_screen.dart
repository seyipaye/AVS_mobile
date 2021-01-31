import 'package:avs/logic/cubits/authentication_cubit.dart';
import 'package:avs/presentation/widgets/app_card.dart';
import 'package:avs/presentation/widgets/input/app_text_form_field.dart';
import 'package:avs/presentation/widgets/page_title.dart';
import 'package:avs/presentation/widgets/profile_image.dart';
import 'package:avs/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const double cardsPadding = 15;

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AuthenticationCubit>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  color: AppColors.primaryColor[100],
                  height: 190,
                  width: double.infinity,
                ),
                Container(
                  // width: MediaQuery.of(context).size.width/2,
                  child: Column(
                    children: [
                      _profileOption(
                          icon: Icons.edit,
                          text: 'Change Password',
                          onTap: () {}),
                      _profileOption(
                          icon: Icons.payment, text: 'Wallet', onTap: () {}),
                      _profileOption(
                          icon: Icons.power_settings_new_rounded,
                          color: Colors.red,
                          text: 'Log Out',
                          onTap: () {
                            BlocProvider.of<AuthenticationCubit>(context)
                                .logUserOut();
                          }),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: _buildCard(
                child: Column(
                  children: [
                    _buildRow('Full Name',
                        value: '${bloc.user.firstName} ${bloc.user.lastName}'),
                    _buildRow('Mobile', value: bloc.user.mobile),
                    _buildRow(' E-mail', value: bloc.user.email.address),
                    _buildRow('Street Address', value: ''),
                    _buildRow('Local Government', value: ''),
                    _buildRow('State', value: ''),
                    _buildRow('Postal Code', value: ''),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCard({@required String title, Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: cardsPadding),
        AppCard(
          radius: 16.0,
          blurRadius: 16.0,
          color: Colors.white,
          border: Border.all(color: AppColors.stroke, width: .5),
          padding: const EdgeInsets.only(
              right: cardsPadding, left: cardsPadding, bottom: cardsPadding),
          child: child,
        ),
      ],
    );
  }

  Widget _buildRow(String label, {String value}) {
    return AppTextFormField(
      label: label,
      readOnly: true,
      topPadding: 15,
      initialValue: value,
      enableInteractiveSelection: false,
    );
  }
}
