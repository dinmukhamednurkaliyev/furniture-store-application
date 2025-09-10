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
        final authenticatedUser = user!;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome,',
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
                context.spacingValues.verticalXSmall,
                Text(
                  authenticatedUser.name!,
                  style: context.textTheme.titleLarge,
                ),
              ],
            ),
            InkWell(
              onTap: onTap,
              child: CircleAvatar(
                radius: context.spacingValues.xxlarge,
                backgroundImage: authenticatedUser.profileImage != null
                    ? NetworkImage(authenticatedUser.profileImage!)
                    : const AssetImage('assets/images/profile.png')
                          as ImageProvider,
              ),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }
}
