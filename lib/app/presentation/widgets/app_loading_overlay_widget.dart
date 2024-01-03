import 'package:flutter/material.dart';
import 'package:testing_user_list_with_api/app/core/theme/app_colors.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    super.key,
    required this.child,
    this.isLoading,
  });
  final Widget child;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) => isLoading!
      ? Center(
          child: CircularProgressIndicator(
          color: primaryColor,
        ))
      : child;
}
