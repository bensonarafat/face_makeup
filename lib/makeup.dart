import 'dart:io';
import 'dart:typed_data';

import 'package:face_makeup/face_detector_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image/image.dart' as img;
import 'dart:ui' as ui;

class Makeup extends StatefulWidget {
  final String imagepath;
  const Makeup({
    super.key,
    required this.imagepath,
  });

  @override
  State<Makeup> createState() => _MakeupState();
}

class _MakeupState extends State<Makeup> {
  late FaceDetector faceDetector;

  CustomPaint? customPaint;
  late InputImage inputImage;

  bool selected = false;
  bool isLips = false;
  bool isEyeslashes = false;
  bool isFace = false;
  bool isEyebrow = false;

  @override
  void initState() {
    // resize image
    resizeImage(File(widget.imagepath));
    inputImage = InputImage.fromFilePath(
      widget.imagepath,
    );
    final options = FaceDetectorOptions(
      enableContours: true,
      enableLandmarks: true,
      performanceMode: FaceDetectorMode.accurate,
    );
    faceDetector = FaceDetector(options: options);

    super.initState();
  }

  @override
  void dispose() {
    faceDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "Apply Makeup",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(
          bottom: 10,
        ),
        child: customPaint ??
            Image.file(
              File(widget.imagepath),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
      ),
      bottomSheet: Container(
        height: MediaQuery.of(context).size.height / 8,
        color: Colors.white,
        child:
            LayoutBuilder(builder: (BuildContext context, BoxConstraints box) {
          if (!selected) {
            return topLevel(box);
          } else {
            if (isLips) {
              return lipsCategory(box);
            } else if (isEyeslashes) {
              return eyeLashesCategory(box);
            } else if (isFace) {
              return faceCategory(box);
            } else if (isEyebrow) {
              return eyebrowCategory(box);
            } else {
              return Container();
            }
          }
        }),
      ),
    );
  }

  Widget lipsCategory(BoxConstraints box) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        InkWell(
          onTap: () => reset(),
          child: Container(
            padding: const EdgeInsets.only(
              bottom: 5,
              top: 5,
              left: 5,
            ),
            width: box.maxWidth / 8,
            child: Row(
              children: const [
                Icon(
                  Icons.arrow_back_ios,
                  size: 40,
                ),
              ],
            ),
          ),
        ),
        const VerticalDivider(
          thickness: 1.5,
        ),
        InkWell(
          onTap: () async {
            await makeupFace({
              "type": "lips",
              "color": const Color(0xFFB73E3E),
            });
          },
          child: Container(
            width: box.maxWidth / 4,
            padding: const EdgeInsets.only(
              bottom: 5,
              top: 5,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFB73E3E),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  width: box.maxWidth / 6,
                  height: box.maxWidth / 6,
                ),
              ],
            ),
          ),
        ),
        const VerticalDivider(
          thickness: 1.5,
        ),
        InkWell(
          onTap: () async {
            await makeupFace({
              "type": "lips",
              "color": const Color(0xFFDD5353),
            });
          },
          child: Container(
            width: box.maxWidth / 4,
            padding: const EdgeInsets.only(
              bottom: 5,
              top: 5,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFDD5353),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  width: box.maxWidth / 6,
                  height: box.maxWidth / 6,
                ),
              ],
            ),
          ),
        ),
        const VerticalDivider(
          thickness: 1.5,
        ),
        InkWell(
          onTap: () async {
            await makeupFace({
              "type": "lips",
              "color": const Color(0xFFFF74B1),
            });
          },
          child: Container(
            width: box.maxWidth / 4,
            padding: const EdgeInsets.only(
              bottom: 5,
              top: 5,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF74B1),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  width: box.maxWidth / 6,
                  height: box.maxWidth / 6,
                ),
              ],
            ),
          ),
        ),
        const VerticalDivider(
          thickness: 1.5,
        ),
        InkWell(
          onTap: () async {
            await makeupFace({
              "type": "lips",
              "color": const Color(0xFFFFA1CF),
            });
          },
          child: Container(
            width: box.maxWidth / 4,
            padding: const EdgeInsets.only(
              bottom: 5,
              top: 5,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFA1CF),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  width: box.maxWidth / 6,
                  height: box.maxWidth / 6,
                ),
              ],
            ),
          ),
        ),
        const VerticalDivider(
          thickness: 1.5,
        ),
        InkWell(
          onTap: () async {
            await makeupFace({
              "type": "lips",
              "color": const Color(0xFF472D2D),
            });
          },
          child: Container(
            width: box.maxWidth / 4,
            padding: const EdgeInsets.only(
              bottom: 5,
              top: 5,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF472D2D),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  width: box.maxWidth / 6,
                  height: box.maxWidth / 6,
                ),
              ],
            ),
          ),
        ),
        const VerticalDivider(
          thickness: 1.5,
        ),
        InkWell(
          onTap: () async {
            await makeupFace({
              "type": "lips",
              "color": const Color(0xFFA77979),
            });
          },
          child: Container(
            width: box.maxWidth / 4,
            padding: const EdgeInsets.only(
              bottom: 5,
              top: 5,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFA77979),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  width: box.maxWidth / 6,
                  height: box.maxWidth / 6,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget faceCategory(BoxConstraints box) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        InkWell(
          onTap: () => reset(),
          child: Container(
            padding: const EdgeInsets.only(
              bottom: 5,
              top: 5,
              left: 5,
            ),
            width: box.maxWidth / 8,
            child: Row(
              children: const [
                Icon(
                  Icons.arrow_back_ios,
                  size: 40,
                ),
              ],
            ),
          ),
        ),
        const VerticalDivider(
          thickness: 1.5,
        ),
      ],
    );
  }

  Widget eyebrowCategory(BoxConstraints box) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        InkWell(
          onTap: () => reset(),
          child: Container(
            padding: const EdgeInsets.only(
              bottom: 5,
              top: 5,
              left: 5,
            ),
            width: box.maxWidth / 8,
            child: Row(
              children: const [
                Icon(
                  Icons.arrow_back_ios,
                  size: 40,
                ),
              ],
            ),
          ),
        ),
        const VerticalDivider(
          thickness: 1.5,
        ),
      ],
    );
  }

  Widget eyeLashesCategory(BoxConstraints box) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        InkWell(
          onTap: () => reset(),
          child: Container(
            padding: const EdgeInsets.only(
              bottom: 5,
              top: 5,
              left: 5,
            ),
            width: box.maxWidth / 8,
            child: Row(
              children: const [
                Icon(
                  Icons.arrow_back_ios,
                  size: 40,
                ),
              ],
            ),
          ),
        ),
        const VerticalDivider(
          thickness: 1.5,
        ),
      ],
    );
  }

  Widget topLevel(BoxConstraints box) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              selected = true;
              isLips = true;
            });
          },
          child: Container(
            padding: const EdgeInsets.only(
              bottom: 5,
              top: 5,
            ),
            width: box.maxWidth / 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/tools/lip.png"),
                const Text(
                  "Lips",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const VerticalDivider(
          thickness: 1.5,
        ),
        InkWell(
          onTap: () {
            setState(() {
              selected = true;
              isEyeslashes = true;
            });
          },
          child: Container(
            width: box.maxWidth / 4,
            padding: const EdgeInsets.only(
              bottom: 5,
              top: 5,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/images/tools/eyelashes.png"),
                const Text(
                  "Eyelashes",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const VerticalDivider(
          thickness: 1.5,
        ),
        InkWell(
          onTap: () {
            setState(() {
              selected = true;
              isFace = true;
            });
          },
          child: Container(
            width: box.maxWidth / 4,
            padding: const EdgeInsets.only(
              bottom: 5,
              top: 5,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/images/tools/face.png"),
                const Text(
                  "Face",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const VerticalDivider(
          thickness: 1.5,
        ),
        InkWell(
          onTap: () {
            setState(() {
              selected = true;
              isEyebrow = true;
            });
          },
          child: Container(
            width: box.maxWidth / 4,
            padding: const EdgeInsets.only(
              bottom: 5,
              top: 5,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/images/tools/eyebrow.png"),
                const Text(
                  "Eyebrow",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void reset() {
    setState(() {
      selected = false;
      isLips = false;
      isEyeslashes = false;
      isFace = false;
      isEyebrow = false;
    });
  }

  void resizeImage(File file) async {
    // final image = img.decodeImage(file.readAsBytesSync())!;
    // // Resize the image to a 120x? thumbnail (maintaining the aspect ratio).
    // final thumbnail = img.copyResize(image, width: 120);
    // // Save the thumbnail as a PNG.
    // File('thumbnail.png').writeAsBytesSync(img.encodePng(thumbnail));
    ui.Image? image_ = await getUiImage2(file, 900, 400);
    // if (image_ != null) {
    //   Uint8List newBytes = image_.getBytes();
    //   final File saveFile = File.fromRawPath(newBytes);
    //   var imageFile = File("newimage.jpg");
    //   var sink = imageFile.openWrite();
    //   sink.write(newBytes);
    //   await sink.flush();
    //   await sink.close();

    //   print("Image width ${image_.width} ${image_.height}");
    // }

    print("Converted image here -> ${image_}");
    // print(File("thumbnail.png"));
  }

  Future<ui.Image?> getUiImage2(File file, int height, int width) async {
    final bytes = await file.readAsBytes();
    final assetImageByteData = bytes.buffer.asByteData();
    final codec = await ui.instantiateImageCodec(
      assetImageByteData.buffer.asUint8List(),
      targetHeight: height,
      targetWidth: width,
    );
    final image = (await codec.getNextFrame()).image;
    return image;
  }

  Future<void> makeupFace(Map<String, dynamic> makeup) async {
    final List<Face> faces = await faceDetector.processImage(inputImage);
    final painter = FaceDetectorPainter(faces, makeup);
    setState(() {
      customPaint = CustomPaint(
        foregroundPainter: painter,
        child: Image.file(
          File(widget.imagepath),
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      );
    });
  }
}
