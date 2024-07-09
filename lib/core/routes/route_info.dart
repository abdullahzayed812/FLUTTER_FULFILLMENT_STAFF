import 'package:go_router/go_router.dart';

class RouteInfo {
  const RouteInfo({
    required this.path,
    required this.builder,
    this.showInDrawer = false,
    this.iconPath,
    this.name,
    this.routes,
  });

  final String path;
  final GoRouterWidgetBuilder builder;
  final bool showInDrawer;

  final String? name;
  final String? iconPath;

  final List<RouteInfo>? routes;
}
