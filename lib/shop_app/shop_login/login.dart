import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/components/components.dart';
import 'package:untitled/shop_app/shop_login/login_cubit/cubit.dart';
import 'package:untitled/shop_app/shop_login/login_cubit/states.dart';
import 'package:untitled/shop_app/shop_regestier/regestier.dart';
import 'package:untitled/styles/colors.dart';

class ShopLogin extends StatelessWidget {

  final  formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

   ShopLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit,ShopLoginStates>(
         listener: (context,state)
         {
           if (state is ShopLoginSuccessState)
           {
             if(state.loginModel.status!)
             {
               Fluttertoast.showToast(
                   msg: state.loginModel.message!,
                   toastLength: Toast.LENGTH_LONG,
                   gravity: ToastGravity.BOTTOM,
                   timeInSecForIosWeb: 5,
                   backgroundColor: Colors.green,
                   textColor: Colors.white,
                   fontSize: 16.0
               );
             }
             else
             {
               {
                 Fluttertoast.showToast(
                     msg: state.loginModel.message!,
                     toastLength: Toast.LENGTH_LONG,
                     gravity: ToastGravity.BOTTOM,
                     timeInSecForIosWeb: 5,
                     backgroundColor: Colors.red,
                     textColor: Colors.white,
                     fontSize: 16.0
                 );
               }
             }
           }
         },
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
                         TextFormField(
                         controller: emailController,
                         keyboardType: TextInputType.emailAddress,
                         obscureText: false,
                         validator: (value)
                          {
                           if(value!.isEmpty)
                            {
                             return('please enter email');
                            }
                            return null;

                          },
                         decoration:InputDecoration(
                         labelText: 'Email Address',
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(20.0),
                         ),
                         prefixIcon: Icon(Icons.email_outlined),
                         ),




                     ),
                         const SizedBox(height: 30.0,),
                         TextFormField(
                           controller: passwordController,
                           keyboardType: TextInputType.visiblePassword,
                           obscureText: false,
                           validator: (value)
                           {
                             if(value!.isEmpty)
                             {
                               return('please enter password');
                             }
                             return null;
                           },
                           decoration:InputDecoration(
                             labelText: 'Email Address',
                             border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(20.0),
                             ),
                             prefixIcon: Icon(Icons.lock_outline_rounded),
                             suffixIcon: Icon(Icons.remove_red_eye_outlined),
                           ),
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
                           builder: (context)=> Container(
                             width: double.infinity,
                             color: primarySwatch,
                             child: MaterialButton(
                               onPressed: ()
                               {
                                 if(formKey.currentState!.validate())
                                 {
                                   ShopLoginCubit.get(context).userLogin(
                                       email: emailController.text,
                                       password: passwordController.text
                                   );
                                 }
                               },
                               child: Text(
                                 'login'.toUpperCase(),
                                 style: const TextStyle(
                                   color: Colors.white,
                                   fontSize: 20.0,
                                 ),
                               ),

                             ),
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
