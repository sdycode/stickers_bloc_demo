// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

import '../../models.dart/stickerimagemodel.dart';

abstract class StickerAPIEvent extends Equatable {
  const StickerAPIEvent();
  List<Object?> get props => [];
}

class FetchStickersEvent extends StickerAPIEvent {
  List<StickerImageModel> stickerImages ;
   FetchStickersEvent(this.stickerImages);
  // void panupdate(DragUpdateDetails d) {}
}