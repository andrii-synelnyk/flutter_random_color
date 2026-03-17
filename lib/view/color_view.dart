import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_random_color/cubit/color_cubit.dart';
import 'package:flutter_random_color/cubit/color_state.dart';
import 'package:flutter_random_color/view/settings_dialog.dart';

const double _rgbTextFontSize = 24;
const double _settingsIconSize = 48;

/// Main view of the application that displays the current color
class ColorView extends StatelessWidget {
  /// Creates the color view
  const ColorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorCubit, ColorState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: state.backgroundColor,
          body: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: context.read<ColorCubit>().changeColor,
            child: SafeArea(
              child: Stack(
                children: [
                  const Align(
                    alignment: .topLeft,
                    child: _SettingsButton(),
                  ),
                  const Center(child: Text('Hello there')),
                  Align(
                    alignment: .bottomCenter,
                    child: Text(
                      'RGB(${state.currentRed}, '
                      '${state.currentGreen}, '
                      '${state.currentBlue})',
                      style: const TextStyle(fontSize: _rgbTextFontSize),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SettingsButton extends StatelessWidget {
  const _SettingsButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.settings, size: _settingsIconSize),
      onPressed: () => showDialog<void>(
        context: context,
        builder: (_) => BlocProvider.value(
          value: context.read<ColorCubit>(),
          child: const SettingsDialog(),
        ),
      ),
    );
  }
}
