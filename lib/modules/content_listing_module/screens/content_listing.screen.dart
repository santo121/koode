import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_app/global/styles/colors.styles.dart';

import '../../../global/models/data_models/alphabet_model.dart';
import '../../../global/styles/fonts.styles.dart';

class ContentListingScreen extends StatefulWidget {
  const ContentListingScreen({super.key, required this.title, required this.type});
final String title;
final int type;
  @override
  State<ContentListingScreen> createState() => _ContentListingScreenState();
}

class _ContentListingScreenState extends State<ContentListingScreen> {


@override
void initState() {
  super.initState();

 readJsonForHome();
 
}
  final player = AudioPlayer();
DataModel? localJsonData; 
    Future readJsonForHome() async {

setState(() {
                     player.pause();
                
              });
    final response = widget.type==4?
     await rootBundle.loadString('lib/global/models/numbers.json')
    :
    widget.type==3?
     await rootBundle.loadString('lib/global/models/commands.json')
    :
    widget.type==2?
     await rootBundle.loadString('lib/global/models/rhymes.json')
    :
        await rootBundle.loadString('lib/global/models/alphabet_data.json');
    final data = await json.decode(response);
    setState(() {
      localJsonData = DataModel.fromJson(data);
    });
}
@override
  void dispose() {
    // TODO: implement dispose
    player.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xFF40541D),
        elevation: 0,
        title:
        KStyles().bold20(text:   widget.title.toUpperCase(),color: Colors.white)
       ,
      ),
      body:
      (localJsonData.toString().isEmpty||localJsonData.toString()=='null')?
      const Center(child: CircularProgressIndicator(),):
       ListView.builder(
        physics:const BouncingScrollPhysics(),
        itemCount: localJsonData?.data?.length??0,
        itemBuilder: (BuildContext context, int index){
          return  Card(
            
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor:const Color(0xFF40541D) ,
                        child: 
                      KStyles().bold16(text: '${index+1}',color: kWhite),
                      ),
                      const SizedBox(width: 30,),
                      KStyles().bold30(text: '${(localJsonData?.data?[index].dataChar)!.toUpperCase()} '),
                    ],
                  ),
                   IconButton(  onPressed:
                  
                    ()async{
               
              setState(() {
                     player.pause();
                
              });
                    widget.type==4?
                    await player.play(AssetSource('Numbers/${index+1}${localJsonData?.data?[index].sound}')):
                    
                    await player.play(AssetSource('${localJsonData?.data?[index].sound}'));
                   },icon:const Icon(Icons.mic_sharp),color:const  Color(0xFF40541D),),
            
                ],
              ),
            ));
        }),
    );
  }
}