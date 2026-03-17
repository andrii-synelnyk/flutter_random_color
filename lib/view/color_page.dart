import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_random_color/cubit/color_cubit.dart';
import 'package:flutter_random_color/view/color_view.dart';

/// Page that provides the [ColorCubit] to the widget tree
class ColorPage extends StatelessWidget {
  /// Creates the color page
  const ColorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ColorCubit(),
      child: const ColorView(),
    );
  }
}
