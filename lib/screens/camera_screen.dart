import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:whatsapp/screens/camera_view.dart';

List<CameraDescription>? cameras;

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _cameraController;
  Future<void>? cameravalue;

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
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.flash_off,
                            color: Colors.white,
                            size: 29,
                          )),
                      IconButton(
                          onPressed: () {
                            takePhoto(context);
                          },
                          icon: const Icon(
                            Icons.panorama_fish_eye,
                            color: Colors.white,
                            size: 70,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.flip_camera_ios,
                            color: Colors.white,
                            size: 29,
                          )),
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
    final path =
        join((await getTemporaryDirectory()).path, "${DateTime.now()}.png");
    await _cameraController!.takePicture();

    navigator.push(
        MaterialPageRoute(builder: (builder) => const CameraViewScreen()));
  }
}
