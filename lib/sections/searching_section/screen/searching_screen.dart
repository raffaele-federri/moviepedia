import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/themes/app_colors.dart';
import 'package:movies_app/sections/searching_section/bloc/search_bloc.dart';

class SearchingScreen extends StatelessWidget {
  final controller = TextEditingController();

  SearchingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.indicatorGrey,
                  borderRadius: BorderRadius.circular(30), // Rounded corners
                ),
                child: TextField(
                  keyboardType: TextInputType.name,
                  controller: controller,
                  style: TextStyle(color: Colors.white), // Text color
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: InputBorder.none,
                    suffixIcon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/nav_ic_2.svg',
                          height: 20,
                        ),
                      ],
                    ), // Search icon color
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.trending.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      height: 100,
                      width: 100,
                      color: Colors.red,
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
