/*
* added two queries/commands:
* in androidManifest(android) and info.plist(ios) files to launch urls
*
* */


import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;  //import url_launcher package


class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Display"),
      ),
      body: Center( // center widget as it centers the child widget
        child: Column( // Column to arrange other widgets vertically
          mainAxisAlignment: MainAxisAlignment.center, // Align column to center
          children: [
            Flexible( // flexible helps its child widget to resize within its parent container
              child: Image.asset( // Image widget to display an image from the asset folder
                'assets/Task.jpeg',
                width: MediaQuery.of(context).size.width * 0.9, // this means image will take 90$ of the screen widht
                fit: BoxFit.cover, // i.e Image will cover its container
              ),
            ),
            SizedBox( // SizedBox widget to add some space b/w image and button
              height: 20, // height of the box
            ),
            launchUrlButton( //  custom function to create a button for launching url
              title: 'Click here for more details',
              onPressed: () { // Define onPressed function when the button is pressed
                launcher.launchUrl(Uri.parse('https://www.youtube.com'), // Launch YouTube URL
                    mode: launcher.LaunchMode.externalApplication); //  launch mode
              },
            ),
          ],
        ),
      ),
    );
  }

  // Function to create a button widget for launching URL
  Widget launchUrlButton({required String title, required Function() onPressed}) {
    return ElevatedButton(
      onPressed: onPressed, //  onPressed function for button press
      child: Text(title), //  text displayed on the button
    );
  }
}
