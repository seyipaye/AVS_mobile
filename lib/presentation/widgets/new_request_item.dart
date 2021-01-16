import 'package:avs/presentation/widgets/input/request_status.dart';
import 'package:avs/utils/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'app_card.dart';
import 'loading_indicator.dart';

class NewRequestItem extends StatelessWidget {
  final String verificationNumber;
  final String status;
  final String firstName;
  final String lastName;
  final String streetAddress;
  final String lga;
  final String state;

  final Map statusCode = {
    'PROCESSED': Colors.green[300],
    'ASSIGNED': AppColors.primaryColor,
    'COMPLETED': Colors.green,
    'NOT_PAID': Colors.red[900],
    'NEW': Colors.yellow,
  };

  NewRequestItem(
      {this.verificationNumber,
      this.status,
      this.firstName,
      this.lastName,
      this.streetAddress,
      this.lga,
      this.state});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      height: 120,
      radius: 16.0,
      blurRadius: 16.0,
      color: Colors.white,
      border: Border.all(color: AppColors.stroke, width: .5),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {},
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 14, bottom: 10),
                child: Row(
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: CachedNetworkImage(
                          imageUrl: 'https://i.pravatar.cc/100',
                          placeholder: (context, url) =>
                              Center(child: LoadingIndicator(radius: 20)),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(firstName + ' ' + lastName,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                          Text(
                            streetAddress,
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            softWrap: false,
                            style:
                                TextStyle(color: AppColors.text2, fontSize: 13),
                          ),
                          Text(
                            lga + ', ' + state,
                            softWrap: false,
                            overflow: TextOverflow.fade,
                            style:
                                TextStyle(color: AppColors.text2, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(height: .5),
            SizedBox(
              height: 30,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '№ $verificationNumber',
                    softWrap: false,
                    overflow: TextOverflow.fade,
                    style:
                        TextStyle(color: AppColors.primaryColor, fontSize: 13),
                  ),
                  RequestStatus(
                    status: status,
                    color: statusCode[status],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
