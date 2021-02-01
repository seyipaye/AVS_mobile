import 'package:avs/logic/cubits/authentication_cubit.dart';
import 'package:avs/presentation/widgets/app_card.dart';
import 'package:avs/presentation/widgets/input/app_text_form_field.dart';
import 'package:avs/presentation/widgets/page_title.dart';
import 'package:avs/presentation/widgets/profile_image.dart';
import 'package:avs/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const double cardsPadding = 15;

class FullProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AuthenticationCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProfileImage(radius: 60),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[Text('User Name'), Text('AGENT')],
              ),
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
                    _buildRow('Street Address',
                        value: bloc.user.address.streetAddress),
                    _buildRow('Local Government', value: bloc.user.address.lga),
                    _buildRow('State', value: bloc.user.address.state),
                    _buildRow('Postal Code',
                        value: bloc.user.address.postalCode),
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

  Widget _buildCard({Widget child}) {
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
