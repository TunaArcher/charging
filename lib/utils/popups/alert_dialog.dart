import 'package:charging/features/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EvxConfirmDalog {
  static dialogboxConfirmInfo(BuildContext context) {
    final controller = Get.put(ProfileController());
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text('Confirm Update'),
            content: const Text('Update you profile or not?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancel"),
                style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge),
              ),
              TextButton(
                onPressed: () {
                  controller.updateProfile();
                },
                child: Text("OK"),
                style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge),
              ),
            ],
          );
        });
  }

  static dialogboxConfirmChangePassword(BuildContext context) {
    final controller = Get.put(ProfileController());
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text('Confirm Update'),
            content: const Text('Update you password or not?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Close"),
                style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge),
              ),
              TextButton(
                onPressed: () {
                  controller.updatePassword();
                },
                child: Text("OK"),
                style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge),
              ),
            ],
          );
        });
  }

  static dialogboxPassNewNotMatch(BuildContext context) {
    final controller = Get.put(ProfileController());
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Center(
              child: Text(
                'Confirm New Password',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            content: const Text(
              'Confirm New Password Not Matching',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
                style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge),
              ),
            ],
          );
        });
  }
}
