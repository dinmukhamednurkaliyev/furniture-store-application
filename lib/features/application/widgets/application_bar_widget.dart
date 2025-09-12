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
    final canPop = context.canPop();

    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: canPop && showBackButton
          ? IconButton(
              onPressed: () => context.pop(),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.hovered)) {
                      return Colors.black.withValues(alpha: 0.04);
                    }
                    return Colors.transparent;
                  },
                ),
              ),
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
