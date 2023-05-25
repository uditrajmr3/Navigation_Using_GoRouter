import 'package:go_router_implementation/utils/app_exports.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const ValueKey("login"),
      body: Center(
        child: GestureDetector(
          onTap: () =>
              GoRouter.of(context).pushReplacementNamed(AppRoutes.home),
          child: const Text("Login"),
        ),
      ),
    );
  }
}
