import 'package:cached_network_image/cached_network_image.dart';
import 'package:dail_box/AppUtils.dart/ShimmerEffect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class ImagePreview extends StatefulWidget {
  final String? imagePath;

  const ImagePreview({Key? key, this.imagePath}) : super(key: key);

  @override
  _ImagePreviewState createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      backgroundColor: Colors.black,
      body: Container(
        height: Get.height,
        width: Get.width,
        child: CachedNetworkImage(
          height: Get.height,
          width: Get.width,
          fit: BoxFit.contain,
          imageUrl: '${widget.imagePath}',
          placeholder: (context, url) => SpinKitSquareCircle(
            color: Colors.blue,
            size: 20.0,
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    ));
  }
}
