import 'package:cinema_reservations/Controller/Auth/login_controller.dart';
import 'package:cinema_reservations/Core/Constant/colors.dart';
import 'package:cinema_reservations/Core/function/validate_input.dart';
import 'package:cinema_reservations/View/Widget/CustomTextfailed.dart';
import 'package:cinema_reservations/View/Widget/Custom_Appar.dart';
import 'package:cinema_reservations/View/Widget/CustomeButton.dart';
import 'package:cinema_reservations/View/Widget/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Core/Constant/Responsive.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {

   double h = Responsive.getHeight(context);
   double w = Responsive.getWidth(context);

   LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      appBar:AppBar(
          elevation: 8,
          shadowColor: Colors.black54,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
          ),
          title: const Text('Login',style:TextStyle(color:AppColors.grey50),),
          centerTitle: true,
          backgroundColor:AppColors.secondry,
        ),
      body:Form(
        key:controller.formstate,
        child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 30),
            child:ListView(
            children:  [
              const Logo(),
              const SizedBox(height:15,),
              const Text("Welcome Back",textAlign:TextAlign.center,style:TextStyle(fontSize:25,color:AppColors.secondry),)
             , const SizedBox(height:10,),
              const Text("Login with your email and password",textAlign:TextAlign.center,style:TextStyle(fontSize:15,color:AppColors.grey200),),
              const SizedBox(height:80,),
              Customtextfailed(iconData: Icons.email_outlined, hintText: 'Enter your email', lableText: 'Email', controller: controller.email,
                validator:(val){
                return validinput(val!, 5, 50, "email");
              },),
              const SizedBox(height:25,),
              GetBuilder<LoginControllerImp>(builder:(controller) =>
                 Customtextfailed(iconData: Icons.remove_red_eye_outlined, hintText: 'Enter your password', lableText: 'Password', controller: controller.password,
                    onTapIcon:(){
                      controller.ShowPassword();
                    },
                     obscureText:controller.issShowPassword,
                  validator:(val){
                    return validinput(val!, 8, 30, "password");}),
              ),
              const SizedBox(height: 10,),
              Align(
                alignment: Alignment.bottomRight,
                child: Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.only(bottom: 5,right:10),
                          decoration: const BoxDecoration(
                          border: Border(
                          bottom: BorderSide(
                          color: AppColors.grey100,
                          width: 1.5,
                          )),
                          ),
                        child: InkWell(
                          onTap: () {
                          },
                          child:const Text("Forgot Password ?",style: TextStyle(fontSize:14),),
              ),
              )
              ]
                )
              ),
              const SizedBox(height:40,),
              GetBuilder<LoginControllerImp>(builder:(controller) =>
                  Customebutton(text: 'Login',onPressed:(){
                    controller.Login();
                  },)),
              const SizedBox(height: 20,),
                Row(
                 mainAxisAlignment:MainAxisAlignment.end,
                 children: [
                   const Align(
                    alignment: Alignment.bottomRight,
                    child:Text('Dont have you an account ?',style:TextStyle(fontSize:14),),
                   ),
                   const SizedBox(width:5,),
                   Container(
                     padding: const EdgeInsets.only(bottom: 5,right:10),
                     decoration: const BoxDecoration(
                       border: Border(
                           bottom: BorderSide(
                             color: AppColors.grey100,
                             width: 1.5,
                           )),
                     ),
                     child:  InkWell(
                       onTap: (){
                         controller.ToSignUp();
                       },
                       child:const Text('Create Account',style:TextStyle(fontSize:14),),
                     ),
                   )
                 ],
               )
        ],
            )
          ),
      ),
      );
  }
}
