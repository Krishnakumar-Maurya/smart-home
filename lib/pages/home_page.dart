import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarthome/util/smartdevicebox.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double horizontalpadding = 40;

  final double verticalpadding = 25;

  //list of devices
  List mySmartDevices = [
//[smartDeviceName, iconpath, powerstatus]
    ["Smart Light", "lib/icons/smart-light.png", true],
    ["Smart AC", "lib/icons/smart-ac.png", false],
    ["Smart TV", "lib/icons/smart-TV.png", false],
    ["Smart Fan", "lib/icons/fan.png", false],
  ];

  //power button switched
  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //menu icon
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalpadding, vertical: verticalpadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'lib/icons/menu.png',
                    height: 30,
                    color: Colors.grey,
                  ),

                  //account icon
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalpadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Home,',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text('KRISHNA',
                      style: GoogleFonts.bebasNeue(
                          fontSize: 72, color: Colors.grey[800])),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //smart devices grid

            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalpadding),
              child: Text(
                'Smart Devices',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            Expanded(
                child: GridView.builder(
                    padding: EdgeInsets.all(25),
                    itemCount: mySmartDevices.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                    itemBuilder: (context, index) {
                      return SmartDeviceBox(
                        smartDeviceName: mySmartDevices[index][0],
                        iconPath: mySmartDevices[index][1],
                        powerOn: mySmartDevices[index][2],
                        onChanged: (value) => powerSwitchChanged(value, index),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
