import 'package:bloc_demo/blocs/stickerFromAPIBloc/stickerAPIBloc.dart';
import 'package:bloc_demo/blocs/sticker_bloc/sticker_bloc.dart';
import 'package:bloc_demo/demo_sticker_rotate.dart';
import 'package:bloc_demo/models.dart/sticker_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/sticker_bloc/sticker_state.dart';
import 'constants/sizes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> StickerBloc()),
        BlocProvider(create: (context)=> StickerAPIBloc())
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Builder(builder: (context) {
            w = MediaQuery.of(context).size.width;
            h = MediaQuery.of(context).size.height;
            return StickDemo();
          })
          // const MyHomePage(title: 'Flutter Demo Home Page'),
          ),
    );
  }
}
