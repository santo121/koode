import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../global/styles/colors.styles.dart';
import '../../../global/styles/fonts.styles.dart';

class CommonCard extends StatelessWidget {
  const CommonCard({super.key, required this.image, required this.name,required this.onTap}); 
final String image;
final String name;
final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
                    flex: 2,
                     child: GestureDetector(
                      onTap: onTap,
                       child: Container(
                         
                        height: 180.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(image)),
                          borderRadius: BorderRadius.circular(20),
                          color: kWhite),
                          child: Container(
                            decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:const Color(0xFF000000).withOpacity(0.35)),
                            child: Center(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                KStyles().bold22(text:name,color:const Color(0xFFFFFFFF)),
                                SizedBox(
                                       height: 5.h,
                                     ),
                              ],
                            ),)),
                       ),
                     ),
                   );
  }
}