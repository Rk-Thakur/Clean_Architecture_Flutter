import 'package:firstapplication/features/homepage/presentation/pages/third_page.dart';
import 'package:firstapplication/main.g.dart';

class CleanRouter {
  Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case CleanRouting.firstPage:
        return MaterialPageRoute(builder: (_) {
          return BlocProvider(
            create: (context) => getIt<HomepageBloc>(),
            child: const FirstPage(),
          );
        });
      case CleanRouting.secondpage:
        return MaterialPageRoute(builder: (_) {
          return BlocProvider(
            create: (context) => getIt<HomepageBloc>(),
            child: const SecondPage(),
          );
        });
      case CleanRouting.thirdPage:
        final params = routeSettings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(builder: (_) {
          return BlocProvider(
            create: (context) => getIt<HomepageBloc>(),
            child: ThirdPage(
              id: params['id'],
            ),
          );
        });
      default:
        return notFoundRoute();
    }
  }

  Route notFoundRoute() {
    return MaterialPageRoute(
        builder: (context) => const Material(
              child: Scaffold(
                body: Center(
                  child: Text("Page Not Found!!!"),
                ),
              ),
            ));
  }
}
