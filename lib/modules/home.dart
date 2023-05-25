import 'package:go_router_implementation/utils/app_exports.dart';
import 'package:go_router_implementation/values/global.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const ValueKey("home"),
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () =>
                  GoRouter.of(context).pushNamed(AppRoutes.notification),
              child: const Text("Notification"),
            ),
            GestureDetector(
              onTap: () => GoRouter.of(context).pushNamed(AppRoutes.profile,
                  pathParameters: {"username": "player_unknown_from_home"}),
              child: const Text("Profile"),
            ),
            GestureDetector(
              onTap: () => setState(() {
                AppGlobals.isAuthenticated = false;
                GoRouter.of(context).pushReplacementNamed(AppRoutes.login);
              }),
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
