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
                while (GoRouter.of(context).location != "/") {
                  debugPrint(GoRouter.of(context).location.toString());
                  GoRouter.of(context).pop();
                }
              },
              child: const Text("Home"),
            ),
            GestureDetector(
              onTap: () {
                GoRouter.of(context).pop();
                GoRouter.of(context).pushNamed(AppRoutes.profile,
                    pathParameters: {
                      "username": "player_unknown_from_notification"
                    });
              },
              child: const Text("Profile"),
            ),
          ],
        ),
      ),
    );
  }
}
