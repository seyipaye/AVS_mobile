import 'package:avs/data/models/request.dart';
import 'package:avs/presentation/screens/photo_view_screen.dart';
import 'package:avs/presentation/widgets/app_card.dart';
import 'package:avs/presentation/widgets/app_raised_button.dart';
import 'package:avs/presentation/widgets/avatar_image.dart';
import 'package:avs/presentation/widgets/input/app_text_form_field.dart';
import 'package:avs/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

const double cardsPadding = 15;

class RequestDetailsScreen extends StatelessWidget {
  // final String imageUrl;
  // final String firstName;

  const RequestDetailsScreen();
  @override
  Widget build(BuildContext context) {
    final Request request = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Details'),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            SizedBox(
              height: 200,
              child: InkWell(
                child: Hero(
                    tag: request.contact.firstName,
                    child: AvatarImage('https://i.pravatar.cc/400')),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PhotoViewScreen(
                        ' https://i.pravatar.cc/400',
                        heroTag: request.contact.firstName,
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
                      value: request.contact.firstName +
                          ' ' +
                          request.contact.lastName),
                  _buildRow('Gender', value: request.contact.gender),
                ],
              ),
            ),
            SizedBox(height: 30),
            _buildCard(
              title: 'Address Information',
              child: Column(
                children: [
                  _buildRow('Address', value: request.address.streetAddress),
                  _buildRow('State', value: request.address.state),
                  _buildRow('Local Government:', value: request.address.lga),
                  _buildRow('Postal Code', value: request.address.postalCode),
                  // _buildRow('Landmark', value: 'Oyo'),
                  _buildRow('Latitude',
                      value: request.address.geo.coordinates[0].toString()),
                  _buildRow('Longitude',
                      value: request.address.geo.coordinates[1].toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: AppRaisedButton(
              //isLoading: isLoading,
              elevation: 0,
              shrink: true,
              fontSize: 14,
              backgroundColor: Colors.redAccent,
              text: 'Reject',
              prefixIcon: Icon(LineIcons.thumbs_down),
              onPressed: (context) {},
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: AppRaisedButton(
              //isLoading: isLoading,
              elevation: 0,
              shrink: true,
              fontSize: 14,
              text: 'Accept',
              prefixIcon: Icon(LineIcons.thumbs_up),
              onPressed: (context) {},
            ),
          ),
        ],
      ),
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
