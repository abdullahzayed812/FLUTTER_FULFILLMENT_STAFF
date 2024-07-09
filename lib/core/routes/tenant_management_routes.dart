// part of 'routes.dart';
//
// final List<RouteInfo> _tenantManagementRoutes = [
//   RouteInfo(
//     path: NameSpaceListPage.path,
//     builder: (context, state) => const NameSpaceListPage(),
//     routes: [
//       RouteInfo(
//         path: AddEditNamespacePage.path,
//         builder: (context, state) =>
//             AddEditNamespacePage(namespace: state.extra as Namespace?),
//       ),
//     ],
//   ),
//   RouteInfo(
//     path: CustomerListPage.path,
//     builder: (context, state) => const CustomerListPage(),
//   ),
//   RouteInfo(
//     path: UsersActivityLogListPage.path,
//     builder: (context, state) => const UsersActivityLogListPage(),
//   ),
//   RouteInfo(
//     path: RoleListPage.path,
//     builder: (context, state) => const RoleListPage(),
//     routes: [
//       RouteInfo(
//         path: RoleDetailsPage.path,
//         builder: (context, state) => RoleDetailsPage(state.extra as String),
//       ),
//     ],
//   ),
//   RouteInfo(
//     path: UsersGroupListPage.path,
//     builder: (context, state) => const UsersGroupListPage(),
//     routes: [
//       RouteInfo(
//         path: UsersGroupDetailsPage.path,
//         builder: (context, state) => UsersGroupDetailsPage(
//           id: state.uri.queryParameters[RouteQueryParameter.id]!,
//         ),
//       ),
//       RouteInfo(
//         path: AddEditUsersGroupPage.path,
//         builder: (context, state) => AddEditUsersGroupPage(
//           usersGroup: state.extra as UserGroup?,
//         ),
//       ),
//     ],
//   ),
//   RouteInfo(
//     path: UserListPage.path,
//     builder: (context, state) => const UserListPage(),
//   ),
//   RouteInfo(
//     path: UserProfilePage.path,
//     builder: (context, state) =>
//         UserProfilePage(id: state.uri.queryParameters[RouteQueryParameter.id]!),
//   ),
//   RouteInfo(
//     path: AddEditUserPage.path,
//     builder: (context, state) =>
//         AddEditUserPage(id: state.uri.queryParameters[RouteQueryParameter.id]),
//   ),
//   RouteInfo(
//     path: SettingsPage.path,
//     builder: (context, state) => const SettingsPage(),
//   ),
// ];
