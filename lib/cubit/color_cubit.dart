import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_random_color/cubit/color_state.dart';

/// Available RGB channels
enum ColorChannel {
  /// Red
  red,

  /// Green
  green,

  /// Blue
  blue
}

/// Cubit that manages the current color and RGB ranges
class ColorCubit extends Cubit<ColorState> {
  /// Creates the color cubit with the default [ColorState]
  ColorCubit() : super(const ColorState());

  final Random _random = Random();

  /// Generates and emits a new random color within the configured ranges
  void changeColor() {
    emit(
      state.copyWith(
        currentRed: _generateValueInRange(state.redRange),
        currentGreen: _generateValueInRange(state.greenRange),
        currentBlue: _generateValueInRange(state.blueRange),
      ),
    );
  }

  /// Updates the selected range for the given [channel]
  void changeChannelRange(ColorChannel channel, double start, double end) {
    final newRange = [start.round(), end.round()];

    switch (channel) {
      case ColorChannel.red:
        emit(state.copyWith(redRange: newRange));
      case ColorChannel.green:
        emit(state.copyWith(greenRange: newRange));
      case ColorChannel.blue:
        emit(state.copyWith(blueRange: newRange));
    }
  }

  int _generateValueInRange(List<int> range) {
    final min = range.first;
    final max = range.last;

    return _random.nextInt(max - min + 1) + min;
  }
}
