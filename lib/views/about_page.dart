import 'package:flutter/material.dart';
import 'package:hydroponics_app/views/components/about_text.dart';
import 'package:hydroponics_app/views/components/constants.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: headerPadding,
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Text("About",
                      style: headerTextStyle, textAlign: TextAlign.justify),
                  const Text("Vision", style: aboutTextStyleBold),
                  const AboutTextNormal(
                    "Due to Increasing population and urbanization, available "
                    "farming area is decreased and soil quality is decreasing "
                    "due to artificial fertilizers and uncertain farming "
                    "techniques. Farming is one of the good source of income "
                    "in our country and it's quality is decreasing day by day.",
                  ),
                  const SizedBox(height: sectionSpaceHeight),
                  const Text("Solution", style: aboutTextStyleBold),
                  const AboutTextNormal(
                      "Hydroponics is a soil less farming technique\n"
                      "Automation in hydroponics will boost crop growth\n"
                      "There is huge amount of water saving opportunities"),
                  const Text("Workflow", style: aboutTextStyleBold),
                  const Image(
                    image: AssetImage("assets/pics/Block diagram.png"),
                  ),
                  const SizedBox(height: sectionSpaceHeight),
                  const Text("Made By", style: aboutTextStyleBold),
                  const AboutTextNormal("Rishav Singh\nKashyap Joshi"),
                  const SizedBox(height: sectionSpaceHeight),
                  const Text("Mentor", style: aboutTextStyleBold),
                  const AboutTextNormal("Prof. Pinkesh Patel"),
                ],
              ),
            )
          ]),
    );
  }
}
