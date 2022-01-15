import 'package:flutter/material.dart';

class ImagePickerDialog extends StatelessWidget {
  final void Function() pickCameraImage;
  final void Function() pickGalleryImage;
  const ImagePickerDialog({
    Key? key,
    required this.pickCameraImage,
    required this.pickGalleryImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                TextButton(
                  onPressed: () {
                    pickCameraImage();
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Camera",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    pickGalleryImage();
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.image,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Gallery",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
