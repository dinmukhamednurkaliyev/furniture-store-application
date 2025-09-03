import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:go_router/go_router.dart';

class ApplicationBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const ApplicationBarWidget({
    super.key,
    this.title,
    this.showBackButton = true,
    this.actions,
    this.backgroundColor = Colors.transparent,
    this.iconColor,
  });
  final String? title;
  final bool showBackButton;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final effectiveIconColor = iconColor ?? context.iconThemeColor;

    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      leading: showBackButton
          ? IconButton(
              onPressed: () {
                if (context.canPop()) {
                  context.pop();
                } else {}
              },
              icon: Icon(
                Icons.arrow_back,
                color: effectiveIconColor,
              ),
            )
          : null,
      title: title != null
          ? Text(
              title!,
              style: TextStyle(
                color: effectiveIconColor,
              ),
            )
          : null,
      actions: actions,

      iconTheme: IconThemeData(color: effectiveIconColor),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
