import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lms_project/utils/loading_screen/loading_screen.dart';

import '../../main.dart';
import 'model/image_type_model.dart';

export 'model/image_type_model.dart';

class CustomSquareImage extends StatelessWidget {
  const CustomSquareImage(
      {super.key,
      required this.imageType,
      this.imageName,
      this.imageUrl,
      this.tag,
      this.width,
      this.boxFit,
      this.color,
      this.disableExpandedView,
      this.height,
      this.svgBackground});

  final ImageTypeModel imageType;
  final String? imageName;
  final String? imageUrl;
  final String? tag;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit? boxFit;
  final bool? disableExpandedView;
  final Color? svgBackground;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(appSizeConstants.radius_8),
      child: imageType == ImageTypeModel.file
          ? Image.file(
              width: width,
              height: width,
              fit: BoxFit.fill,
              File(imageUrl ?? ""),
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  width: width,
                  height: width,
                  imageData.noDataImage,
                  fit: boxFit ?? BoxFit.fill,
                );
              },
            )
          : imageType == ImageTypeModel.network
              ? Image.network(
                  width: width,
                  height: height,
                  fit: BoxFit.fill,
                  imageUrl ?? "",
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress != null) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return child;
                    }
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      height: height,
                      width: width,
                      imageData.noDataImage,
                      fit: BoxFit.fill,
                    );
                  },
                )
              : const SizedBox(),
    );
  }
}
