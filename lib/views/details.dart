import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stage_3/extensions/context.dart';
import 'package:stage_3/fonts.dart';
import 'package:stage_3/model/country_model.dart';

class DetailsPage extends StatefulWidget {
  final String countryName;
  final String population;
  final String region;
  final String capital;
  final String flag;
  final String coatOfArms;
  //final String motto;

  final String officialLang;
  //final String ethnicGroup;
  //final String religion;
  //final String government;

  final String independence;
  final String area;
  final String currency;
  //final String gdp;

  final String timeZone;
  //final String dateFormat;
  final String diallingCode;
  final String drivingSide;
  const DetailsPage(
      {super.key,
      required this.countryName,
      required this.population,
      required this.capital,
      //required this.motto,
      required this.officialLang,
      //required this.ethnicGroup,
      //required this.religion,
      //required this.government,
      required this.independence,
      required this.area,
      required this.currency,
      //required this.gdp,
      required this.timeZone,
      // required this.dateFormat,
      required this.diallingCode,
      required this.drivingSide,
      required this.region,
      required this.flag,
      required this.coatOfArms});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List cardList = [
      Image.network(
        widget.flag,
        fit: BoxFit.cover,
      ),
      Image.network(
        widget.coatOfArms,
        fit: BoxFit.cover,
      ),
    ];
    List<T> map<T>(List list, Function handler) {
      List<T> result = [];
      for (var i = 0; i < list.length; i++) {
        result.add(handler(i, list[i]));
      }
      return result;
    }

    var formatter = NumberFormat('#,###,000');

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: context.isDark ? Color(0xffF2F4F7) : Color(0xff1C1917),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          widget.countryName,
          style: TextStyle(
            fontFamily: Fonts.axiforma,
            fontWeight: FontWeight.w700,
            fontSize: 20.sp,
            color: context.isDark ? Color(0xffF2F4F7) : Color(0xff1C1917),
          ),
        ),
      ),
      backgroundColor: context.isDark ? Color(0xff000F24) : Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(right: 24, left: 24),
        child: Column(
          children: [
            Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.h,
                    autoPlay: false,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    pauseAutoPlayOnTouch: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: cardList.map((card) {
                    return Builder(builder: (BuildContext context) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: SizedBox(
                          width: 375.w,
                          child: Card(
                            color: Colors.transparent,
                            child: card,
                          ),
                        ),
                      );
                    });
                  }).toList(),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 170.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: map<Widget>(cardList, (index, url) {
                        return Container(
                          width: 5,
                          height: 5,
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentIndex == index
                                ? Colors.white
                                : Colors.grey[700],
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Population:',
                      style: TextStyle(
                        fontFamily: Fonts.axiforma,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: context.isDark
                            ? Color(0xffF2F4F7)
                            : Color(0xff1C1917),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      formatter.format(int.parse(widget.population)).toString(),
                      style: TextStyle(
                        fontFamily: Fonts.axiforma,
                        fontWeight: FontWeight.w300,
                        fontSize: 16.sp,
                        color: context.isDark
                            ? Color(0xffF2F4F7)
                            : Color(0xff1C1917),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Text(
                      'Region:',
                      style: TextStyle(
                        fontFamily: Fonts.axiforma,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: context.isDark
                            ? Color(0xffF2F4F7)
                            : Color(0xff1C1917),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      widget.region,
                      style: TextStyle(
                        fontFamily: Fonts.axiforma,
                        fontWeight: FontWeight.w300,
                        fontSize: 16.sp,
                        color: context.isDark
                            ? Color(0xffF2F4F7)
                            : Color(0xff1C1917),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Text(
                      'Capital:',
                      style: TextStyle(
                        fontFamily: Fonts.axiforma,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: context.isDark
                            ? Color(0xffF2F4F7)
                            : Color(0xff1C1917),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      widget.capital,
                      style: TextStyle(
                        fontFamily: Fonts.axiforma,
                        fontWeight: FontWeight.w300,
                        fontSize: 16.sp,
                        color: context.isDark
                            ? Color(0xffF2F4F7)
                            : Color(0xff1C1917),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Text(
                      'Official Language:',
                      style: TextStyle(
                        fontFamily: Fonts.axiforma,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: context.isDark
                            ? Color(0xffF2F4F7)
                            : Color(0xff1C1917),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      widget.officialLang,
                      style: TextStyle(
                        fontFamily: Fonts.axiforma,
                        fontWeight: FontWeight.w300,
                        fontSize: 16.sp,
                        color: context.isDark
                            ? Color(0xffF2F4F7)
                            : Color(0xff1C1917),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Independent:',
                      style: TextStyle(
                        fontFamily: Fonts.axiforma,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: context.isDark
                            ? Color(0xffF2F4F7)
                            : Color(0xff1C1917),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      widget.independence,
                      style: TextStyle(
                        fontFamily: Fonts.axiforma,
                        fontWeight: FontWeight.w300,
                        fontSize: 16.sp,
                        color: context.isDark
                            ? Color(0xffF2F4F7)
                            : Color(0xff1C1917),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Text(
                      'Area:',
                      style: TextStyle(
                        fontFamily: Fonts.axiforma,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: context.isDark
                            ? Color(0xffF2F4F7)
                            : Color(0xff1C1917),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      widget.area,
                      style: TextStyle(
                        fontFamily: Fonts.axiforma,
                        fontWeight: FontWeight.w300,
                        fontSize: 16.sp,
                        color: context.isDark
                            ? Color(0xffF2F4F7)
                            : Color(0xff1C1917),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Text(
                      'Currency:',
                      style: TextStyle(
                        fontFamily: Fonts.axiforma,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: context.isDark
                            ? Color(0xffF2F4F7)
                            : Color(0xff1C1917),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      widget.currency,
                      style: TextStyle(
                        fontFamily: Fonts.axiforma,
                        fontWeight: FontWeight.w300,
                        fontSize: 16.sp,
                        color: context.isDark
                            ? Color(0xffF2F4F7)
                            : Color(0xff1C1917),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(
                        'Time Zone:',
                        style: TextStyle(
                          fontFamily: Fonts.axiforma,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: context.isDark
                              ? Color(0xffF2F4F7)
                              : Color(0xff1C1917),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        widget.timeZone,
                        maxLines: 4,
                        style: TextStyle(
                          fontFamily: Fonts.axiforma,
                          fontWeight: FontWeight.w300,
                          fontSize: 16.sp,
                          color: context.isDark
                              ? Color(0xffF2F4F7)
                              : Color(0xff1C1917),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Dailing Code:',
                      style: TextStyle(
                        fontFamily: Fonts.axiforma,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: context.isDark
                            ? Color(0xffF2F4F7)
                            : Color(0xff1C1917),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      widget.diallingCode,
                      style: TextStyle(
                        fontFamily: Fonts.axiforma,
                        fontWeight: FontWeight.w300,
                        fontSize: 16.sp,
                        color: context.isDark
                            ? Color(0xffF2F4F7)
                            : Color(0xff1C1917),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Text(
                      'Driving Side:',
                      style: TextStyle(
                        fontFamily: Fonts.axiforma,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: context.isDark
                            ? Color(0xffF2F4F7)
                            : Color(0xff1C1917),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      widget.drivingSide,
                      style: TextStyle(
                        fontFamily: Fonts.axiforma,
                        fontWeight: FontWeight.w300,
                        fontSize: 16.sp,
                        color: context.isDark
                            ? Color(0xffF2F4F7)
                            : Color(0xff1C1917),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
