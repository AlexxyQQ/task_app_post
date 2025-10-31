import 'package:flutter/material.dart';

class AppPopScope extends StatelessWidget {
  AppPopScope({required this.child, super.key, this.onPop});
  final Widget child;
  final Future Function([Object? result])? onPop;
  final ValueNotifier<bool> canPop = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: canPop,
      builder: (_, __) => PopScope(
        onPopInvokedWithResult: canPop.value
            ? null
            : (bool value, Object? result) async {
                if (onPop == null) return;
                canPop.value = true;
                await Future.delayed(const Duration(milliseconds: 100));
                await onPop!(result);
                canPop.value = false;
              },
        canPop: canPop.value,
        child: child,
      ),
    );
  }
}
