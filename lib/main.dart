// ignore_for_file: use_build_context_synchronously

import 'package:camera/camera.dart';
import 'package:face_makeup/makeup.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

List<CameraDescription> cameras = [];
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();
  return runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Face Make up',
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              const Center(
                child: Icon(
                  Icons.image,
                  size: 100,
                ),
              ),
              Builder(builder: (context) {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.black,
                        ),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 10,
                            bottom: 10,
                          ),
                        ),
                      ),
                      onPressed: () async {
                        String? imagepath = await openGallery();
                        if (imagepath != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Makeup(
                                imagepath: imagepath,
                              ),
                            ),
                          );
                        }
                      },
                      child: Text(
                        "Browse Gallery".toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Future<String?> openGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      return image.path;
    }
    return null;
  }
}
