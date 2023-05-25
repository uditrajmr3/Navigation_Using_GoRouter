import 'package:go_router_implementation/utils/app_exports.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const ValueKey("notification"),
      appBar: AppBar(
        title: const Text("Notification"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                if (GoRouter.of(context).location.isEmpty) {
                  while (GoRouter.of(context).location != "/") {
                    GoRouter.of(context).pop();
                  }
                } else {
                  GoRouter.of(context).pushReplacementNamed(AppRoutes.home);
                }
              },
              child: const Text("Home"),
            ),
            GestureDetector(
              onTap: () {
                if (GoRouter.of(context).location.isEmpty) {
                  GoRouter.of(context).pop();
                  GoRouter.of(context).pushNamed(AppRoutes.profile,
                      pathParameters: {
                        "username": "player_unknown_from_notification"
                      });
                } else {
                  GoRouter.of(context).pushNamed(AppRoutes.profile,
                      pathParameters: {
                        "username": "player_unknown_from_notification"
                      });
                }
              },
              child: const Text("Profile"),
            ),
          ],
        ),
      ),
    );
  }
}
