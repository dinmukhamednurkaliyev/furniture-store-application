import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({
    required this.displayName,
    required this.onTap,
    this.profileImageUrl,
    super.key,
  });

  final String displayName;
  final String? profileImageUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              style: context.bodyLarge?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
            context.spacingValues.verticalXSmall,
            Text(
              displayName,
              style: context.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        InkWell(
          onTap: onTap,
          customBorder: const CircleBorder(),
          overlayColor: WidgetStateProperty.all(
            context.primaryColor.withValues(alpha: 0.1),
          ),
          child: CircleAvatar(
            radius: context.spacingValues.xxlarge,
            backgroundImage: profileImageUrl != null
                ? NetworkImage(profileImageUrl!)
                : const AssetImage('assets/images/profile.png')
                      as ImageProvider,
          ),
        ),
      ],
    );
  }
}
