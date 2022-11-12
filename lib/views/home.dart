import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stage_3/extensions/context.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stage_3/fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 30),
          child: Image.asset(
            context.isDark
                ? 'assets/png/explore_white.png'
                : 'assets/png/ex_logo.png',
            height: 50.h,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SvgPicture.asset(
              'assets/svg/bulb.svg',
              height: 24,
              width: 24,
              color: context.isDark ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      backgroundColor: context.isDark ? Colors.black : Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Column(
          children: [
            SizedBox(
              height: 25.h,
            ),
            TextField(
              textAlign: TextAlign.center,
              cursorColor:
                  context.isDark ? Color(0xffEAECF0) : Color(0xff667085),
              keyboardType: TextInputType.text,
              autocorrect: false,
              style: TextStyle(
                fontFamily: Fonts.axiforma,
                fontWeight: FontWeight.w300,
                fontSize: 16.sp,
                color: context.isDark ? Color(0xffEAECF0) : Color(0xff667085),
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: context.isDark
                    ? const Color(0xff98A2B3).withOpacity(0.2)
                    : const Color(0xffF2F4F7),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: const EdgeInsets.only(
                    left: 15, bottom: 20, top: 20, right: 15),
                hintText: 'Search Country',
                hintStyle: TextStyle(
                  fontFamily: Fonts.axiforma,
                  fontWeight: FontWeight.w300,
                  fontSize: 16.sp,
                  color: context.isDark ? Color(0xffEAECF0) : Color(0xff667085),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.search,
                    color:
                        context.isDark ? Color(0xffEAECF0) : Color(0xff667085),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
