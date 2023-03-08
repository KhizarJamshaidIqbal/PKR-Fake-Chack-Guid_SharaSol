// ignore_for_file: prefer_const_constructors, sort_child_properties_last, file_names, unused_element, non_constant_identifier_names, unused_import, unused_field, prefer_final_fields, prefer_const_literals_to_create_immutables, avoid_print, deprecated_member_use, avoid_unnecessary_containers

import 'package:cruency_note_app/views/Screens/PNI.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/PrivacyPolicy.dart';
import '../components/static_PNI.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  dynamic list = Pakistan_Note_api.PNI_data;

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: _appbar_main,
          drawer: _drawer_main,
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  // shrinkWrap: true,
                  itemCount: list.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 5),
                      child: InkWell(
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PNI_details(
                                  imgeUrl: list[index]["PNI_Images"],
                                  Title: list[index]["RS"],
                                  initialIndex: index,
                                ),
                              ));
                        }),
                        child: SizedBox(
                          width: double.infinity,
                          height: 170,
                          child: Image.asset(
                            "${list[index]["thumbnailUrl"]}",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }

  Drawer get _drawer_main => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xff1C6758),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: SizedBox(
                    height: 350,
                    width: 350,
                    child: Image(
                        image: AssetImage(
                            "asset/images/PKR Fake Check Guide.png")),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                children: [
                  ListTile(
                    title: const Text(
                      'Share',
                      style: TextStyle(
                          color: Color(0xff1C6758),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Inter"),
                    ),
                    leading: Icon(
                      Icons.share,
                      color: Color(0xff1C6758),
                    ),
                    onTap: () async {
                      try {
                        Share.share(
                            "https://play.google.com/store/apps/details?id=com.sharasol.PKR_Fake_Check_Guide");
                      } catch (e) {
                        print(e.toString());
                      }
                    },
                  ),
                  ListTile(
                    title: const Text(
                      'Rate Us',
                      style: TextStyle(
                          color: Color(0xff1C6758),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Inter"),
                    ),
                    leading: Icon(
                      Icons.star_border,
                      color: Color(0xff1C6758),
                    ),
                    onTap: () {
                      StoreRedirect.redirect(
                        androidAppId: "com.sharasol.PKR_Fake_Check_Guide",
                      );
                    },
                  ),
                  ListTile(
                    title: const Text(
                      'More Apps',
                      style: TextStyle(
                          color: Color(0xff1C6758),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Inter"),
                    ),
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: SizedBox(
                        height: 25,
                        width: 20,
                        child: Image(
                            image:
                                AssetImage("asset/images/More_Apps_Icon.png")),
                      ),
                    ),
                    onTap: () {
                      _launchURL(
                          "https://play.google.com/store/apps/dev?id=8994386378575122109&hl=en_IN");
                    },
                  ),
                  ListTile(
                    title: const Text(
                      'Feedback',
                      style: TextStyle(
                          color: Color(0xff1C6758),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Inter"),
                    ),
                    leading:
                        Icon(Icons.feedback_outlined, color: Color(0xff1C6758)),
                    onTap: () {
                      launch('mailto:contact@sharasol.com');
                    },
                  ),
                  ListTile(
                    title: const Text(
                      'Privacy Policy',
                      style: TextStyle(
                          color: Color(0xff1C6758),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Inter"),
                    ),
                    leading: Icon(Icons.privacy_tip_outlined,
                        color: Color(0xff1C6758)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PrivacyPolicy(),
                          ));
                    },
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Version ",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff1C6758),
                            fontWeight: FontWeight.w600,
                            fontFamily: "Inter"),
                      ),
                      Text(
                        "1.0.0+1",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff1C6758),
                            fontWeight: FontWeight.w600,
                            fontFamily: "Inter"),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      );
  AppBar get _appbar_main => AppBar(
        centerTitle: true,
        title: Text(
          "PKR Fake Check Guide",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, fontFamily: "Inter"),
        ),
        backgroundColor: const Color(0xff1C6758),
      );
}
