import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'dateTimepicker_uriLauncher_Fittedandfrectionally.dart';
class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Fahad Page",
          body: "this is our firsr Fahad & Fahad Page",
          image: Image.network(
            "https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg",
             width: 150,),
        ),
        PageViewModel(
          title: "Sami Page",
          body: "this is our firsr Sami  &Sami Page",
          image: Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp5zSqWJl-sGqUPuj_ijOXtJh4usg8_zf-aKCvtblhYg&s",
            width: 150,),
        ),
        PageViewModel(
          title: "sadh Page",
          body: "this is our firsr sadh &  sadh Page",
          image: Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFs63G06zMTIp9_cLRgTWN-z80IOzIGyT6aJOq5BrRHA&s",
            width: 150,),
        ),
      ],
      onDone: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DateTime_FractionallySized_Fitted_UriLuncherBoxScreen(),));
      },
done: Text("Done"),
      showSkipButton: true,
      showNextButton: true,
      skip: Text("Skip"),
  next: Icon(Icons.arrow_circle_right_rounded),
      dotsDecorator: DotsDecorator(
        size: Size(10.0, 10.0),
        activeColor: Colors.blue, color: Colors.black,
        activeSize: Size(30.0, 20.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        )
      ),
     );
  }
}
