import 'package:flutter/material.dart';
import 'package:vmodel/src/res/colors.dart';
import 'package:vmodel/src/res/icons.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/buttons/primary_button.dart';
import 'package:vmodel/src/shared/rend_paint/render_svg.dart';
import 'package:vmodel/src/vmodel.dart';


class SendWidget extends StatefulWidget {
  const SendWidget({Key? key}) : super(key: key);

  @override
  State<SendWidget> createState() => _SendWidgetState();
}

class _SendWidgetState extends State<SendWidget> {

  List mockData = [
    {
      "title": "Georgina Powell",
      "subtitle": "Sounds good!",
      "selected": false,
      "image":'assets/images/doc/main-model.png'
    },

    {
      "title": "Samantha",
      "subtitle": "Sounds good!",
      "selected": false,
      "image": 'assets/images/feed_models/m1.jpg',
    },

    {
      "title": "Georgina Powell",
      "subtitle": "Sounds good!",
      "selected": false,
      "image":  'assets/images/feed_models/m5.jpg',
    },

    {
      "title": "Georgina Powell",
      "subtitle": "Sounds good!",
      "selected": false,
      "image": 'assets/images/doc/main-model.png',
    },

    {
      "title": "Georgina Powell",
      "subtitle": "Sounds good!",
      "selected": false,
      "image": 'assets/images/feed_models/m6.jpg',
    },

    {
      "title": "Georgina Powell",
      "subtitle": "Sounds good!",
      "selected": false,
      "image":  'assets/images/feed_models/m10.jpg',
    },

  ];

  List selectedList = [];


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(8),
              topLeft: Radius.circular(8))
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 5,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: VmodelColors.primaryColor.withOpacity(0.15),
                ),
              ),
            ),

            vmSizedH(15),

            Text("Send to", style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: VmodelColors.primaryColor, fontSize: 16, fontWeight: FontWeight.w600
            ),),

            vmSizedH(15),

            TextFormField(
              decoration: InputDecoration(
                suffixIcon:
               const  Padding(
                  padding:  EdgeInsets.symmetric(horizontal :10.0, vertical: 6),
                  child:  NormalRenderSvg(svgPath: VIcons.searchNormal,
                  ),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: VmodelColors.primaryColor.withOpacity(0.15))),
                hintStyle: Theme.of(context).textTheme.displayMedium?.copyWith(color: VmodelColors.primaryColor.withOpacity(0.15)),
                hintText: "Search...",
                constraints: const BoxConstraints(maxHeight: 40),
                contentPadding: const VWidgetsContentPadding.only(),
              ),
            ),

            vmSizedH(10),

            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                  itemCount: mockData.length,
                  itemBuilder: (context, index){
                    return SendOption(
                      imagePath: mockData[index]["image"],
                      title: mockData[index]["title"],
                      subtitle: mockData[index]["subtitle"],
                      selected: mockData[index]["selected"],
                    onTap: (){
                      setState(() {
                        mockData[index]["selected"] = !mockData[index]["selected"];
                        if(mockData[index]["selected"] == true){
                          selectedList.add(mockData[index]["selected"]);
                        }else{
                          selectedList.removeAt(0);
                        }});},);
                },
              ),
            ),


        addVerticalSpacing(15),
         VWidgetsPrimaryButton(
           buttonTitle: "Send",
             enableButton: selectedList.isNotEmpty ? true : false,
             onPressed: (){}
         ),
         addVerticalSpacing(20)

          ],

        ),
      ),
    );
  }
}



class SendOption extends StatelessWidget {const SendOption({Key? key, required this.title,
  required this.imagePath, required this.onTap, required this.selected, required this.subtitle}) : super(key: key);


  final String title;
  final String subtitle;
  final String imagePath;
  final Function () onTap;
  final bool selected;


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [


          Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover)),
                ),

                vmSizedW(8),

                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(title, style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          color: VmodelColors.primaryColor, fontSize: 14, fontWeight: FontWeight.w600
                      ), maxLines: 1, overflow: TextOverflow.ellipsis,),

                      vmSizedH(4),

                      Text(subtitle, style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          color: const Color.fromRGBO(80, 60, 59, 0.35), fontSize: 12, fontWeight: FontWeight.w500
                      ), maxLines: 1, overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selected ? VmodelColors.primaryColor : VmodelColors.white,
                  border: Border.all(width: 1.5, color: VmodelColors.primaryColor)
              ),
              height: 20, width: 20,
              child: Center(child: Icon(Icons.check, color: VmodelColors.white, size: 15,),),
            ),
          ),
        ],)
    );
  }
}

