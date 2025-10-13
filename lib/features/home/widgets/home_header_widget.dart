import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({
    required this.displayName,
    required this.onTap,
    this.profileImage,
    super.key,
  });

  final String displayName;
  final ImageEntity? profileImage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final imageProvider =
        profileImage?.when<ImageProvider>(
          local: AssetImage.new,
          remote: NetworkImage.new,
        ) ??
        const AssetImage('assets/images/profile.png');

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
            backgroundImage: imageProvider,
          ),
        ),
      ],
    );
  }
}
