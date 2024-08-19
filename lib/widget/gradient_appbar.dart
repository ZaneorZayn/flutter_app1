import 'package:flutter/material.dart';
import 'package:mobile_app/core/gradient_color.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Gradient AppBar',
      style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Theme.of(context).colorScheme.secondary),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: Theme.of(context).customGradient,
        ),
      ),
    );
  }
}
