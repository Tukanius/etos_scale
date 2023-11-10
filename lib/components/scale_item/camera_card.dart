import 'package:etos_scale_windows/contants/colors.dart';
import 'package:etos_scale_windows/models/camera.dart';
import 'package:flutter/material.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:media_kit/media_kit.dart';

class CameraCard extends StatefulWidget {
  final int? index;
  final Camera? camera;

  const CameraCard({
    super.key,
    this.index,
    this.camera,
  });

  @override
  State<CameraCard> createState() => _CameraCardState();
}

class _CameraCardState extends State<CameraCard> {
  late final player = Player();
  late final controller = VideoController(player);
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    setState(() {
      isLoading == false;
    });
    print('=======CAMERA=======');
    print(widget.camera?.name);
    print('=======CAMERA=======');

    player.open(
        Media(
          'rtsp://${widget.camera?.username}:${widget.camera?.password}@${widget.camera?.ip}:${widget.camera?.port}',
          // 'rtsp://admin:set@12345@10.4.51.5:554',
        ),
        play: true);
    setState(() {
      isLoading == true;
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

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
      child: isLoading == true
          ? Center(
              child: CircularProgressIndicator(
                color: colorBlue,
              ),
            )
          : Video(controller: controller),
    );
  }
}
