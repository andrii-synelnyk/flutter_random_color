import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_random_color/cubit/color_cubit.dart';
import 'package:flutter_random_color/cubit/color_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  blocTest<ColorCubit, ColorState>(
    'changeColor respects configured channel ranges',
    build: ColorCubit.new,
    seed: () => const ColorState(
      redRange: [100, 100],
      greenRange: [50, 50],
      blueRange: [20, 20],
    ),
    act: (cubit) => cubit.changeColor(),
    expect: () => [
      isA<ColorState>()
          .having((state) => state.currentRed, 'currentRed', 100)
          .having((state) => state.currentGreen, 'currentGreen', 50)
          .having((state) => state.currentBlue, 'currentBlue', 20)
          .having((state) => state.redRange, 'redRange', [100, 100])
          .having((state) => state.greenRange, 'greenRange', [50, 50])
          .having((state) => state.blueRange, 'blueRange', [20, 20]),
    ],
  );
}
