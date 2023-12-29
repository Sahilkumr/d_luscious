// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreenImageWidget extends StatefulWidget {
  final double height;
  final double width;
  final double? redius;
  final String image;
  const DetailScreenImageWidget({
    Key? key,
    required this.height,
    required this.width,
    this.redius,
    required this.image,
  }) : super(key: key);

  @override
  State<DetailScreenImageWidget> createState() => _CritiqueNetworkImageState();
}

class _CritiqueNetworkImageState extends State<DetailScreenImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          color: Colors.transparent, borderRadius: BorderRadius.circular(15)),
      //backgroundColor: Colors.transparent,
      //  radius: widget.redius,

      child: CachedNetworkImage(
        filterQuality: FilterQuality.low,
        // fit: BoxFit.fill,
        imageBuilder: (context, provider) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.redius ?? 0.0),
              image: DecorationImage(
                image: provider,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        imageUrl: widget.image,
        placeholder: (context, url) => const Center(
          child: CupertinoActivityIndicator(
            radius: 10,
          ),
        ),
        errorWidget: (context, url, error) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.redius ?? 0.0),
          ),
        ),
      ),
    );
  }
}
