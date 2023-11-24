import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_app/global/styles/colors.styles.dart';
import 'package:student_app/modules/content_listing_module/screens/content_listing.screen.dart';

import '../../../global/styles/fonts.styles.dart';
import '../widgets/common_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FilePickerResult? result;
  List<File?> file = [];
  final player = AudioPlayer();
  bool isPlay = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          physics:const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CommonCard(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ContentListingScreen(
                                    type: 1,
                                    title: 'Alphabets',
                                  )),
                        );
                      },
                      image: 'assets/alphabets.jpg',
                      name: "Alphabets",
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    CommonCard(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ContentListingScreen(
                                    type: 2,
                                    title: 'Rhymes',
                                  )),
                        );
                      },
                      image: 'assets/rhymes.jpg',
                      name: "Rhymes",
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    CommonCard(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ContentListingScreen(
                                    type: 3,
                                    title: 'Commands',
                                  )),
                        );
                      },
                      image: 'assets/commands.jpg',
                      name: "Commands",
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    CommonCard(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ContentListingScreen(
                                    type: 4,
                                    title: 'Numbers',
                                  )),
                        );
                      },
                      image: 'assets/numbers.jpg',
                      name: "Numbers",
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.w,
                ),
                Column(
                    children: List.generate(file.length, (index) {
                  return Card(
                      child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: const Color(0xFF40541D),
                              child: KStyles()
                                  .bold16(text: '${index + 1}', color: kWhite),
                            ),
                            const SizedBox(width: 30,),
                            SizedBox(
                              width: 100,
                              child: KStyles().bold10(text: '${(file[index]!.path).toUpperCase()} ')),
                          ],
                        ),
                        IconButton(
                          onPressed: () async {
                            if(isPlay){
                              setState(() {
                                isPlay = false;
                              player.pause();
                            });
                            }else{
                              setState(() {
                                  isPlay = true;
                              player.pause();
                            });
                            await player
                                .play(DeviceFileSource(file[index]!.path));
                            }
                           
                          },
                          icon:const Icon(Icons.play_arrow),
                          color: const Color(0xFF40541D),
                        ),
                      ],
                    ),
                  ));
                }))
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF40541D),
        onPressed: () async {
          result = await FilePicker.platform.pickFiles(type: FileType.audio);

          if (result != null) {
            setState(() {
              file.add(File(result!.files.single.path!));
            });
          } else {
            // User canceled the picker
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
