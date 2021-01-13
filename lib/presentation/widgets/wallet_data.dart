import 'package:avs/utils/constants.dart';
import 'package:flutter/material.dart';

class WalletInfo extends StatelessWidget {
  final String walletBalance;

  const WalletInfo({@required this.walletBalance});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          walletBalance,
          style: kBoldTextStyle(context),
        ),
        Text('Wallet')
      ],
    );
  }
}
