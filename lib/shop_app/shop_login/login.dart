import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/components/components.dart';
import 'package:untitled/shop_app/shop_login/login_cubit/cubit.dart';
import 'package:untitled/shop_app/shop_login/login_cubit/states.dart';
import 'package:untitled/shop_app/shop_regestier/regestier.dart';
import 'package:untitled/styles/colors.dart';

class ShopLogin extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit,ShopLoginStates>(
         listener: (context,state){},
         builder: (context,state)
         {
           return Scaffold(
             body: Center(
               child: SingleChildScrollView(
                 child: Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: Form(
                     key: formKey,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         const Text(
                           'LOGIN NOW',
                           style: TextStyle(
                             fontSize: 30.0,
                             fontWeight: FontWeight.bold,
                             color: primarySwatch,
                           ),
                         ),
                         const SizedBox(height: 30.0,
                         ),
                         defaultTextFormField(
                           controller: emailController,
                           keyboardType: TextInputType.emailAddress,
                           validator: (value)
                           {
                             if(value == null || value.isEmpty)
                             {
                               return'email address must not be empty';
                             }
                           },
                           labelText: 'Email Address',
                           prefix: const Icon(Icons.email_outlined),
                           radius: const Radius.circular(40),
                         ),
                         const SizedBox(height: 30.0,),
                         defaultTextFormField(
                           controller: passwordController,
                           keyboardType: TextInputType.visiblePassword,
                           validator: (value)
                           {
                             if(value == null || value.isEmpty)
                             {
                               return'password must not be empty';
                             }
                           },
                           labelText: 'Password',
                           prefix: const Icon(Icons.lock_outline_rounded),
                           suffix: const Icon(Icons.remove_red_eye_outlined),
                           radius: const Radius.circular(40),
                         ),
                         const SizedBox(height: 20.0,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text(
                               'Don\'t have an account ?',
                               style: TextStyle(
                                 fontSize: 15.0,
                                 fontWeight: FontWeight.bold,
                                 color: Colors.grey[700],
                               ),
                             ),
                             defaultTextButton(
                                 width: 135.0,
                                 text: 'Regestier now',
                                 function: ()
                                 {
                                   navigateTo(context,const RegestierScreen());
                                 }
                             ),
                           ],
                         ),
                         const SizedBox(height: 20.0,),
                         ConditionalBuilder(
                           condition: state is! ShopLoginLoadingState,
                           builder: (context)=> defaultButton(
                               text: 'Login',
                               function: ()
                               {
                                 if(formKey.currentState!.validate())
                                 {
                                   ShopLoginCubit.get(context).userLogin(
                                       email: emailController.text,
                                       password: passwordController.text
                                   );
                                 }
                               }
                           ),
                           fallback: (context)=> const Center(child: CircularProgressIndicator(
                             color: Colors.teal,
                           ),),
                         ),
                       ],
                     ),
                   ),
                 ),
               ),
             ),

           );
         },
      ),
    );
  }
}
