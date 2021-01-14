import 'package:avs/utils/styles.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final double radius;
  final String imageUrl;

  const ProfileImage({this.radius, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: AppColors.primaryColor[50],
      child: CircleAvatar(
        radius: radius * 0.9,
        backgroundImage: imageUrl == null
            ? AssetImage('assets/avatar.png')
            : NetworkImage(imageUrl),
      ),
    );
  }
}
