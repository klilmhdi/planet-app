import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/screens/details_screen.dart';
import 'package:plant_app/share/constants.dart';

// widgets for Home Screen
// 1- app bar widget
AppBar buildAppBar() => AppBar(
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {},
      ),
    );

// 2- body widget
Widget buildHomeBody(context) {
  Size size = MediaQuery.of(context).size;
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headerWithSearchBox(context, size: size),
        titleWithMoreBtn(title: "Recommended", press: () {}),
        recommendsPlants(context),
        titleWithMoreBtn(title: "Featured Plants", press: () {}),
        featuredPlants(context),
        const SizedBox(height: defaultPadding),
      ],
    ),
  );
}

// in body I create many widgets, these body is:
// a- Title & more button
Widget titleWithMoreBtn({required String title, required Function press}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Row(
        children: [
          titleWithCustomUnderline(text: title),
          const Spacer(),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: primaryColor,
            onPressed: press(),
            child: const Text(
              "More",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );

// b- Title in underline for header in Recommended & Featured Plants
Widget titleWithCustomUnderline({required String text}) => Container(
      height: 24,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: defaultPadding / 4),
            child: Text(
              text,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.only(right: defaultPadding / 4),
              height: 7,
              color: primaryColor.withOpacity(0.2),
            ),
          )
        ],
      ),
    );

// c- Header with search box in drawing
Widget headerWithSearchBox(context, {required Size size}) => Container(
      margin: const EdgeInsets.only(bottom: defaultPadding * 2.5),
      // It will cover 20% of our total height
      height: size.height * 0.2,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: defaultPadding,
              right: defaultPadding,
              bottom: 36 + defaultPadding,
            ),
            height: size.height * 0.2 - 27,
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Row(
              children: [
                Text(
                  'Hi Khaleel 👋',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                CircleAvatar(backgroundImage: AssetImage("assets/images/app-icon.png"), radius: 40.0)
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 50,
                    color: primaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: primaryColor.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  SvgPicture.asset("assets/icons/search.svg"),
                ],
              ),
            ),
          ),
        ],
      ),
    );

// d- Recommended items widget
Widget recommendsPlants(context) => SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          recommendPlantCard(
            context,
            image: "assets/images/image_1.png",
            title: "Samantha",
            country: "Russia",
            price: 440,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailsScreen(),
                ),
              );
            },
          ),
          recommendPlantCard(
            context,
            image: "assets/images/image_2.png",
            title: "Angelica",
            country: "Croatia",
            price: 580,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailsScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );

// e- Recommended item card widget
Widget recommendPlantCard(
  context, {
  required String image,
  title,
  country,
  required int price,
  required VoidCallback? press,
}) {
  Size size = MediaQuery.of(context).size;
  return Container(
    margin: const EdgeInsets.only(
      left: defaultPadding,
      top: defaultPadding / 2,
      bottom: defaultPadding * 2.5,
    ),
    width: size.width * 0.4,
    child: MaterialButton(
      onPressed: press,
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Image.asset(image),
          Container(
            padding: const EdgeInsets.all(defaultPadding / 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 10),
                  blurRadius: 50,
                  color: primaryColor.withOpacity(0.23),
                ),
              ],
            ),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "$title\n".toUpperCase(),
                          style: Theme.of(context).textTheme.bodyMedium),
                      TextSpan(
                        text: "$country".toUpperCase(),
                        style: TextStyle(
                          color: primaryColor.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  '\$$price',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: primaryColor),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

// f- Features Plants items widget
Widget featuredPlants(context) => SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    children: [
      featurePlantCard(
        context,
        image: "assets/images/bottom_img_1.png",
        press: () {},
      ),
      featurePlantCard(
        context,
        image: "assets/images/bottom_img_2.png",
        press: () {},
      ),
    ],
  ),
);

// g- Features Plants item card widget
Widget featurePlantCard(context,
    {required String image, required Function press}) {
  Size size = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: press(),
    child: Container(
      margin: const EdgeInsets.only(
        left: defaultPadding,
        top: defaultPadding / 2,
        bottom: defaultPadding / 2,
      ),
      width: size.width * 0.8,
      height: 185,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(image),
        ),
      ),
    ),
  );
}

// widgets for Details Screen
// a- Build details widget, it have: Image, Icons, Details, and buttons
Widget buildDetailsBody(context) {
  Size size = MediaQuery.of(context).size;
  return Column(
    children: [
      imageAndIcons(context, size: size),
      SizedBox(height: 5.0),
      titleAndPrice(context,
          title: "Angelica", country: "Russia", price: 440),
      const SizedBox(height: 25.0),
      Row(
        children: [
          SizedBox(
            width: size.width / 2,
            height: 64,
            child: MaterialButton(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                ),
              ),
              color: primaryColor,
              onPressed: () {},
              child: const Text(
                "Buy Now",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Expanded(
            child: MaterialButton(
              onPressed: () {},
              child: const Text("Description"),
            ),
          ),
        ],
      ),
    ],
  );
}

// b- Details about planet
Widget titleAndPrice(context,
        {required String title, country, required int price}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$title\n",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: textColor, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: country,
                  style: const TextStyle(
                    fontSize: 20,
                    color: primaryColor,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Text(
            "\$$price",
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: primaryColor),
          )
        ],
      ),
    );

// c- Icons and image about planet
Widget imageAndIcons(context, {required Size size}) => SizedBox(
  height: size.height * 0.8,
  child: Row(
    children: [
      Expanded(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: defaultPadding * 3),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding),
                  icon: SvgPicture.asset("assets/icons/back_arrow.svg"),
                  onPressed: () {},
                ),
              ),
              const Spacer(),
              iconCard(context, icon: "assets/icons/sun.svg"),
              iconCard(context, icon: "assets/icons/icon_2.svg"),
              iconCard(context, icon: "assets/icons/icon_3.svg"),
              iconCard(context, icon: "assets/icons/icon_4.svg"),
            ],
          ),
        ),
      ),
      Container(
        height: size.height * 0.8,
        width: size.width * 0.75,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(63),
            bottomLeft: Radius.circular(63),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 10),
              blurRadius: 60,
              color: primaryColor.withOpacity(0.29),
            ),
          ],
          image: const DecorationImage(
            alignment: Alignment.centerLeft,
            fit: BoxFit.cover,
            image: AssetImage("assets/images/img.png"),
          ),
        ),
      ),
    ],
  ),
);

// d- icons card with shadow for imageAndIcons widget
Widget iconCard(context, {required String icon}) {
  Size size = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
    padding: const EdgeInsets.all(defaultPadding / 2),
    height: 62,
    width: 62,
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          offset: const Offset(0, 15),
          blurRadius: 22,
          color: primaryColor.withOpacity(0.22),
        ),
        const BoxShadow(
          offset: Offset(-15, -15),
          blurRadius: 20,
          color: Colors.black12,
        ),
      ],
    ),
    child: SvgPicture.asset(icon),
  );
}

// button navigation bar (optional : u can remove comment from home_screen to enable this widget)
/*
Widget buildBottomNavBar(context)=> Container(
      padding: const EdgeInsets.only(
        left: defaultPadding * 2,
        right: defaultPadding * 2,
        bottom: defaultPadding,
      ),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -10),
            blurRadius: 35,
            color: primaryColor.withOpacity(0.38),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: SvgPicture.asset("assets/icons/flower.svg"),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset("assets/icons/heart-icon.svg"),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset("assets/icons/user-icon.svg"),
            onPressed: () {},
          ),
        ],
      ),
    );
 */
