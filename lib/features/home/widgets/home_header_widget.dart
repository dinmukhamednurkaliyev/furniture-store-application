import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';

class HomeHeaderWidget extends ConsumerWidget {
  const HomeHeaderWidget({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authenticationState = ref.watch(authenticationNotifierProvider);

    return authenticationState.when(
      data: (user) {
        final displayName = user?.name ?? 'Guest';
        final profileImage = user?.profileImage;

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
                backgroundImage: profileImage != null
                    ? NetworkImage(profileImage)
                    : const AssetImage('assets/images/profile.png')
                          as ImageProvider,
              ),
            ),
          ],
        );
      },
      error: (error, stackTrace) => Text('Error: $error'),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
