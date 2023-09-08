import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.black,
          size: 30,
        ),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none_outlined,
              color: Colors.black,
              size: 38,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
