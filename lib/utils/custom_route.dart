import 'package:go_router/go_router.dart';
import 'package:untitled1/presentation/ui/counter.dart';
import 'package:untitled1/presentation/ui/news.dart';
import 'package:untitled1/utils/constant_route.dart';


class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: "/",
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) =>  Home(),
      ),
      GoRoute(
        path: news,
        builder: (context, state) => const News(),
      ),
    ],
    errorBuilder: (context, state) {
      return Home();
    },
  );
}