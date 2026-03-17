import 'dart:ui';

import 'package:flutter_random_color/color_constants.dart';

/// Immutable state that stores the current RGB color and channel ranges
final class ColorState {
  /// Current green value
  final int currentRed;

  /// Current green value
  final int currentGreen;

  /// Current blue value
  final int currentBlue;

  /// Red channel range
  final List<int> redRange;

  /// Green channel range
  final List<int> greenRange;

  /// Blue channel range
  final List<int> blueRange;

  /// Background color created from the current RGB values
  Color get backgroundColor => Color.fromARGB(
    alphaValue,
    currentRed,
    currentGreen,
    currentBlue,
  );

  /// Creates [ColorState]
  const ColorState({
    this.currentRed = maxRgbChannelValue,
    this.currentGreen = maxRgbChannelValue,
    this.currentBlue = maxRgbChannelValue,
    this.redRange = const [minRgbChannelValue, maxRgbChannelValue],
    this.greenRange = const [minRgbChannelValue, maxRgbChannelValue],
    this.blueRange = const [minRgbChannelValue, maxRgbChannelValue],
  });

  /// Creates a copy with updated values
  ColorState copyWith({
    int? currentRed,
    int? currentGreen,
    int? currentBlue,
    List<int>? redRange,
    List<int>? greenRange,
    List<int>? blueRange,
  }) {
    return ColorState(
      currentRed: currentRed ?? this.currentRed,
      currentGreen: currentGreen ?? this.currentGreen,
      currentBlue: currentBlue ?? this.currentBlue,
      redRange: redRange ?? this.redRange,
      greenRange: greenRange ?? this.greenRange,
      blueRange: blueRange ?? this.blueRange,
    );
  }
}
