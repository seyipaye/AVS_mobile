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
  final String imageUrl;
  final String firstName;

  const RequestDetailsScreen({Key key, this.imageUrl, this.firstName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                child: Hero(tag: firstName, child: AvatarImage(imageUrl)),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PhotoViewScreen(
                        imageUrl,
                        heroTag: firstName,
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
                  _buildRow('Name', value: 'Jude Severing'),
                  _buildRow('Gender', value: 'Female'),
                ],
              ),
            ),
            SizedBox(height: 30),
            _buildCard(
              title: 'Address Information',
              child: Column(
                children: [
                  _buildRow('Address', value: '920 Colt Forks'),
                  _buildRow('State', value: 'Oyo'),
                  _buildRow('Local Government:', value: 'Yaba'),
                  _buildRow('Postal Code', value: '538064'),
                  // _buildRow('Landmark', value: 'Oyo'),
                  _buildRow('Latitude', value: '6.5295671'),
                  _buildRow('Longitude', value: '3.29803616'),
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
