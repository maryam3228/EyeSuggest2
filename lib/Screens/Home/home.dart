import 'dart:io';

// import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_vision/google_ml_vision.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  final String? title;

  const HomePage({
    Key? key,
    @required this.title,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _imageFile;
  List<Face>? _faces;

  // CameraController? _camera;
  // bool _cameraInitialized = false;
  // CameraImage? _savedImage;

  // void _initializeCamera() async {
  //   // Get list of cameras of the device
  //   List<CameraDescription> cameras = await availableCameras();
  //   // Create the CameraController
  //   _camera = CameraController(cameras[1], ResolutionPreset.veryHigh);
  //   // Initialize the CameraController
  //   _camera!.initialize().then((_) async {
  //     // Start ImageStream
  //     await _camera!
  //         .startImageStream((CameraImage image) => _processCameraImage(image));
  //     setState(() {
  //       _cameraInitialized = true;
  //     });
  //   });
  // }

  // void _processCameraImage(CameraImage image) async {
  //   setState(() {
  //     _savedImage = image;
  //   });
  // }

  void _getImageAndDetectFaces() async {
    // ignore: invalid_use_of_visible_for_testing_member
    final imageFile = await ImagePicker.platform.pickImage(
      source: ImageSource.gallery,
    );
    final image = GoogleVisionImage.fromFile(File(imageFile!.path));
    final faceDetector = GoogleVision.instance.faceDetector(
      const FaceDetectorOptions(
        mode: FaceDetectorMode.accurate,
        enableClassification: true,
        enableContours: true,
        enableLandmarks: true,
        enableTracking: true,
      ),
    );
    List<Face> faces = await faceDetector.processImage(image);
    if (mounted) {
      setState(() {
        _imageFile = File(imageFile.path);
        _faces = faces;
      });
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _initializeCamera();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Eye Suggest'),
  //     ),
  //     body: Center(
  //       child: (_cameraInitialized)
  //           ? CameraPreview(_camera!)
  //           : const CircularProgressIndicator(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title!,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: _imageFile != null && _faces != null
            ? ImageAndFaces(
                faces: _faces!,
                imageFile: _imageFile!,
              )
            : const Center(
                child: Text('Select an image'),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImageAndDetectFaces,
        child: const Icon(
          Icons.camera_alt_rounded,
        ),
      ),
    );
  }
}

class ImageAndFaces extends StatelessWidget {
  final File imageFile;
  final List<Face> faces;

  const ImageAndFaces({
    Key? key,
    required this.faces,
    required this.imageFile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
              child: Image.file(
                imageFile,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(
              children: faces
                  .map<Widget>(
                    (f) => FaceCoordinates(
                      face: f,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class FaceCoordinates extends StatelessWidget {
  final Face face;
  const FaceCoordinates({
    Key? key,
    required this.face,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pos = face.boundingBox;
    final leftEye = face.getLandmark(FaceLandmarkType.leftEye);
    final rightEye = face.getLandmark(FaceLandmarkType.rightEye);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: ListTile(
          leading: Text(
            '${pos.top}, ${pos.left}, ${pos.bottom}, ${pos.right}',
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
          title: Text(
            """
            leftEyeOpenProbability: ${face.leftEyeOpenProbability}
            rightEyeOpenProbability: ${face.rightEyeOpenProbability}
            smilingProbability: ${face.smilingProbability}
            trackingId: ${face.trackingId}
            leftEye: ${leftEye != null ? leftEye.position : 0}
            rightEye: ${rightEye != null ? rightEye.position : 0}
            """,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
