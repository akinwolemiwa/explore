import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stage_3/extensions/context.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stage_3/fonts.dart';
import 'package:stage_3/model/country_model.dart';
import 'package:stage_3/services/country_model_service.dart';
import 'package:stage_3/views/details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();
  @override
  void initState() {
    countryList();
    super.initState();
  }

  Future<CountryDataModel> countryList() async {
    final result = await CountryModelService().getCountryData();
    return result;
  }

  String searchString = '';

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
          context.isDark
              ? Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: SvgPicture.asset(
                    'assets/svg/moon.svg',
                    height: 24,
                    width: 24,
                    color: Color(0xffEAECF0),
                  ))
              : Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: SvgPicture.asset(
                    'assets/svg/sun.svg',
                    height: 24,
                    width: 24,
                    color: Colors.black,
                  ),
                ),
        ],
      ),
      backgroundColor: context.isDark ? Color(0xff000F24) : Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25.h,
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    searchString = value;
                  });
                },
                controller: searchController,
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
                    color:
                        context.isDark ? Color(0xffEAECF0) : Color(0xff667085),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.search,
                      color: context.isDark
                          ? Color(0xffEAECF0)
                          : Color(0xff667085),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        width: 1,
                        color: context.isDark
                            ? Color(0xffD0D5DD)
                            : Color(0xffA9B8D4),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: SvgPicture.asset(
                              'assets/svg/world.svg',
                              height: 24,
                              width: 24,
                              color: context.isDark
                                  ? Color(0xffD0D5DD)
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            'EN',
                            style: TextStyle(
                              fontFamily: Fonts.axiforma,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: context.isDark
                                  ? Color(0xffD0D5DD)
                                  : Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        width: 1,
                        color: context.isDark
                            ? Color(0xffD0D5DD)
                            : Color(0xffA9B8D4),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: SvgPicture.asset(
                              'assets/svg/filter.svg',
                              height: 24,
                              width: 24,
                              color: context.isDark
                                  ? Color(0xffD0D5DD)
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            'Filter',
                            style: TextStyle(
                              fontFamily: Fonts.axiforma,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: context.isDark
                                  ? Color(0xffD0D5DD)
                                  : Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              // Text(
              //   'A',
              //   style: TextStyle(
              //     fontFamily: Fonts.axiforma,
              //     fontWeight: FontWeight.w400,
              //     fontSize: 14.sp,
              //     color: context.isDark ? Color(0xffD0D5DD) : Colors.black,
              //   ),
              // ),
              SizedBox(
                height: 20.h,
              ),
              FutureBuilder<CountryDataModel>(
                future: countryList(),
                builder: (BuildContext context, snapshot) {
                  snapshot.data?.countryList!.sort((a, b) => a.name!.common!
                      .compareTo(b.name!.common!)); //sort list alphabetically
                  CountryDataModel? data = snapshot.data;
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      break;
                    case ConnectionState.waiting:
                      return Center(
                        child: Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 60.h,
                            width: 60.w,
                            child: CircularProgressIndicator(
                              strokeWidth: 1,
                              color: context.isDark
                                  ? Color(0xffF2F4F7)
                                  : Color(0xff1C1917),
                            ),
                          ),
                        ),
                      );
                    case ConnectionState.active:
                      break;
                    case ConnectionState.done:
                      return snapshot.hasData
                          ? ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.data!.countryList!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return snapshot.data!.countryList![index].name!
                                        .official
                                        .toString()
                                        .contains(searchString)
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 15),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailsPage(
                                                  area: data!
                                                          .countryList?[index]
                                                          .area
                                                          .toString() ??
                                                      '',
                                                  capital: data
                                                          .countryList?[index]
                                                          .capital
                                                          .toString() ??
                                                      '',
                                                  countryName: data
                                                          .countryList?[index]
                                                          .name!
                                                          .common
                                                          .toString() ??
                                                      '',
                                                  currency: data
                                                          .countryList?[index]
                                                          .currencies
                                                          .toString() ??
                                                      '',
                                                  diallingCode:
                                                      '${data.countryList![index].idd!.root.toString()} ${data.countryList![index].idd!.suffixes.toString()}',
                                                  drivingSide: data
                                                          .countryList?[index]
                                                          .car!
                                                          .side
                                                          .toString() ??
                                                      '',
                                                  independence: data
                                                          .countryList?[index]
                                                          .independent
                                                          .toString() ??
                                                      '',
                                                  officialLang: data
                                                          .countryList?[index]
                                                          .languages
                                                          .toString() ??
                                                      '',
                                                  population: data
                                                          .countryList?[index]
                                                          .population
                                                          .toString() ??
                                                      '',
                                                  timeZone: data
                                                          .countryList?[index]
                                                          .timezones
                                                          .toString() ??
                                                      '',
                                                  region: data
                                                          .countryList?[index]
                                                          .region
                                                          .toString() ??
                                                      '',
                                                  flag: data.countryList![index]
                                                          .flags?.png
                                                          .toString() ??
                                                      '',
                                                  coatOfArms: data
                                                          .countryList![index]
                                                          .coatOfArms
                                                          ?.png
                                                          .toString() ??
                                                      '',
                                                ),
                                              ),
                                            );
                                          },
                                          child: Row(
                                            children: [
                                              Text(
                                                data!.countryList![index].flag
                                                    .toString(),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 24.sp,
                                                ),
                                              ),
                                              // Image.network(
                                              //   data!.countryList![index].flags!.png
                                              //       .toString(),
                                              //   height: 40.h,
                                              //   width: 40.w,
                                              // ),
                                              SizedBox(
                                                width: 16.w,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: 300.w,
                                                    child: Text(
                                                      data.countryList![index]
                                                          .name!.common
                                                          .toString(),
                                                      style: TextStyle(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontFamily:
                                                            Fonts.axiforma,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14.sp,
                                                        color: context.isDark
                                                            ? Color(0xffF2F4F7)
                                                            : Color(0xff1C1917),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 2.h,
                                                  ),
                                                  SizedBox(
                                                    width: 300.w,
                                                    child: Text(
                                                      data.countryList?[index]
                                                              .capital
                                                              .toString() ??
                                                          '',
                                                      style: TextStyle(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontFamily:
                                                            Fonts.axiforma,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14.sp,
                                                        color: context.isDark
                                                            ? Color(0xffF2F4F7)
                                                            : Color(0xff1C1917),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : Text('No results');
                              },
                            )
                          : const SizedBox();
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
