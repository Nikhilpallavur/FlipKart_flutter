import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class NetWorkImage extends StatefulWidget {
  final String url;
  final BoxFit objectFit;
  final double height;
  final double width;
  const NetWorkImage(
      {super.key,
      required this.url,
      this.objectFit = BoxFit.contain,
      this.height = 160,
      this.width = 120});

  @override
  State<NetWorkImage> createState() => _NetWorkImageState();
}

class _NetWorkImageState extends State<NetWorkImage> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.url,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: imageProvider,
              fit: widget.objectFit,
              alignment: Alignment.topCenter),
        ),
      ),
      placeholder: (BuildContext context, String url) => Container(
        width: widget.height,
        height: widget.width,
        color: const Color.fromARGB(255, 238, 246, 252),
        // child: const BlurHash(hash: 'LEHV6nWB2yk8pyo0adR*.7kCMdnj'),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
