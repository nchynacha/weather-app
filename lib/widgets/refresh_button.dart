import 'package:flutter/material.dart';
import 'package:today_weather/widgets/constants.dart';

class RefreshButton extends StatelessWidget {
  final bool? isLoading;
  final void Function()? onPressed;

  const RefreshButton({
    super.key,
    this.isLoading = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Visibility(
        visible: isLoading!,
        replacement: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: borderColor, // Background color for the icon
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(
              Icons.refresh,
              color: whiteColor,
            ),
            iconSize: 40,
            tooltip: 'Refresh',
            onPressed: onPressed,
          ),
        ),
        child: const CircularProgressIndicator(
          strokeWidth: 2.0,
          valueColor: AlwaysStoppedAnimation(Colors.white),
        ),
      ),
    );
  }
}
