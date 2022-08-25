import 'dart:developer';

import 'package:bloc_demo/blocs/stickerFromAPIBloc/stckerAPIevent.dart';
import 'package:bloc_demo/blocs/stickerFromAPIBloc/stickerAPIBloc.dart';
import 'package:bloc_demo/blocs/sticker_bloc/sticker_bloc.dart';
import 'package:bloc_demo/blocs/sticker_bloc/sticker_state.dart';
import 'package:bloc_demo/models.dart/sticker_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;
import 'package:vector_math/vector_math.dart' as vector;

import '../blocs/sticker_bloc/sticker_event.dart';
import '../constants/sizes.dart';

class Sticker extends StatefulWidget {
  StickerState state;
  Sticker(this.state, {Key? key}) : super(key: key);

  @override
  State<Sticker> createState() => _StickerState(state);
}

class _StickerState extends State<Sticker> {
  final StickerState state;
  _StickerState(this.state);
  double fulw = 200;
  double fulh = 200;
  double iconsize = 30;
  Offset offset = Offset(w * 0.5, h * 0.5 * 0.5);
  double finalAngle = 0.0;
  double oldAngle = 0.0;
  double upsetAngle = 0.0;
  Offset start = Offset.zero;
  Offset end = Offset.zero;
  double startDistance = 0;
  double newDistance = 0;
  double scale = 1.0;

  // OffsetcenterOfGestureDetector;

  StickerModel model = StickerModel(
      "https://oceanmtech.b-cdn.net/dmt/sticker_image/20220706155538-796j4z.png");

  @override
  void initState() {
    log('imgpath   ${state.stickermodel.imgpath}');
    // TODO: implement initState
    // state.stickermodel.imgpath =
    //     "https://oceanmtech.b-cdn.net/dmt/sticker_image/20220706155538-796j4z.png";
    model = state.stickermodel;
    super.initState();
  }

