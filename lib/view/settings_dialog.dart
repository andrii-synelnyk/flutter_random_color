import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_random_color/color_constants.dart';
import 'package:flutter_random_color/cubit/color_cubit.dart';
import 'package:flutter_random_color/cubit/color_state.dart';

/// Dialog that allows the user to configure RGB channel ranges
class SettingsDialog extends StatelessWidget {
  /// Creates the settings dialog
  const SettingsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final sliderTheme = SliderTheme.of(context).copyWith(
      showValueIndicator: ShowValueIndicator.onDrag,
    );

    return AlertDialog(
      title: const Text('RGB Range Settings'),
      content: SliderTheme(
        data: sliderTheme,
        child: BlocBuilder<ColorCubit, ColorState>(
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildRangeSlider(
                  context: context,
                  range: state.redRange,
                  color: Colors.red,
                  channel: ColorChannel.red,
                ),
                _buildRangeSlider(
                  context: context,
                  range: state.greenRange,
                  color: Colors.green,
                  channel: ColorChannel.green,
                ),
                _buildRangeSlider(
                  context: context,
                  range: state.blueRange,
                  color: Colors.blue,
                  channel: ColorChannel.blue,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildRangeSlider({
    required BuildContext context,
    required List<int> range,
    required Color color,
    required ColorChannel channel,
  }) {
    return RangeSlider(
      values: RangeValues(
        range.first.toDouble(),
        range.last.toDouble(),
      ),
      min: minRgbChannelValue.toDouble(),
      max: maxRgbChannelValue.toDouble(),
      labels: RangeLabels(
        '${range.first}',
        '${range.last}',
      ),
      activeColor: color,
      onChanged: (values) => context.read<ColorCubit>().changeChannelRange(
        channel,
        values.start,
        values.end,
      ),
    );
  }
}
