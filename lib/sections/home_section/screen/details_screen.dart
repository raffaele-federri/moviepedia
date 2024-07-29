import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/text_styles/app_text_styles.dart';
import 'package:movies_app/core/themes/app_colors.dart';
import 'package:movies_app/core/utils/app_utils.dart';
import 'package:movies_app/main.dart';
import 'package:movies_app/sections/home_section/bloc/categories_cubit/categories_cubit.dart';
import 'package:movies_app/sections/home_section/bloc/get_movies_bloc/get_movies_bloc.dart';
import 'package:movies_app/sections/home_section/widgets/cast_widget.dart';
import 'package:movies_app/sections/home_section/widgets/reviews_widget.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    super.key,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMoviesBloc, GetMoviesState>(
      builder: (context, state) {
        final details = state.details;
        return Scaffold(
          floatingActionButton: Visibility(
            visible: kDebugMode,
            child: FloatingActionButton(
              heroTag: UniqueKey(),
              onPressed: () {
                chuck.showInspector();
              },
            ),
          ),
          appBar: AppBar(
            backgroundColor: AppColors.scaffold,
            surfaceTintColor: AppColors.scaffold,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(child: SizedBox()),
                Text(
                  'Detail',
                  style: GoogleFonts.montserrat(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const Expanded(child: SizedBox()),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/nav_ic_3.svg',
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          body: state.detailsLoading
              ? AppUtils.kCenterLoading
              : NestedScrollView(
                  headerSliverBuilder: (_, innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        // pinned: true,
                        floating: true,
                        backgroundColor: AppColors.scaffold,
                        expandedHeight: 306,
                        flexibleSpace: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            SizedBox(
                              height: 270,
                              child: Stack(
                                alignment: AlignmentDirectional.bottomStart,
                                children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: AppUtils.kRadius12,
                                        bottomRight: AppUtils.kRadius12,
                                      ),
                                      child: SizedBox(
                                        height: 210,
                                        width: double.infinity,
                                        child: FadeInImage.assetNetwork(
                                          fit: BoxFit.cover,
                                          placeholderFit: BoxFit.cover,
                                          width: double.infinity,
                                          placeholder:
                                              'assets/images/initial_backdrop.jpg',
                                          image:
                                              "https://image.tmdb.org/t/p/w500${details?.backdropPath ?? ''}",
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 30,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              AppUtils.kBorderRadius12,
                                          child: Container(
                                            height: 130,
                                            width: 105,
                                            color: Colors.red,
                                            child: FadeInImage.assetNetwork(
                                              fit: BoxFit.cover,
                                              placeholderFit: BoxFit.cover,
                                              width: double.infinity,
                                              placeholder:
                                                  'assets/images/initial_backdrop.jpg',
                                              image:
                                                  "https://image.tmdb.org/t/p/w500${details?.posterPath ?? ''}",
                                            ),
                                          ),
                                        ),
                                        AppUtils.kGap12,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Opacity(
                                              opacity: 0.78,
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    AppUtils.kRadius8,
                                                  ),
                                                  color: AppColors.rateGray,
                                                ),
                                                height: 24,
                                                width: 54,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SvgPicture.asset(
                                                        'assets/icons/star.svg'),
                                                    AppUtils.kGap4,
                                                    Text(
                                                      details?.voteAverage
                                                              ?.toStringAsFixed(
                                                                  1) ??
                                                          '',
                                                      style: AppTextStyles
                                                          .orange12w600,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            AppUtils.kGap6,
                                            SizedBox(
                                              width: 240,
                                              height: 60,
                                              child: Text(
                                                details?.title ?? '',
                                                style:
                                                    AppTextStyles.white18w600,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            AppUtils.kGap12,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/icons/calendar.svg'),
                                AppUtils.kGap4,
                                Text(
                                    details?.releaseDate?.split('-').first ??
                                        '',
                                    style: AppTextStyles.grey12w400),
                                AppUtils.kGap12,
                                Container(
                                    width: 1,
                                    height: 16,
                                    color: AppColors.textGrey),
                                AppUtils.kGap12,
                                SvgPicture.asset('assets/icons/clock.svg'),
                                AppUtils.kGap4,
                                Text(
                                    "${details?.runtime.toString() ?? ''} Minutes",
                                    style: AppTextStyles.grey12w400),
                                AppUtils.kGap12,
                                Container(
                                    width: 1,
                                    height: 16,
                                    color: AppColors.textGrey),
                                AppUtils.kGap12,
                                SvgPicture.asset('assets/icons/ticket.svg'),
                                AppUtils.kGap4,
                                Text(details?.genres?.first.name ?? '',
                                    style: AppTextStyles.grey12w400),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ];
                  },
                  body: BlocProvider(
                    create: (context) => CategoriesCubit(),
                    child: BlocBuilder<CategoriesCubit, int>(
                      builder: (context, state) {
                        return DefaultTabController(
                          length: 3,
                          child: Scaffold(
                            backgroundColor: AppColors.scaffold,
                            appBar: AppBar(
                              backgroundColor: AppColors.scaffold,
                              automaticallyImplyLeading: false,
                              toolbarHeight: 0,
                              bottom: TabBar(
                                isScrollable: true,
                                indicator: const UnderlineTabIndicator(
                                  borderSide: BorderSide(
                                      width: 5.0,
                                      color: AppColors.indicatorGrey),
                                ),
                                tabs: [
                                  Tab(
                                    icon: Text(
                                      'About Movie',
                                      style: AppTextStyles.white14w500,
                                    ),
                                  ),
                                  Tab(
                                    icon: Text(
                                      'Reviews',
                                      style: AppTextStyles.white14w500,
                                    ),
                                  ),
                                  Tab(
                                    icon: Text(
                                      'Cast',
                                      style: AppTextStyles.white14w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            body: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 20,
                              ),
                              child: TabBarView(
                                children: [
                                  Text(
                                    details?.overview ?? '',
                                    style: AppTextStyles.white14w500,
                                  ),
                                  const ReviewsWidget(),
                                  const CastWidget(),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
        );
      },
    );
  }
}

// head
//SizedBox(
//                         height: 280,
//                         child: Stack(
//                           alignment: AlignmentDirectional.bottomStart,
//                           children: [
//                             Align(
//                               alignment: Alignment.topCenter,
//                               child: ClipRRect(
//                                 borderRadius: const BorderRadius.only(
//                                   bottomLeft: AppUtils.kRadius12,
//                                   bottomRight: AppUtils.kRadius12,
//                                 ),
//                                 child: SizedBox(
//                                   height: 210,
//                                   width: double.infinity,
//                                   child: Image.network(
//                                     fit: BoxFit.cover,
//                                     "https://image.tmdb.org/t/p/w500${details?.backdropPath ?? ''}",
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Positioned(
//                               left: 30,
//                               child: Row(
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: [
//                                   ClipRRect(
//                                     borderRadius: AppUtils.kBorderRadius12,
//                                     child: Container(
//                                       height: 130,
//                                       width: 105,
//                                       color: Colors.red,
//                                       child: Image.network(
//                                         fit: BoxFit.cover,
//                                         "https://image.tmdb.org/t/p/w500${details?.posterPath ?? ''}",
//                                       ),
//                                     ),
//                                   ),
//                                   AppUtils.kGap12,
//                                   SizedBox(
//                                     width: 240,
//                                     height: 60,
//                                     child: Text(
//                                       details?.title ?? '',
//                                       style: AppTextStyles.white18w600,
//                                       maxLines: 2,
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),

//body
//  AppUtils.kGap16,
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SvgPicture.asset('assets/icons/calendar.svg'),
//                           AppUtils.kGap4,
//                           Text(details?.releaseDate?.split('-').first ?? '',
//                               style: AppTextStyles.grey12w400),
//                           AppUtils.kGap12,
//                           Container(
//                               width: 1, height: 16, color: AppColors.textGrey),
//                           AppUtils.kGap12,
//                           SvgPicture.asset('assets/icons/clock.svg'),
//                           AppUtils.kGap4,
//                           Text("${details?.runtime.toString() ?? ''} Minutes",
//                               style: AppTextStyles.grey12w400),
//                           AppUtils.kGap12,
//                           Container(
//                               width: 1, height: 16, color: AppColors.textGrey),
//                           AppUtils.kGap12,
//                           SvgPicture.asset('assets/icons/ticket.svg'),
//                           AppUtils.kGap4,
//                           Text(details?.genres?.first.name ?? '',
//                               style: AppTextStyles.grey12w400),
//                         ],
//                       ),
//                       AppUtils.kGap24,
//                       BlocProvider(
//                         create: (context) => CategoriesCubit(),
//                         child: BlocBuilder<CategoriesCubit, int>(
//                           builder: (context, state) {
//                             return Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 30),
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       CategoriesItem(
//                                         state: state,
//                                         title: "About Movie",
//                                         index: 0,
//                                         category: false,
//                                       ),
//                                       AppUtils.kGap24,
//                                       CategoriesItem(
//                                         state: state,
//                                         title: "Reviews",
//                                         index: 1,
//                                         movieId: details?.id ?? 0,
//                                         category: false,
//                                       ),
//                                       AppUtils.kGap24,
//                                       CategoriesItem(
//                                         state: state,
//                                         title: "Cast",
//                                         index: 2,
//                                         movieId: details?.id ?? 0,
//                                         category: false,
//                                       ),
//                                     ],
//                                   ),
//                                   AppUtils.kGap24,
//                                   IndexedStack(
//                                     index: state,
//                                     children: [
//                                       Text(
//                                         details?.overview ?? '',
//                                         style: AppTextStyles.white14w500,
//                                       ),
//                                       const ReviewsWidget(),
//                                       const CastWidget(),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                       ),

// indexed stack
// ListView(
//                             shrinkWrap: true,
//                             physics: NeverScrollableScrollPhysics(),
//
//                             children: [
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   CategoriesItem(
//                                     state: state,
//                                     title: "About Movie",
//                                     index: 0,
//                                     category: false,
//                                   ),
//                                   AppUtils.kGap24,
//                                   CategoriesItem(
//                                     state: state,
//                                     title: "Reviews",
//                                     index: 1,
//                                     movieId: details?.id ?? 0,
//                                     category: false,
//                                   ),
//                                   AppUtils.kGap24,
//                                   CategoriesItem(
//                                     state: state,
//                                     title: "Cast",
//                                     index: 2,
//                                     movieId: details?.id ?? 0,
//                                     category: false,
//                                   ),
//                                 ],
//                               ),
//                               AppUtils.kGap24,
//                               IndexedStack(
//                                 index: state,
//                                 children: [
//                                   Text(
//                                     details?.overview ?? '',
//                                     style: AppTextStyles.white14w500,
//                                   ),
//                                   const ReviewsWidget(),
//                                   const CastWidget(),
//                                 ],
//                               ),
//                             ],
//                           ),
