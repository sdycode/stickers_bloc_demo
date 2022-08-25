// ignore_for_file: must_be_immutable

// part of 'sticker_event.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../models.dart/sticker_model.dart';

// part of 'sticker_bloc.dart'
abstract class StickerEvent extends Equatable {
  const StickerEvent();
  List<Object?> get props => [];
}
class ChangeStickerEvent extends StickerEvent {
  String imgpath;
  ChangeStickerEvent(this.imgpath);
  // void panupdate(DragUpdateDetails d) {}
}
class StickerPanUpdateEvent extends StickerEvent {
  DragUpdateDetails d;
  StickerPanUpdateEvent(this.d);
  // void panupdate(DragUpdateDetails d) {}
}

class RotScaleStartEvent extends StickerEvent {
   DragStartDetails  d;
  RotScaleStartEvent(this.d);
}

class RotScaleUpdateEvent extends StickerEvent {
  DragUpdateDetails d;
  RotScaleUpdateEvent(this.d);
}

class RotScaleEndEvent extends StickerEvent {
  DragUpdateDetails d;
  RotScaleEndEvent(this.d);
}

class FlipEvent extends StickerEvent {
 
  FlipEvent();
}
class RemoeStickerEvent extends StickerEvent {
 
  RemoeStickerEvent();
}
