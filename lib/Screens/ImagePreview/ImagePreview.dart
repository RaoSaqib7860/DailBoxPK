import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class ImagePreview extends StatefulWidget {
  final List? listofImage;

  const ImagePreview({Key? key, this.listofImage}) : super(key: key);

  @override
  _ImagePreviewState createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      child: PageView.builder(
        itemBuilder: (c, i) {
          return CachedNetworkImage(
            height: Get.height,
            width: Get.width,
            fit: BoxFit.contain,
            imageUrl: '${widget.listofImage![i]}',
            placeholder: (context, url) => SpinKitSquareCircle(
              color: Colors.blue,
              size: 20.0,
            ),
            errorWidget: (context, url, error) => Image.network(
                'http://dailboxx.websitescare.com/upload/appnoimage.png'),
          );
        },
        itemCount: widget.listofImage!.length,
      )),
    );
  }
}

class SingleImagePreview extends StatefulWidget {
  final String? url;

  const SingleImagePreview({Key? key, this.url}) : super(key: key);

  @override
  _SingleImagePreviewState createState() => _SingleImagePreviewState();
}

class _SingleImagePreviewState extends State<SingleImagePreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CachedNetworkImage(
        height: Get.height,
        width: Get.width,
        fit: BoxFit.contain,
        imageUrl: '${widget.url}',
        placeholder: (context, url) => SpinKitSquareCircle(
          color: Colors.blue,
          size: 20.0,
        ),
        errorWidget: (context, url, error) => Image.network(
            'http://dailboxx.websitescare.com/upload/appnoimage.png'),
      ),
    );
  }
}
