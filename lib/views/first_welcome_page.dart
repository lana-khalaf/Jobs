import 'package:flutter/material.dart';
import 'package:flutter_jobs_app/views/Second_welcome_page.dart';
import 'package:flutter_jobs_app/widgets/custom_buttom.dart';

class FirstWelcomePage extends StatelessWidget {
  const FirstWelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
     
      body:  Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:  Theme.of(context).brightness == Brightness.light ? AssetImage('assets/images/light.bg.png') : AssetImage('assets/images/dark_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
      child:Column(
        children: [
          Container(
      height: 386,
      width: 430,
    
      decoration: BoxDecoration(
         borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24)
                  ),
        image: DecorationImage(
          image: AssetImage(
              'assets/images/first_image.jpeg'),
        fit: BoxFit.cover
        ),
       
      ),
    ),
Padding(
  padding: const EdgeInsets.only(top: 40, bottom: 10),
  child:   Text("...مرحباً بكم في  ",
  
  textAlign: TextAlign.center,
  
  style: TextStyle(
  
    fontWeight: FontWeight.w700,
  
    fontSize: 24,
  
    fontFamily: "Cairo",

    color: Theme.of(context).colorScheme.primary
  
    
  
  ),),
),
Text("هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة",
textAlign: TextAlign.center,
style: TextStyle(
  color: Theme.of(context).colorScheme.primary
  ,
     fontWeight: FontWeight.w400,
  
    fontSize: 14,// كان 16
    // height: 11,
  
    fontFamily: "Cairo",

),),
Padding(
  padding: const EdgeInsets.only(top: 28, bottom: 79),
  child:   Row(
  
    mainAxisAlignment: MainAxisAlignment.center,
  
    children: [
  
           SizedBox(
  
      
  
        width: 35,
  
      
  
        height: 8,
  
      
  
      
  
      
  
        child:   LinearProgressIndicator(
  
      
  
        value: 1,
  
      
  
          color: Theme.of(context).colorScheme.primary,
  
      
  
        borderRadius: BorderRadius.circular(8),
  
      
  
       
  
      
  
        ),
  
      
  
      ),
  
      SizedBox(width: 8,),
  
      SizedBox(
  
      
  
        width: 8,
  
      
  
        height: 8,
  
      
  
      
  
      
  
        child:   LinearProgressIndicator(
  
      
  
        value: 1,
  
      
  
          color: Color(0xff969AA0),
  
      
  
        borderRadius: BorderRadius.circular(20),
  
      
  
       
  
      
  
        ),
  
      
  
      ),
  
    ],
  
  ),
),

Padding(
  padding: const EdgeInsets.only(top: 12, bottom: 4, left: 16, right: 16),
  child:   CustomButton(text: "التالي", colorText: Theme.of(context).colorScheme.onSecondary, press: (){
     Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return SecondWelcomePage();
                                  }));
    
  
  }, color:Theme.of(context).colorScheme.primary),
),
Padding(
  padding: const EdgeInsets.only(top: 15,bottom: 25, left: 16, right: 16 ),
  child:   CustomButton(text: "تخطي", colorBorder:Theme.of(context).colorScheme.primary,colorText:Theme.of(context).colorScheme.primary,color:Theme.of(context).colorScheme.onBackground  , press: (){
    Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return SecondWelcomePage();
                                  }));
    
  
  },
  ),
  
),

        ],
      ),
      ),
    );
  }
}