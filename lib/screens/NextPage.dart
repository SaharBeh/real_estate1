import 'package:flutter/material.dart';
import '/custom/BorderBox.dart';
import '/custom/OptionButton.dart';
import '/utils/constants.dart';
import '/utils/custom_functions.dart';
import '/utils/widget_functions.dart';
import '/custom/OptionButton.dart';

class NextPage extends StatelessWidget {
  final dynamic itemData;

  const NextPage({Key? key,required this.itemData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    const double padding = 25;
    const sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
        backgroundColor: COLOR_WHITE,
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.asset(itemData["image"]),
                        Positioned(
                          width: size.width,
                          top: padding,
                          child: Padding(
                            padding: sidePadding,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: const BorderBox(
                                    height: 50,
                                    width: 50,
                                    child: Icon(Icons.keyboard_backspace,color: COLOR_BLACK,),
                                  ),
                                ),
                                const BorderBox(

                                  width: 50,
                                  height: 50,
                                  child: Icon(Icons.favorite_border,color: COLOR_BLACK,),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    addVerticalSpace(padding),
                    Padding(
                      padding: sidePadding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(formatCurrency(itemData["amount"]),style: themeData.textTheme.displayLarge,),
                              addVerticalSpace(5),
                              Text("\$${itemData["address"]}",style: themeData.textTheme.titleSmall,),
                            ],
                          ),
                          BorderBox(


                            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),child: Text("20 Hours ago",style: themeData.textTheme.headlineSmall,),)
                        ],
                      ),
                    ),
                    addVerticalSpace(padding),
                    Padding(
                      padding: sidePadding,
                      child: Text("House Information",
                        style: themeData.textTheme.headlineMedium,),
                    ),
                    addVerticalSpace(padding),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          InformationTile(
                            content: "${itemData["area"]}"
                            ,name: "Square Foot",),
                          InformationTile(
                            content: "${itemData["bedrooms"]}"
                            ,name: "Bedrooms",),
                          InformationTile(
                            content: "${itemData["bathrooms"]}"
                              "",name: "Bathrooms",),
                          InformationTile(
                            content: "${itemData["garage"]}"
                            ,name: "Garage",)
                        ],
                      ),
                    ),
                    addVerticalSpace(padding),
                    Padding(
                      padding: sidePadding,
                      child: Text(
                        itemData["description"]
                        ,textAlign: TextAlign.justify,
                        style: themeData.textTheme.bodyMedium,),
                    ),
                    addVerticalSpace(100),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OptionButton(text: "Message",icon: Icons.message,width: size.width*0.35,),
                    addHorizontalSpace(10),
                    OptionButton(text: "Call",icon: Icons.call,width: size.width*0.35,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InformationTile extends StatelessWidget{

  final String content;
  final String name;

  const InformationTile({Key? key, required this.content, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    final double tileSize = size.width*0.20;
    return Container(
      margin: const EdgeInsets.only(left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BorderBox(
              width: tileSize,
              height: tileSize,
              child: Text(content,
                style: themeData.textTheme.displaySmall,)),
          addVerticalSpace(15),
          Text(name,style: themeData.textTheme.titleLarge,)
        ],
      ),
    );

  }

}
