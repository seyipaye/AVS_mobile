import 'package:avs/presentation/widgets/loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewScreen extends StatelessWidget {
  final String url;
  final String title;
  final String heroTag;

  PhotoViewScreen(this.url, {this.title, this.heroTag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          title ?? '',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        child: CachedNetworkImage(
          imageUrl: url,
          imageBuilder: (context, imageProvider) => PhotoView(
            imageProvider: imageProvider,
            heroAttributes: PhotoViewHeroAttributes(tag: heroTag),
          ),
          placeholder: (context, url) =>
              Center(child: LoadingIndicator(radius: 20)),
          errorWidget: (context, url, error) => Icon(Icons.error),
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
