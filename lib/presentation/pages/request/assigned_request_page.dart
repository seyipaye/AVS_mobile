import 'package:avs/presentation/widgets/new_request_item.dart';
import 'package:flutter/material.dart';

class AssignedRequestPage extends StatelessWidget {
  const AssignedRequestPage();
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
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: 20),
    );
  }
}
