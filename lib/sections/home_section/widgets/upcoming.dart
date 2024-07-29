import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/themes/app_colors.dart';
import 'package:movies_app/sections/home_section/bloc/get_movies_bloc/get_movies_bloc.dart';
import 'package:movies_app/sections/home_section/widgets/categories_grid.dart';

class Upcoming extends StatefulWidget {


  const Upcoming({super.key });

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  @override
  void initState() {
    context.read<GetMoviesBloc>().add(const GetUpcomingEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Upcoming'),
        surfaceTintColor: Colors.transparent,
        shadowColor: AppColors.scaffold,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: BlocBuilder<GetMoviesBloc, GetMoviesState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: CategoriesGrid(
              id: 1,
              itemCount: state.upcoming.length,
              results: state.upcoming,
            ),
          );
        },
      ),
    );
  }
}
