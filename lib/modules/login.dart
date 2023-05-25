import 'package:go_router_implementation/utils/app_exports.dart';
import 'package:go_router_implementation/values/global.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const ValueKey("login"),
      body: Center(
        child: GestureDetector(
          onTap: () => setState(() {
            AppGlobals.isAuthenticated = true;
            GoRouter.of(context).pushReplacementNamed(AppRoutes.home);
          }),
          child: const Text("Login"),
        ),
      ),
    );
  }
}
