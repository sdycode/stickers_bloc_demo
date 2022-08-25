import 'dart:developer';

import 'package:bloc_demo/blocs/stickerFromAPIBloc/stckerAPIevent.dart';
import 'package:bloc_demo/blocs/stickerFromAPIBloc/stickerAPIState.dart';
import 'package:bloc_demo/models.dart/stickerimagemodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../models.dart/stickers_model.dart';

class StickerAPIBloc extends Bloc<StickerAPIEvent, FetchStickerAPIState> {
  StickerAPIBloc() : super(FetchStickerAPIState()) {
    on<FetchStickersEvent>(
      (event, emit) async {
        late StickersImageData data;
        try {
          var response = await http
              .get(Uri.parse("http://103.77.155.78/static/getSticker.json"));
          data = StickersImageData.fromJson(response.body);
          log('data is ${data.data.data.first.image}');
        } catch (e) {
          log('data is err $e');
        }
        if (data.success == true) {
          data.data.data.forEach((e) {
            event.stickerImages.add(StickerImageModel(e.image));
             state.stickerImages.add(StickerImageModel(e.image));
          });
        }
        state.stickerImages = event.stickerImages;
        emit(state);
      },
    );
  }
}
