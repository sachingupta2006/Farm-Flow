import 'package:carousel_slider/carousel_slider.dart';
import 'package:farmfeeders/Utils/colors.dart';
import 'package:farmfeeders/Utils/texts.dart';
import 'package:farmfeeders/common/custom_appbar.dart';
import 'package:farmfeeders/common/custom_button.dart';
import 'package:farmfeeders/view/Side%20Menu/NavigateTo%20pages/NewsAndArticle/NewsCard.dart';
import 'package:farmfeeders/view/Side%20Menu/NavigateTo%20pages/NewsAndArticle/NewsData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NewsAndArticleMain extends StatefulWidget {
  const NewsAndArticleMain({super.key});

  @override
  State<NewsAndArticleMain> createState() => _NewsAndArticleState();
}

class _NewsAndArticleState extends State<NewsAndArticleMain> {
  ScrollController? _scrollviewcontroller;
  var sliderPage = 0.obs;
  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: customAppBar(
              text: "News & Article",
              actions: true,
              icon: GestureDetector(
                onTap: () {
                  Get.toNamed("/savedarticlemain");
                },
                child: Icon(
                  Icons.bookmark_rounded,
                  size: 26.sp,
                  color: Color(0xFF0E5F02),
                ),
              )),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0,
          titleSpacing: 0,
        ),
        backgroundColor: Colors.white,
        body: NestedScrollView(
          controller: _scrollviewcontroller,
          headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
            return <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 1,
                  (context, index) => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CarouselSlider.builder(
                        carouselController: CarouselController(),
                        itemCount: 5,
                        itemBuilder: (context, index, realIndex) {
                          return Container(
                            height: 180.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.blue.shade100,
                              borderRadius: BorderRadius.circular(15),
                              image: const DecorationImage(
                                  image:
                                      AssetImage("assets/images/newsback.png"),
                                  fit: BoxFit.fill),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 5.h,
                                  bottom: 4.h,
                                  right: 10.w,
                                  left: 10.w),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 28.h,
                                        width: 70.w,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF80B918),
                                          borderRadius:
                                              BorderRadius.circular(14),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Feed",
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      CircleAvatar(
                                          backgroundColor: Colors.transparent
                                              .withOpacity(0.28),
                                          radius: 15.r,
                                          child: Icon(
                                            Icons.bookmark_border_outlined,
                                            color: Colors.white,
                                          ))
                                    ],
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Text(
                                        "ABCIreland",
                                        style: TextStyle(
                                            color: Color(0xFFEEEEEE),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      CircleAvatar(
                                        backgroundColor: Color(0xFF80B918),
                                        radius: 7.r,
                                        child: Icon(
                                          Icons.check_rounded,
                                          color: Colors.white,
                                          size: 15.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        "•",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.sp),
                                      ),
                                      Text(
                                        "6 Hours ago",
                                        style: TextStyle(
                                            color: Color(0xFFEEEEEE),
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w300),
                                      )
                                    ],
                                  ),
                                  Text(
                                    "Sustainable Farming Boosts Yields, Preserves Soil",
                                    style: TextStyle(
                                        color: Color(0xFFEEEEEE),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        options: CarouselOptions(
                            enlargeCenterPage: true,
                            autoPlay: true,
                            height: 169.h,
                            autoPlayAnimationDuration:
                                const Duration(seconds: 3),
                            viewportFraction: 0.8,
                            onPageChanged: (index, reason) {
                              setState(() {
                                sliderPage.value = index;
                              });
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    textBlack18W600Mon("Latest News"),
                  ],
                ),
                Expanded(
                    child: GestureDetector(
                        onTap: () {
                          Get.toNamed("/articledetails");
                        },
                        child: newsCard()))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
