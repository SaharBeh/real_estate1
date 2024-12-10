import 'package:flutter/material.dart';
import '/custom/BorderBox.dart';
import '/custom/OptionButton.dart';
import '/utils//sample_data.dart';
 import '/screens/NextPage.dart';
import '/utils/constants.dart';
import '/utils/custom_functions.dart';
import '/utils/widget_functions.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    double padding = 25;

    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
          body: SizedBox(
            width: size.width,
            height: size.height,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addVerticalSpace(padding),
                    Padding(
                      padding: sidePadding,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BorderBox(
                            height: 50,
                            width: 50,
                            child: Icon(
                              Icons.menu,
                              color: COLOR_BLACK,
                            ),
                          ),
                          BorderBox(
                            height: 50,
                            width: 50,
                            child: Icon(
                              Icons.settings,
                              color: COLOR_BLACK,
                            ),
                          ),
                        ],
                      ),
                    ),
                    addVerticalSpace(20),
                    Padding(
                      padding: sidePadding,
                      child: Text(
                        "City",
                        style: themeData.textTheme.bodyMedium,
                      ),
                    ),
                    addVerticalSpace(10),
                    Padding(
                      padding: sidePadding,
                      child: Text(
                        "San Francisco",
                        style: themeData.textTheme.displayLarge,
                      ),
                    ),
                    Padding(
                        padding: sidePadding,
                        child: const Divider(
                          height: 26,
                          color: COLOR_GREY,
                        )),



                    addVerticalSpace(10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: ["<\$220,000","For Sale","3-4 Beds",">1000 sqft"]
                            .map((filter) => ChoiceOption(text: filter)).toList(),
                      ),
                    ),
                    addVerticalSpace(10),
                    Expanded(
                      child: Padding(
                        padding: sidePadding,
                        child: ListView.builder(
                           physics: const BouncingScrollPhysics(),
                            itemCount: RE_DATA.length,
                            itemBuilder: (context, index) {
                              return RealEstateItem(
                                itemData: RE_DATA[index],
                              );
                            }),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 20,
                  width: size.width,
                  child: Center(
                    child: OptionButton(
                      icon: Icons.map_rounded,
                      text: "Map View",
                      width: size.width * 0.35,
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class ChoiceOption extends StatelessWidget {
  final String text;

  const ChoiceOption({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: COLOR_GREY.withAlpha(25),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      margin: const EdgeInsets.only(left: 25),
      child: Text(
        text,
        style: themeData.textTheme.headlineSmall,
      ),
    );
  }
}

class RealEstateItem extends StatelessWidget {
  final dynamic itemData;

  const RealEstateItem({
    Key? key,
    this.itemData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);



    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => NextPage(itemData: itemData)));
      },

      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(borderRadius: BorderRadius.circular(25.0),
                    child: Image.asset(itemData["image"])),
                const Positioned(
                    top: 15,
                    right: 15,
                    child: BorderBox(
                      width: 50,
                        height: 50,
                        child: Icon(
                          Icons.favorite_border,
                          color: COLOR_BLACK,
                        )))
              ],
            ),
            addVerticalSpace(15),
            Row(
              children: [
                Text(
                  formatCurrency(itemData["amount"]),
                  style: themeData.textTheme.displayLarge,
                ),
                addHorizontalSpace(10),
                Text(
                  "${itemData["address"]}",
                  style: themeData.textTheme.bodyMedium,
                )
              ],
            ),
            addVerticalSpace(10),
            Text(
              "${itemData["bedrooms"]} bedrooms / ${itemData["bathrooms"]} bathrooms / ${itemData["area"]} sqft",
              style: themeData.textTheme.headlineSmall,
            )
          ],
        ),
      ),
    );
  }
}



