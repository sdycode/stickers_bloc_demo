import 'package:equatable/equatable.dart';

import '../../models.dart/sticker_model.dart';

abstract class StickerState extends Equatable {
  StickerState();
 @override
  StickerModel get stickermodel => StickerModel('imgpath');
}
class BeforeLoadState extends StickerState{
  @override
  StickerModel get stickermodel => StickerModel('imgpath');
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class StickerNewState extends StickerState {
 StickerModel stickerModel ;
  StickerNewState(this.stickerModel );
  
  @override
  // TODO: implement props
  List<Object?> get props => [];
 @override
  StickerModel get stickermodel => stickerModel;



}
