import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ViewSignature extends StatelessWidget {
  String url;
  ViewSignature({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Signature"),
      ),
      body: Center(
        child:Container(
          child: CachedNetworkImage(
            placeholder: (context, url) => Center(child: CircularProgressIndicator(color: Colors.black,),),
            imageUrl: url,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
