import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/home/views/home_page.dart';
import 'package:task_manager_app/utils/color_app.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController userNameController = TextEditingController();

    return Scaffold(
      backgroundColor: ColorApp.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorApp.backgroundColor,
        title: Text(
          'Login',
          style: TextStyle(color: ColorApp.textColor, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  backgroundColor: ColorApp.inputColor,
                  radius: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Welcome!',
                        style: TextStyle(
                          color: ColorApp.textColor,
                          fontSize: 26,
                        ),
                      ),
                      Icon(
                        Icons.sentiment_satisfied_alt_rounded,
                        color: ColorApp.textColor,
                        size: 40,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 60),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Tell us your name so we can',
                  style: TextStyle(color: ColorApp.textColor, fontSize: 24),
                  children: const <TextSpan>[
                    TextSpan(
                      text: " know how to call you ;)",
                      style: TextStyle(color: ColorApp.textColor, fontSize: 24),
                    )
                  ],
                ),
              ),
              SizedBox(height: 50),
              Text(
                'Name',
                style: TextStyle(color: ColorApp.textColor, fontSize: 22),
              ),
              SizedBox(height: 15),
              TextField(
                style: TextStyle(color: ColorApp.textColor),
                cursorColor: ColorApp.backgroundColor,
                controller: userNameController,
                decoration: InputDecoration(
                  hintText: "username",
                  hintStyle: TextStyle(color: ColorApp.textColor),
                  filled: true,
                  fillColor: ColorApp.inputColor,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: ColorApp.inputColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    String name = userNameController.text;
                    setState(() {
                      Get.off(
                      () => HomePage(
                        username: name,
                      ),

                    );
                    userNameController.clear();  
                    },);
                    
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(15),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: const [
                              ColorApp.inputColor,
                              ColorApp.topGradient
                            ])),
                    child: Text(
                      "Let's start",
                      style: TextStyle(color: ColorApp.subBackgroundColor),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
