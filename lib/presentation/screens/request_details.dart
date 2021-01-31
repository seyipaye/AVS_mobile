import 'package:avs/data/models/request.dart';
import 'package:avs/logic/cubits/authentication_cubit.dart';
import 'package:avs/logic/cubits/requests/request_details_cubit.dart';
import 'package:avs/presentation/screens/photo_view_screen.dart';
import 'package:avs/presentation/widgets/app_card.dart';
import 'package:avs/presentation/widgets/app_raised_button.dart';
import 'package:avs/presentation/widgets/avatar_image.dart';
import 'package:avs/presentation/screens/process_request_screen.dart';
import 'package:avs/presentation/widgets/input/app_text_form_field.dart';
import 'package:avs/utils/constants.dart';
import 'package:avs/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:page_transition/page_transition.dart';

const double cardsPadding = 15;

class RequestDetailsScreen extends StatelessWidget {
  const RequestDetailsScreen();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RequestDetailsCubit(
        context.read<AuthenticationCubit>(),
        ModalRoute.of(context).settings.arguments,
      ),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Request Details'),
          ),
          bottomNavigationBar: _buildBottomNavBar(context),
          body: BlocConsumer<RequestDetailsCubit, RequestDetailsState>(
            listener: (context, state) {
              if (state.snackBar != null) {
                Scaffold.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    state.snackBar,
                  )
                      .closed
                      .then(context.read<RequestDetailsCubit>().clearOverlays);
              }
              if (state.dialog != null) {
                showDialog(
                  context: context,
                  builder: (_) {
                    return state.dialog;
                  },
                ).then(context.read<RequestDetailsCubit>().clearOverlays);
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    SizedBox(
                      height: 200,
                      child: InkWell(
                        child: Hero(
                            tag: state.request.contact.firstName,
                            child: AvatarImage('https://i.pravatar.cc/400')),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PhotoViewScreen(
                                ' https://i.pravatar.cc/400',
                                heroTag: state.request.contact.firstName,
                                title: 'Jude' + ' ' + 'Severin',
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 50),
                    _buildCard(
                      title: 'Personal Information',
                      child: Column(
                        children: [
                          _buildRow('Name',
                              value: state.request.contact.firstName +
                                  ' ' +
                                  state.request.contact.lastName),
                          _buildRow('Gender',
                              value: state.request.contact.gender),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    _buildCard(
                      title: 'Address Information',
                      child: Column(
                        children: [
                          _buildRow('Address',
                              value: state.request.address.streetAddress),
                          _buildRow('State',
                              value: state.request.address.state),
                          _buildRow('Local Government:',
                              value: state.request.address.lga),
                          _buildRow('Postal Code',
                              value: state.request.address.postalCode),
                          // _buildRow('Landmark', value: 'Oyo'),
                          _buildRow('Latitude',
                              value: state.request.address.geo.coordinates[0]
                                  .toString()),
                          _buildRow('Longitude',
                              value: state.request.address.geo.coordinates[1]
                                  .toString()),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      }),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return BlocBuilder<RequestDetailsCubit, RequestDetailsState>(
      builder: (context, state) {
        return Container(
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            child: Request.getStatus(state.request) == RequestStatus.NEW
                ? _buildButtonsForNew(state, context)
                : _buildButtonsForAssigned(state, context));
      },
    );
  }

  Widget _buildButtonsForAssigned(
      RequestDetailsState state, BuildContext context) {
    return AppRaisedButton(
      isLoading: state.isLoading,
      elevation: 0,
      shrink: true,
      fontSize: 14,
      backgroundColor: Colors.green,
      text: 'Process Request',
      onPressed: context.watch<RequestDetailsCubit>().onProcessPressed,
    );
  }

  Row _buildButtonsForNew(RequestDetailsState state, BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppRaisedButton(
            isLoading: state.isLoading,
            elevation: 0,
            shrink: true,
            fontSize: 14,
            backgroundColor: Colors.redAccent,
            text: 'Reject',
            prefixIcon: Icon(LineIcons.thumbs_down),
            onPressed: context.watch<RequestDetailsCubit>().onRejectPressed,
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: AppRaisedButton(
              isLoading: state.isLoading,
              elevation: 0,
              shrink: true,
              fontSize: 14,
              text: 'Accept',
              prefixIcon: Icon(LineIcons.thumbs_up),
              onPressed: context.watch<RequestDetailsCubit>().onAcceptPressed),
        ),
      ],
    );
  }

  Widget _buildCard({@required String title, Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          // Intentionally added space
          ' ' + title,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
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
