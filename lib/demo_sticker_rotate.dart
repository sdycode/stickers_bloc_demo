import 'dart:convert';
import 'dart:developer';

import 'package:bloc_demo/blocs/sticker_bloc/sticker_bloc.dart';
import 'package:bloc_demo/blocs/sticker_bloc/sticker_state.dart';
import 'package:bloc_demo/widgets/frame_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;
import 'blocs/stickerFromAPIBloc/stckerAPIevent.dart';
import 'blocs/stickerFromAPIBloc/stickerAPIBloc.dart';
import 'blocs/stickerFromAPIBloc/stickerAPIState.dart';
import 'blocs/sticker_bloc/sticker_event.dart';
import 'constants/sizes.dart';
import 'package:vector_math/vector_math.dart' as vector;

import 'widgets/sticker.dart';

class StickDemo extends StatefulWidget {
  StickDemo({Key? key}) : super(key: key);

  @override
  State<StickDemo> createState() => _StickDemoState();
}

class _StickDemoState extends State<StickDemo> {
  String path =
      "https://thumbs.dreamstime.com/b/waves-rocky-shore-magnificent-view-hitting-seashore-184914304.jpg";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool showFrame = true;

  @override
  Widget build(BuildContext context) {
    log('build called');
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/bg_image.jpeg",
                  width: w,
                  height: h * 0.5,
                  fit: BoxFit.cover,
                ),
                showFrame
                    ? FrameWidget()
                    : BlocConsumer<StickerBloc, StickerState>(
                        listener: (context, state) {
                        if (state != BeforeLoadState) {
                          Sticker(state);
                        }
                      }, builder: (context, state) {
                        if (state == BeforeLoadState) {
                          return Center();
                        } else {
                          return Sticker(state);
                        }
                      }),
                // Sticker(),

                StickersList()
                // Positioned(left: offset.dx, top: offset.dy, child: Sticker())
              ],
            ),
            !showFrame
                ? BlocConsumer<StickerBloc, StickerState>(
                    listener: (context, stickstate) {
                      // TODO: implement listener
                    },
                    builder: (context, stickstate) {
                      return BlocConsumer<StickerAPIBloc, StickerAPIState>(
                        builder: (context, state) {
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              TextButton(
                                child: Text('Get Sticker'),
                                onPressed: () {
                                  context
                                      .read<StickerAPIBloc>()
                                      .add(FetchStickersEvent([]));
                                  log('list is ');
                                  setState(() {});
                                },
                              ),
                              Container(
                                  width: double.infinity,
                                  height: 100,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: context
                                          .read<StickerAPIBloc>()
                                          .state
                                          .stickerImages
                                          .length,
                                      itemBuilder: (c, i) {
                                        return InkWell(
                                          onTap: () {
                                            context.read<StickerBloc>().add(
                                                ChangeStickerEvent(context
                                                    .read<StickerAPIBloc>()
                                                    .state
                                                    .stickerImages[i]
                                                    .imgpath));
                                            setState(() {});
                                          },
                                          child: Image.network(context
                                              .read<StickerAPIBloc>()
                                              .state
                                              .stickerImages[i]
                                              .imgpath),
                                        );
                                      }))
                            ],
                          );
                          // return  Sticker(state);
                        },
                        listener: (context, state) {
                          Center();
                          // Sticker(state);
                        },
                      );
                    },
                  )
                : Container(),
                Spacer(), 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    child: Text('Stickers'),
                    onPressed: () {
                      setState(() {
                        showFrame = false;
                      });
                    }),
                TextButton(
                    child: Text('Frames'),
                    onPressed: () {
                      setState(() {
                        showFrame = true;
                      });
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  StickersList() {
    return Center();
  }
}
