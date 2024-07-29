import 'package:movies_app/sections/home_section/data/models/cast_response.dart';
import 'package:movies_app/sections/home_section/data/models/details_response.dart';
import 'package:movies_app/sections/home_section/data/models/now_playing_response.dart';
import 'package:movies_app/sections/home_section/data/models/reviews_response.dart';
import 'package:movies_app/sections/searching_section/models/search_response.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/3/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("movie/now_playing")
  Future<NowPlayingResponse> getNowPlaying(@Query('page') int page);

  @GET("movie/popular")
  Future<NowPlayingResponse> getPopular(@Query('page') int page);

  @GET("movie/top_rated")
  Future<NowPlayingResponse> getTopRated(@Query('page') int page);

  @GET("movie/upcoming")
  Future<NowPlayingResponse> getUpComing(@Query('page') int page);

  @GET("trending/movie/day?language=en-US")
  Future<NowPlayingResponse> getTrending();

  @GET("/movie/{id}")
  Future<DetailsResponse> getDetails(@Path() int id);

  @GET("movie/{id}/reviews?language=en-US&page=1")
  Future<ReviewsResponse> getReviews(@Path() int id);

  @GET("movie/{id}/credits?language=en-US&page=1")
  Future<CastResponse> getCast(@Path() int id);

  @GET("movie/{id}/credits?language=en-US&page=1")
  Future<SearchResponse> getSearch(
    @Query('page') int page,
    @Query('query') String text,
  );

// @GET("statuses/")
// Future<WorkingStatusResponse> getWorkingStatuses();
//
// @GET("departments/")
// Future<ContactsResponse> getContact(
//     @Query('page') int page,
//     @Query('per_page') int perPage,
//     );
//
// @GET("rights/")
// Future<RightsResponse> getRight(
//     @Query('page') int page,
//     @Query('limit') int perPage,
//     );
//
// @POST("users/")
// Future<SignUpResponse> signUp(@Body() Map<String, dynamic> requestBody);
//
// @POST("complains/upload/media")
// @MultiPart()
// Future<String> uploadMedia(@Part() File file);
//
// @POST("complains/")
// Future<CreateComplainResponse> createComplain(@Body() Map<String, dynamic> request);
}
