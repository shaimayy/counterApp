import 'package:counter_app/feature/home/home_page.dart';
import 'package:counter_app/core/theme/colors.dart';
import 'package:counter_app/core/widget/passord_input_widget.dart';
import 'package:counter_app/core/widget/redirect_text_widget.dart';
import 'package:counter_app/core/widget/text_Imput_widget.dart';
import 'package:counter_app/feature/auth/manager/auth_cubit.dart';
import 'package:counter_app/feature/auth/manager/auth_state.dart';
import 'package:counter_app/feature/auth/manager/home_cubit.dart';
import 'package:counter_app/feature/auth/presentation/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          {
            if (state.status == AuthStatus.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage ?? "Login failed"),
                  backgroundColor: Colors.redAccent,
                ),
              );
            }

            if (state.status == AuthStatus.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Welcome back!"),
                  backgroundColor: Colors.green,
                ),
              );

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => HomeCubit(),
                    child: HomePage(),
                  ),
                ),
              );
            }
          }
          ;
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentGeometry.topCenter,
              end: AlignmentGeometry.bottomCenter,
              colors: [AppColors.primaryColor, AppColors.secondaryColor],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextInputWidget(
                  labeltext: 'Email',
                  controller: emailController,
                ),
                SizedBox(height: 10),
                PasswordInputWidget(
                  labeltext: 'Password',
                  controller: passwordController,
                ),

                SizedBox(height: 20),
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return state.status == AuthStatus.loading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () {
                              context.read<LoginCubit>().login(
                                emailController.text,
                                passwordController.text,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              minimumSize: Size(double.infinity, 56),
                              padding: EdgeInsets.all(16),
                            ),

                            child: Text(
                              'Login',
                              style: TextStyle(fontSize: 18),
                            ),
                          );
                  },
                ),

                SizedBox(height: 5),
                RedirectTextWidget(
                  text: "Don't have an account?",
                  clickabletext: "Register",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => RegisterCubit(),
                          child: RegisterPage(),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
