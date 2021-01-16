import 'package:avs/presentation/widgets/input/request_status.dart';
import 'package:avs/utils/styles.dart';
import 'package:flutter/material.dart';

// Todo: Compare with NewRequestItem
class RequestItem extends StatelessWidget {
  final String verificationNumber;
  final String status;
  final String name;
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

  RequestItem(
      {this.verificationNumber,
      this.status,
      this.name,
      this.streetAddress,
      this.lga,
      this.state});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipPath(
        clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(color: statusCode[status], width: 8))),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      verificationNumber,
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    RequestStatus(
                      status: status,
                      color: statusCode[status],
                    )
                  ],
                ),
                Text(
                  streetAddress,
                  style: TextStyle(fontSize: 18),
                ),
                Text(lga, style: TextStyle(fontSize: 18)),
                Text(state, style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
