import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:day26_tinder_screen/profile_card.dart';
import 'package:day26_tinder_screen/sample_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

//https://dribbble.com/shots/15286257/attachments/7040001?mode=media
void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AppinioSwiperController controller = AppinioSwiperController();
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFf9f9fe),
        statusBarIconBrightness: Brightness.dark));

    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFf9f9fe),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30,
        backgroundColor: const Color(0xFFECECF2),
        unselectedItemColor: const Color(0xFFd4e8f3),
        selectedItemColor: const Color(0xFFff67ad),
        items: const [
          BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.home_rounded,
              )),
          BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.favorite_rounded,
              )),
          BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.message_rounded,
              )),
          BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.person_2_rounded,
              )),
        ],
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Location",
                            style:
                                TextStyle(fontSize: 14, color: Colors.black38),
                          ),
                          IconButton(
                              onPressed: () {},
                              splashRadius: 2,
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.all(2),
                              icon: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Color(0xFFff67ad),
                                size: 18,
                              ))
                        ],
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Color(0xFFff67ad),
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Bali,",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Indonasia",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400))
                        ],
                      )
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/images/search.svg",
                      width: 22,
                      height: 22,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/images/bell.svg",
                      width: 22,
                      height: 22,
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFff67ad), width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          enabledBorder: InputBorder.none,
                          prefixIcon: IconButton(
                            splashRadius: 20,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/images/search.svg",
                            ),
                            color: Colors.black26,
                            iconSize: 22,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          hintText: "Search Partner",
                          hintStyle: const TextStyle(
                              color: Colors.black26,
                              fontWeight: FontWeight.w400,
                              fontSize: 16)),
                      style: const TextStyle(
                          backgroundColor: Colors.transparent,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Ink(
                    decoration: const ShapeDecoration(
                        color: Color(0xFFff67ad),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12)))),
                    child: IconButton(
                        splashRadius: 1,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.tune_rounded,
                          color: Colors.white,
                          size: 20,
                        )),
                  )
                ],
              ),
            ),
            Expanded(
              child: Stack(children: [
                const SizedBox(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: Center(
                    heightFactor: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_outline_rounded,
                          color: Color(0x66ff67ad),
                          size: 50,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "That's all for now :)",
                          style: TextStyle(
                              color: Colors.black38,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                AppinioSwiper(
                  backgroundCardsCount: 2,
                  swipeOptions: const AppinioSwipeOptions.all(),
                  unlimitedUnswipe: true,
                  controller: controller,
                  unswipe: _unswipe,
                  onSwiping: (AppinioSwiperDirection direction) {
                    debugPrint(direction.toString());
                  },
                  onSwipe: _swipe,
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 20,
                    bottom: 40,
                  ),
                  onEnd: _onEnd,
                  cardsCount: profileList.length,
                  cardsBuilder: (BuildContext context, int index) {
                    return ProfileCard(
                        profile: profileList[index], controller: controller);
                  },
                ),
              ]),
            )
          ],
        ),
      ),
    ));
  }

  void _swipe(int index, AppinioSwiperDirection direction) {
    debugPrint("the card was swiped to the: ${direction.name}");
  }

  void _unswipe(bool unswiped) {
    if (unswiped) {
      debugPrint("SUCCESS: card was unswiped");
    } else {
      debugPrint("FAIL: no card left to unswipe");
    }
  }

  void _onEnd() {
    debugPrint("end reached!");
  }
}
