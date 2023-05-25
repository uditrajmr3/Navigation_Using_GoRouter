import 'package:go_router_implementation/utils/app_exports.dart';

class Like extends StatelessWidget {
  const Like({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const ValueKey("like"),
      appBar: AppBar(
        title: const Text("Likes"),
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
                      pathParameters: {"username": "player_unknown_from_like"});
                } else {
                  GoRouter.of(context).pushNamed(AppRoutes.profile,
                      pathParameters: {"username": "player_unknown_from_like"});
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
