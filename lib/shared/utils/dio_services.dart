import 'package:dio/dio.dart' as don;
import 'package:firstapplication/core/constants/constants.dart';

export 'package:dio/dio.dart';

class DioService {
  factory DioService() => _instance;
  DioService._internal();
  static final DioService _instance = DioService._internal();
  final don.Dio client = don.Dio();

  Future<void> initialize() async {
    client
      ..options.baseUrl = APIConstants.baseUrl
      ..interceptors.add(
        don.InterceptorsWrapper(onRequest: (requestOptions, requestInterceptorHandler) async {
          // check this for the internet connection

          // final token = TokenService().getToken();

          // if ((token == null || token.isEmpty)) {
          //   requestOptions.headers.addAll(
          //     <String, String>{
          //       'Content-Type': 'application/json',
          //       'Accept': 'text/plain'
          //     },
          //   );
          // } else {
          //   requestOptions.headers.addAll(
          //     <String, String>{
          //       'Authorization': 'Bearer $token',
          //       'Content-Type': 'application/json',
          //       'Accept': 'application/json'
          //     },
          //   );
          // }

          return requestInterceptorHandler.next(requestOptions);
        }, onError: (don.DioException error, don.ErrorInterceptorHandler handler) async {
          if ((error.response?.statusCode == 401)) {
            // Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
            //     PageTransition(
            //         child: HomePage(), type: PageTransitionType.fade),
            //     (route) => false);
          }
          handler.next(error);
        }),
      );
  }
}
