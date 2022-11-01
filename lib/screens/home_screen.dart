import 'package:flutter/material.dart';
import 'package:flutter_assessment/constant/color.dart';
import 'package:flutter_assessment/constant/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'initial_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String image_selection(int i) {
    if (i == 1) {
      return image1;
    } else if (i == 2) {
      return image2;
    } else if (i == 3) {
      return image3;
    } else {
      return image4;
    }
  }

  Color ontap = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: MediaQuery.of(context).padding,
              child: const Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: MediaQuery.of(context).padding * 0.5,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(30)),
              child: const TextField(
                decoration: InputDecoration(
                    icon: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                    border: InputBorder.none,
                    hintStyle:
                        TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                    hintText: search),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: MediaQuery.of(context).padding * 0.5,
              child: const Text(
                categories,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: type.length,
                  itemBuilder: (context, i) {
                    return Container(
                      margin: const EdgeInsets.only(
                          top: 10, left: 5, right: 5, bottom: 5),
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                          color: i == 0
                              ? lightpink
                              : i == 1
                                  ? normalpink
                                  : gray,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          type[i],
                          style: const TextStyle(
                              color: Colors.black54, fontSize: 25),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, i) {
                    return Container(
                      margin: const EdgeInsets.only(
                          top: 5, left: 5, right: 5, bottom: 5),
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                          color: i == 0
                              ? lightpink
                              : i == 1
                                  ? normalpink
                                  : gray,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              doctors[i],
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 25),
                            ),
                          ),
                          Container(
                              height: MediaQuery.of(context).size.height * 0.20,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(image_selection(i)),
                              )))
                        ],
                      ),
                    );
                  }),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: MediaQuery.of(context).padding * 0.3,
              child: const Text(
                doctor,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.12,
              margin: MediaQuery.of(context).padding * 0.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: lightpink),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.19,
                      height: MediaQuery.of(context).size.height * 0.10,
                      decoration: BoxDecoration(
                          color: normalpink,
                          image:
                              const DecorationImage(image: AssetImage(image1)),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  const Center(
                    child: Text(
                      doctor_name,
                      style: TextStyle(color: normalpink, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                          color: normalpink,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                        child: Text(
                          "Call",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                final signupprefs = await SharedPreferences.getInstance();
                await signupprefs.clear();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const InitialScreen()),
                    (Route<dynamic> route) => false);
              },
              child: Container(
                width: MediaQuery.of(context).size.height * 0.15,
                height: MediaQuery.of(context).size.height * 0.06,
                margin: MediaQuery.of(context).padding * 0.2,
                decoration: BoxDecoration(
                    color: normalpink, borderRadius: BorderRadius.circular(20)),
                child: const Center(
                  child: Text(
                    "Log Out",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
