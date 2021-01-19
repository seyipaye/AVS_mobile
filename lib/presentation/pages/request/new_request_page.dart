import 'package:avs/presentation/screens/request_details.dart';
import 'package:avs/presentation/widgets/new_request_item.dart';
import 'package:flutter/material.dart';

class NewRequestPage extends StatelessWidget {
  const NewRequestPage();
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      physics: BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return NewRequestItem(
          firstName: 'Jude',
          lastName: 'Severin',
          verificationNumber: '0000000123',
          status: 'COMPLETED',
          streetAddress: 'No 13 Adeola Adekunmi Street',
          lga: "Ibeji-Lekki",
          state: 'Lagos State',
          imageUrl: 'https://i.pravatar.cc/100',
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => RequestDetailsScreen(
                  imageUrl: 'https://i.pravatar.cc/400',
                  firstName: 'Jude',
                ),
              ),
            );
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: 20),
    );
  }
}
