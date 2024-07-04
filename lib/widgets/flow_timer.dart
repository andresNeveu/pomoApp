import 'package:flutter/material.dart';

class FlowTimer extends StatelessWidget {
  const FlowTimer({super.key, required this.isActive, required this.handlePlayPause, required this.handleOmit});
  final bool isActive;
  final void Function() handlePlayPause;
  final void Function() handleOmit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
            alignment: Alignment.center,
            child: ElevatedButton.icon(
                icon: isActive ? const Icon(Icons.pause_circle) : const Icon(Icons.play_circle),
                onPressed: handlePlayPause,
                label: Text(isActive ? 'Pause' : 'Play'))),
        Align(
            alignment: Alignment.centerRight,
            child: isActive
                ? ElevatedButton.icon(
                    label: const Text('Skip'), onPressed: handleOmit, icon: const Icon(Icons.skip_next))
                : null)
      ],
    );
  }
}
