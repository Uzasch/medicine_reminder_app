import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mra/constants.dart';
import 'package:sizer/sizer.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MRA',
        //theme customization
        theme: ThemeData.dark().copyWith(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kScaffoldColor,
          //appbar theme
          appBarTheme: AppBarTheme(
            toolbarHeight: 7.h,
            backgroundColor: kScaffoldColor,
            elevation: 0,
            iconTheme: IconThemeData(
              color: kSecondaryColor,
              size: 20.sp,
            ),
            titleTextStyle: GoogleFonts.mulish(
                color: kTextColor,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.normal,
                fontSize: 20.sp),
          ),

          textTheme: TextTheme(
            headline3: GoogleFonts.raleway(
              fontSize: 30.sp,
              color: kSecondaryColor,
              fontWeight: FontWeight.w700,
            ),
            headline4: GoogleFonts.raleway(
              fontSize: 30.sp,
              fontWeight: FontWeight.w800,
              color: kTextColor,
            ),
            headline5: GoogleFonts.raleway(
              fontSize: 45.sp,
              fontWeight: FontWeight.w600,
              color: kTextColor,
            ),
            subtitle2: GoogleFonts.poppins(fontSize: 12.sp, color: kTextColor),
            caption: GoogleFonts.poppins(
              fontSize: 9.sp,
              fontWeight: FontWeight.w500,
              color: kPrimaryColor,
            ),
            labelMedium: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: kTextColor,
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: kTextLightColor,
                width: 0.7,
              ),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: kTextLightColor,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: kPrimaryColor,
              ),
            ),
          ),
        ),
        home: const HomePage(),
      );
    });
  }
}
