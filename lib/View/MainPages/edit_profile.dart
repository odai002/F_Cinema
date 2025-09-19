import 'package:cinema_reservations/Controller/Auth/signup_controller.dart';
import 'package:cinema_reservations/Core/Constant/colors.dart';
import 'package:cinema_reservations/View/Widget/CustomTextfailed.dart';
import 'package:cinema_reservations/View/Widget/CustomeButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Core/function/validate_input.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    SignupControllerImp controller = Get.put(SignupControllerImp());
    return Scaffold(
      appBar:AppBar(
        elevation: 8,
        shadowColor: Colors.black54,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
        ),
        title: const Text('Edit Profile',style:TextStyle(color:AppColors.grey50),),
        centerTitle: true,
        backgroundColor:AppColors.secondry,
      ),
      body:Form(
        key: controller.formstate1,
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 30),
            child:ListView(
              children:  [
                const SizedBox(height:15,),
                const Text("Edit Account",textAlign:TextAlign.center,style:TextStyle(fontSize:25,color:AppColors.secondry),)
                , const SizedBox(height:80,),
                Customtextfailed(iconData: Icons.person, hintText:"Enter your username", lableText: "Username",controller:controller.username,
                    validator:(val){
                      return validinput(val!, 3, 15, 'username');}
                ),
                const SizedBox(height:25,),
                Customtextfailed(iconData: Icons.email_outlined, hintText:"Enter your Email",
                    lableText: "Email",controller:controller.email,
                    validator:(val){
                      return validinput(val!, 10, 50, 'email');}),
                const SizedBox(height: 20,),
                Customtextfailed(iconData: Icons.phone, hintText:"Enter your phoneNumber", lableText: "Phone",controller:controller.phone,
                    validator:(val){
                      return validinput(val!, 10, 10, 'phone');}
                ),
                const SizedBox(height: 20,),
                GetBuilder<SignupControllerImp>(builder:(controller) =>
                    Customtextfailed(iconData: Icons.remove_red_eye_outlined, hintText: 'Enter your password', lableText: 'Password', controller: controller.password,
                        onTapIcon:(){
                          controller.ShowPassword();
                        },
                        obscureText:controller.issShowPassword,
                        validator:(val){
                          return validinput(val!, 8, 30, "password");}),),
                const SizedBox(height: 20,),
                GetBuilder<SignupControllerImp>(builder:(controller) => Customtextfailed(iconData: Icons.remove_red_eye_outlined,
                    hintText:"Confirm Password",
                    lableText: "Confirm Password",
                    controller: controller.Confirmpassword,
                    onTapIcon:(){
                      controller.ShowPassword();
                    },
                    obscureText:controller.issShowPassword,
                    validator:(val){
                      return validinput(val!, 8, 30, "confirm password");}
                )),
                const SizedBox(height:50,),
                Row(
                  crossAxisAlignment:CrossAxisAlignment.center,
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    Customebutton(text: 'Save', onPressed:controller.SignUp),
                    const SizedBox(width:15,),
                    Customebutton(text: 'Cancel', onPressed:controller.Cancel),
                  ],
                ),
                const SizedBox(height: 20,),
              ],
            )
        ),
      ),
    );
  }
}
