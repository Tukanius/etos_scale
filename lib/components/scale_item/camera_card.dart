import 'package:etos_scale_windows/contants/colors.dart';
import 'package:flutter/material.dart';
// import 'package:media_kit_video/media_kit_video.dart';
// import 'package:media_kit/media_kit.dart';

class CameraCard extends StatefulWidget {
  const CameraCard({super.key});

  @override
  State<CameraCard> createState() => _CameraCardState();
}

class _CameraCardState extends State<CameraCard> {
  // late final player = Player();
  // late final controller = VideoController(player);

  // @override
  // void initState() {
  //   super.initState();
  // }

  // @override
  // void dispose() async {
  //   player.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 72) * 0.25,
      height: MediaQuery.of(context).size.width * 0.14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10,
        ),
        color: gray102,
      ),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
