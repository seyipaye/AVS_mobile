import 'package:avs/presentation/screens/photo_view_screen.dart';
import 'package:avs/presentation/widgets/avatar_image.dart';
import 'package:avs/presentation/widgets/input/app_text_form_field.dart';
import 'package:flutter/material.dart';

class RequestDetailsScreen extends StatelessWidget {
  final String imageUrl;
  final String firstName;

  const RequestDetailsScreen({Key key, this.imageUrl, this.firstName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Request Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
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
            _buildRow('Name', value: 'Jude Severing'),
            _buildRow('Name', value: 'Jude Severing'),
            _buildRow('Name', value: 'Jude Severing'),
            _buildRow('Name', value: 'Jude Severing'),
            _buildRow('Name', value: 'Jude Severing'),
            _buildRow('Name', value: 'Jude Severing'),
            _buildRow('Name', value: 'Jude Severing'),
            _buildRow('Name', value: 'Jude Severing'),
          ],
        ),
      ),
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
