import 'dart:convert';
import 'dart:developer';

import 'package:bloc_demo/constants/images.dart';
import 'package:bloc_demo/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models.dart/frame_model.dart';

class FrameWidget extends StatelessWidget {
  const FrameWidget({Key? key}) : super(key: key);
  @override
  void initState() {
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadframedata(),
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return framewidget(snapshot.data as Map<String, dynamic>);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<Map<String, dynamic>> loadframedata() async {
    String jsondata = await rootBundle.loadString('assets/specificdata.json');
    Map<String, dynamic> datamap = jsonDecode(jsondata);
    try {
      FrameData frameData = FrameData.fromJson(jsondata);
      log('framedata is ${frameData.post.custom.first.image}');
    } catch (e) {
      log('framedata is ${e}');
    }

    return datamap;
    // log('jsondata ${datamap['data'][0]}');
  }

  Widget framewidget(Map<String, dynamic> data) {
    return Container(
      padding: EdgeInsets.all(10),
      height: h * 0.5,
      width: w,
      child: Stack(
        children: [
          Image.network(
            data['post']['custom'][0]['image'],
            // "assets/bg_image.jpeg",
            width: w,
            height: h * 0.5,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: double.infinity,
              height: 30,
              child: ListView.builder(
                reverse: true,
                scrollDirection: Axis.horizontal,
                  itemCount: socialimages.length,
                  itemBuilder: (c, i) {
                    return Image.asset(socialimages[i],
                    color: i==3?Colors.black:null,
                        width: 30, height: 30, fit: BoxFit.cover);
                  }),
            ),
          )
        ],
      ),
    );
  }
}