  //  state.stickermodel ;
  @override
  Widget build(BuildContext context) {
    // centerOfGestureDetector = offset;

    return Positioned(
      left: model.offset.dx - model.fulw * 0.5,
      //  offset.dx - fulw * 0.5,
      top: model.offset.dy - model.fulh * 0.5,
      child: Visibility(
        visible: model.isVisible,
        child: Transform.scale(
          scale: model.scale,
          child: Transform.rotate(
            angle: model.finalAngle,
            child: GestureDetector(
              child: Container(
                width: fulw,
                height: fulw,
                child: Stack(children: [
                  Container(
                    width: fulw,
                    height: fulw,
                    color: Colors.amber.shade100.withAlpha(0),
                  ),
                  Container(
                    margin: EdgeInsets.all(iconsize * 0.5),
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                   
                      onPanUpdate: (d) {
                        // setState(() {
                        context.read<StickerBloc>().add(StickerPanUpdateEvent(d));
                        setState(() {});
                        // offset = d.globalPosition;
                        // double deltaangle = finalAngle / (2 * math.pi);
                        // log('angg $bef  and  $aft');
                        // log('delta ag ${finalAngle} / ${deltaangle} --  ${d.delta.direction} / ${d.delta.dx} / ${d.localPosition.dx}');
                        // offset = Offset(offset.dx + d.delta.dx, offset.dy + d.delta.dy);
                        // });
                      },
                      child: Transform(
                        alignment: Alignment.center,
                        transform:
                            Matrix4.rotationY(model.isMirror ? math.pi : 0),
                        // angle: !model.isMirror ? math.pi/2:0,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: 
                              
                                NetworkImage(model.imgpath),
                              ),
                              // "https://img.freepik.com/free-vector/abstract-colorful-super-sale-modern-background_1055-5044.jpg?w=740&t=st=1661360391~exp=1661360991~hmac=2e744ee2305cbdb4a070f68274c06afd6eb00d91514615ef9a3161ef9c16c8a3")),
                              color: Colors.white.withAlpha(20),
                              border: Border.all(width: 1, color: Colors.black)),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        context.read<StickerBloc>().add(FlipEvent());
                        setState(() {});
                      },
                      child: Container(
                        decoration: iconDecoration(),
                        width: iconsize,
                        height: iconsize,
                        child: FittedBox(
                          child: Icon(Icons.flip),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () {
                        context.read<StickerBloc>().add(RemoeStickerEvent());
                        setState(() {
                          
                        });
                      },
                      child: Container(
                        decoration: iconDecoration(),
                        width: iconsize,
                        height: iconsize,
                        child: FittedBox(
                          child: Icon(Icons.close),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
      
                      onPanStart: (d) {
                        // start = d.globalPosition;
                        // startDistance = (d.globalPosition - offset).distance;
                        context.read<StickerBloc>().add(RotScaleStartEvent(d));
                        // final touchPositionFromCenter =
                        //     details.localPosition - offset;
                        // upsetAngle = oldAngle - touchPositionFromCenter.direction;
                      },
                      // onPanEnd: (d) {
                      //   // end = d.velocity.pixelsPerSecond;
                      //   // var angle = angleBetween3Points(end, start);
      
                      //   // log('angle is $angle');
                      //   setState(
                      //     () {
                      //       // oldAngle = finalAngle;
                      //     },
                      //   );
                      // },
                      onPanUpdate: (d) {
                        context.read<StickerBloc>().add(RotScaleUpdateEvent(d));
                        // if (startDistance != 0) {
                        //   newDistance = (d.globalPosition - offset).distance;
      
                        //   scale = newDistance / startDistance;
                        //   log('scale $scale / $newDistance  / $startDistance');
                        // }
                        // end = d.globalPosition;
                        // log('angle is $end');
                        // double angle = angleBetween3Points(end, start);
      
                        // start = d.globalPosition;
                        // finalAngle += angle;
                        // log('angle is $end $angle');
                        setState(() {});
                        // final touchPositionFromCenter =
                        //     details.localPosition - offset;
      
                        // setState(
                        //   () {
                        //     log('dirr ${touchPositionFromCenter.direction}');
                        //     finalAngle =
                        //         touchPositionFromCenter.direction + upsetAngle;
                        //   },
                        // );
                      },
                      child: Container(
                        decoration: iconDecoration(),
                        width: iconsize,
                        height: iconsize,
                        child: FittedBox(
                          child: Icon(Icons.screen_rotation),
                        ),
                      ),
                    ),
                  ),
                  //  IgnorePointer(
                  //   ignoring: true,
                  //    child: Transform.rotate(
                  //     angle: finalAngle,
                  //      child: Container(
                  //        margin: EdgeInsets.all(iconsize * 0.5),
                  //        decoration: BoxDecoration(
                  //            image: DecorationImage(
                  //                image: NetworkImage(
                  //                    "https://img.freepik.com/free-vector/abstract-colorful-super-sale-modern-background_1055-5044.jpg?w=740&t=st=1661360391~exp=1661360991~hmac=2e744ee2305cbdb4a070f68274c06afd6eb00d91514615ef9a3161ef9c16c8a3")),
                  //            color: Colors.white.withAlpha(20),
                  //            border: Border.all(width: 1, color: Colors.white)),
                  //      ),
                  //    ),
                  //  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  double angleBetween3Points(Offset f, Offset s) {
    log('points are center $offset /  start $s  / end $f');
    double angle1 = math.atan2(f.dy - offset.dy, f.dx - offset.dx);
    double angle2 = math.atan2(s.dy - offset.dy, s.dx - offset.dx);
    log('angles are $angle1 and $angle2 ');
    // double angle1 = math.atan2(f.startOffset.dy - s.startOffset.dy,
    //     f.startOffset.dx - s.startOffset.dx);
    // double angle2 = math.atan2(f.currentOffset.dy - s.currentOffset.dy,
    //     f.currentOffset.dx - s.currentOffset.dx);
    double angle = vector.degrees(angle1 - angle2) % 360;
    if (angle < -180.0) angle += 360.0;
    if (angle > 180.0) angle -= 360.0;
    return vector.radians(angle);
  }

  iconDecoration() {
    return BoxDecoration(shape: BoxShape.circle, color: Colors.amber.shade200);
  }
}
