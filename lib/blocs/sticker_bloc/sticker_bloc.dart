// import 'package:bloc_demo/blocs/sticker_bloc/sticker_event.dart'
// library 'blocs/sticker_bloc/sticker_bloc.dart'
// ignore_for_file: void_checks
import 'dart:math' as math;
import 'package:vector_math/vector_math.dart' as vector;
import 'dart:async';
import 'dart:math';

import 'package:bloc_demo/blocs/sticker_bloc/sticker_event.dart';
import 'package:bloc_demo/blocs/sticker_bloc/sticker_state.dart';
import 'package:bloc_demo/models.dart/sticker_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// export 'sticker_bloc.dart';
// part 'sticker_event.dart';
// part 'sticker_state.dart';
class StickerBloc extends Bloc<StickerEvent, StickerState> {
  // StickerNewState stickerNewState = StickerNewState(StickerModel(
  //     "https://oceanmtech.b-cdn.net/dmt/sticker_image/20220706155538-796j4z.png"));

  // ignore: non_constant_identifier_names
  StickerBloc()
      : super(StickerNewState(StickerModel(
            'https://oceanmtech.b-cdn.net/dmt/sticker_image/20220706155538-796j4z.png'))) {
    on<StickerPanUpdateEvent>((event, emit) {
      state.stickermodel.offset = event.d.globalPosition;

      return state;
    });

    on<RotScaleStartEvent>((event, emit) {
      state.stickermodel.start = event.d.globalPosition;
      state.stickermodel.startDistance =
          (event.d.globalPosition - state.stickermodel.offset).distance;

      return state;
    });
    on<RotScaleUpdateEvent>((event, emit) {
      if (state.stickermodel.startDistance != 0) {
        state.stickermodel.newDistance =
            (event.d.globalPosition - state.stickermodel.offset).distance;

        state.stickermodel.scale =
            state.stickermodel.newDistance / state.stickermodel.startDistance;
        // log('scale $scale / $newDistance  / $startDistance');
      }
      state.stickermodel.end = event.d.globalPosition;
      // log('angle is $end');
      double angle =
          angleBetween3Points(state.stickermodel.end, state.stickermodel.start);

      state.stickermodel.start = event.d.globalPosition;
      state.stickermodel.finalAngle += angle;
      return state;
    });

    on<FlipEvent>(
      (event, emit) {
        state.stickermodel.isMirror = !state.stickermodel.isMirror;
      },
    );
    on<RemoeStickerEvent>((event, emit) {
      state.stickermodel.isVisible = false;
    });

    on<ChangeStickerEvent>(
      (event, emit) {
        state.stickermodel.imgpath = event.imgpath;
           state.stickermodel.isVisible = true;
        emit(state);
        
      },
    );
  }

  double angleBetween3Points(Offset f, Offset s) {
    // log('points are center $offset /  start $s  / end $f');
    double angle1 = math.atan2(f.dy - state.stickermodel.offset.dy,
        f.dx - state.stickermodel.offset.dx);
    double angle2 = math.atan2(s.dy - state.stickermodel.offset.dy,
        s.dx - state.stickermodel.offset.dx);
    // log('angles are $angle1 and $angle2 ');
    // double angle1 = math.atan2(f.startOffset.dy - s.startOffset.dy,
    //     f.startOffset.dx - s.startOffset.dx);
    // double angle2 = math.atan2(f.currentOffset.dy - s.currentOffset.dy,
    //     f.currentOffset.dx - s.currentOffset.dx);
    double angle = vector.degrees(angle1 - angle2) % 360;
    if (angle < -180.0) angle += 360.0;
    if (angle > 180.0) angle -= 360.0;
    return vector.radians(angle);
  }
}
