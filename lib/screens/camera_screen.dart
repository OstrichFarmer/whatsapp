import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/screens/camera_view.dart';
import 'package:whatsapp/screens/video_view.dart';

List<CameraDescription>? cameras;

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _cameraController;
  Future<void>? cameravalue;
  bool isRecording = false;
  bool flash = false;
  bool isCameraFront = true;
  double transform = 0;

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(cameras![0], ResolutionPreset.high);
    cameravalue = _cameraController!.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _cameraController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          FutureBuilder(
              future: cameravalue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_cameraController!);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          Positioned(
            bottom: 0,
            child: Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              flash = !flash;
                            });
                            flash
                                ? _cameraController!
                                    .setFlashMode(FlashMode.torch)
                                : _cameraController!
                                    .setFlashMode(FlashMode.off);
                          },
                          icon: Icon(
                            flash ? Icons.flash_on : Icons.flash_off,
                            color: Colors.white,
                            size: 29,
                          )),
                      GestureDetector(
                        onLongPress: () async {
                          await _cameraController!.startVideoRecording();
                          setState(() {
                            isRecording = true;
                          });
                        },
                        onLongPressUp: () async {
                          final navigator = Navigator.of(context);
                          await _cameraController!.stopVideoRecording().then(
                              (videoPath) => navigator.push(MaterialPageRoute(
                                  builder: (builder) =>
                                      VideoViewScreen(path: videoPath.path))));
                          setState(() {
                            isRecording = false;
                          });
                        },
                        onTap: () {
                          if (!isRecording) {
                            takePhoto(context);
                          }
                        },
                        child: isRecording
                            ? const Icon(
                                Icons.radio_button_on,
                                color: Colors.red,
                                size: 80,
                              )
                            : const Icon(
                                Icons.panorama_fish_eye,
                                color: Colors.white,
                                size: 70,
                              ),
                      ),
                      Transform.rotate(
                        angle: transform,
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                transform = transform + pi;
                                isCameraFront = !isCameraFront;
                              });
                              int cameraPosition = isCameraFront ? 1 : 0;
                              _cameraController = CameraController(
                                  cameras![cameraPosition],
                                  ResolutionPreset.high);
                              cameravalue = _cameraController!.initialize();
                            },
                            icon: const Icon(
                              Icons.flip_camera_ios,
                              color: Colors.white,
                              size: 29,
                            )),
                      ),
                    ],
                  ),
                  const Text(
                    "Hold for video, tap for photo",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void takePhoto(BuildContext context) async {
    final navigator = Navigator.of(context);
    // final path =
    //     join((await getTemporaryDirectory()).path, "${DateTime.now()}.png");
    await _cameraController!
        .takePicture()
        .then((path) => navigator.push(MaterialPageRoute(
            builder: (builder) => CameraViewScreen(
                  path: path.path,
                ))));
  }
}
