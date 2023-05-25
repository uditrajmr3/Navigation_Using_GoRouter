import 'package:go_router_implementation/utils/app_exports.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key, required this.username}) : super(key: key);
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const ValueKey("profile"),
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(username),
            GestureDetector(
              onTap: () => GoRouter.of(context).pushNamed(AppRoutes.like),
              child: const Text("Like"),
            ),
            GestureDetector(
              onTap: () => GoRouter.of(context).pushNamed(AppRoutes.chat),
              child: const Text("Chat"),
            ),
          ],
        ),
      ),
    );
  }
}
