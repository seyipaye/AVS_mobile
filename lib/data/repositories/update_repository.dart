import 'package:avs/data/providers/update_provider.dart';
import 'package:flutter/material.dart';

class UpdateRepository {
  final UpdateProvider provider;

  UpdateRepository(this.provider);

  Future<void> updatePassword(
      {@required String oldPassword, @required String newPassword}) async {
    return await provider.updatePassword(
        oldPassword: oldPassword, newPassword: newPassword);
  }
}
