import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  final String notificationText;

  NotificationTile(this.notificationText);

  @override
  build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(2)),
            boxShadow: [BoxShadow(blurRadius: 4, color: Colors.grey)],
          ),
          child: ListTile(
            title: Text(notificationText),
          ),
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}
