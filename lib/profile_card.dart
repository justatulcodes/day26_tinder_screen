import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:day26_tinder_screen/sample_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard(
      {super.key, required this.profile, required this.controller});

  final Profile profile;
  final AppinioSwiperController controller;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 50,
        shadowColor: const Color(0x33eeeef6),
        color: const Color(0xFFfdfdfd),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25))),
        child: Column(
          children: [
            Expanded(
              child: Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                          image: AssetImage(profile.image), fit: BoxFit.cover)),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      gradient: LinearGradient(
                        colors: [
                          Colors.black87,
                          Colors.transparent,
                          Colors.transparent
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.center,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.maxFinite,
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {},
                                style: const ButtonStyle(
                                    padding: MaterialStatePropertyAll(
                                        EdgeInsets.all(12)),
                                    alignment: Alignment.center,
                                    backgroundColor: MaterialStatePropertyAll(
                                        Color(0x99000000)),
                                    shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))))),
                                child: Text(
                                  profile.distanceInKm,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                          const Spacer(flex: 1),
                          Text(
                            "${profile.name}, ${profile.age}",
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                          Text(
                            profile.qualities,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Ink(
                    decoration: const ShapeDecoration(
                        color: Color(0xFFffd1e6),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)))),
                    child: IconButton(
                        splashRadius: 30,
                        onPressed: () {
                          controller.swipeLeft();
                        },
                        padding: const EdgeInsets.all(20),
                        icon: SvgPicture.asset(
                          "assets/images/cross.svg",
                          width: 50,
                          height: 50,
                        )),
                  ),
                  Ink(
                    decoration: const ShapeDecoration(
                        color: Color(0xFFff67ae),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)))),
                    child: IconButton(
                        splashRadius: 30,
                        alignment: Alignment.center,
                        onPressed: () {
                          controller.swipeRight();
                        },
                        padding: const EdgeInsets.all(20),
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.white,
                          size: 25,
                        )),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
