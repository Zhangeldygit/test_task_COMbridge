import 'package:flutter/material.dart';


class UserAvatar extends StatelessWidget {
  const UserAvatar(
    this.url, {
    Key? key,
    this.margin,
    this.border,
    this.radius = 36.0,
  }) : super(key: key);

  final BoxBorder? border;
  final EdgeInsets? margin;
  final double radius;
  final String? url;
  final String noAvatar = 'assets/images/no_avatar.png';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: border,
      ),
      child: CircleAvatar(
        backgroundImage: url == null
            ? AssetImage(noAvatar) as ImageProvider
            : NetworkImage(url!),
        radius: radius,
      ),
    );
  }
}
