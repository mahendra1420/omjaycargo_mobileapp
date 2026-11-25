import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omjaycargo/assets/app_colors.dart';
import 'package:omjaycargo/helpers/helper.dart';
import '../data/controller/user_controller.dart';
import '../generated/l10n.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final UserController userController = Get.put(UserController());
  final TextEditingController emailController = TextEditingController(text: "genius@gmail.com");
  final TextEditingController passwordController = TextEditingController(text: "12345678");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      backgroundColor: AppColors.allScreenBGColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 100,
            decoration: const BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/images/img_login_upper.png"),
                fit: BoxFit.cover,
              ),
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            width: double.infinity,
          ),
          Stack(
            children: [

              /// Your login UI
              Align(
                alignment: Alignment.bottomCenter,
                child: Stack(
                  children: [
                    Container(
                      height: 90,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      width: double.infinity,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage("assets/images/img_bottom_bg.png"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 22.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SingleChildScrollView(
                                child: Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        S.current.welcome,
                                        style: const TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        S.current.login_with_your_email_and_password,
                                        style: const TextStyle(color: Colors.white70),
                                      ),
                                      const SizedBox(height: 24),

                                      Text(
                                        S.current.email_id,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Helper.verticalSpace(10),

                                      TextField(
                                        controller: emailController,
                                        decoration: InputDecoration(
                                          prefixIcon: const Icon(Icons.email_outlined, color: Colors.red),
                                          hintText: S.current.hint_entre_your_email_id,
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 16),

                                      Text(
                                        S.current.password,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Helper.verticalSpace(10),

                                      TextField(
                                        controller: passwordController,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          prefixIcon: const Icon(Icons.key, color: Colors.red),
                                          suffixIcon: const Icon(Icons.visibility, color: Colors.grey),
                                          hintText: S.current.password,
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),

                                      Obx(() {
                                        return SizedBox(
                                          width: double.infinity,
                                          height: 45,
                                          child: ElevatedButton(
                                            onPressed: userController.isLoading.value
                                                ? null
                                                : () => userController.login(
                                              emailController.text.trim(),
                                              passwordController.text.trim(),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.red,
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                            ),
                                            child: const Text("Login", style: TextStyle(fontSize: 18, color: Colors.white)),
                                          ),
                                        );
                                      }),
                                    ],
                                  ),
                                ),
                              )

                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// 🔹 Full-screen loading overlay
              Obx(() {
                if (userController.isLoading.value) {
                  return Container(
                    color: Colors.black.withOpacity(0.4),
                    child: const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }),
            ],
          ),
        ],
      ),
    );
  }
}
