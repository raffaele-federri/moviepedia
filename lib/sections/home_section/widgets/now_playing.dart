import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/themes/app_colors.dart';
import 'package:movies_app/sections/home_section/bloc/get_movies_bloc/get_movies_bloc.dart';
import 'package:movies_app/sections/home_section/widgets/categories_grid.dart';

class NowPlaying extends StatefulWidget {
  const NowPlaying({super.key});

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  @override
  void initState() {
    // context.read<GetMoviesBloc>().add(const GetNowPlayingEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Now Playing'),
        surfaceTintColor: Colors.transparent,
        shadowColor: AppColors.scaffold,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: BlocBuilder<GetMoviesBloc, GetMoviesState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24 ,vertical: 12),
            child: CategoriesGrid(
              id: 0,
              itemCount: state.nowPlaying.length,
              results: state.nowPlaying,
            ),
          );
        },
      ),
    );
  }
}
