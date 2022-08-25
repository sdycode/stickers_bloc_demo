import 'package:equatable/equatable.dart';

import '../../models.dart/stickerimagemodel.dart';

abstract class StickerAPIState extends Equatable {
  StickerAPIState();
}

class FetchStickerAPIState extends StickerAPIState {
  List<StickerImageModel> stickerImages = [];
  FetchStickerAPIState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
