import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mra/constants.dart';
import 'package:mra/pages/new_entry/new_entry_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  NewEntryBloc? newEntryBloc;
  @override
  void initState() {
    newEntryBloc = NewEntryBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<NewEntryBloc>.value(
      value: newEntryBloc!,
      child: Sizer(
        builder: (context, orientation, deviceType) {
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
                headline2: GoogleFonts.poppins(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w700,
                  color: kTextColor,
                ),
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
                  fontSize: 16.sp,
                  color: kTextColor,
                  fontWeight: FontWeight.w900,
                ),
                headline6: GoogleFonts.poppins(
                  fontSize: 13.sp,
                  color: kTextColor,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.0,
                ),
                subtitle2: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  color: kTextLightColor,
                ),
                caption: GoogleFonts.poppins(
                  fontSize: 9.sp,
                  fontWeight: FontWeight.w500,
                  color: kTextLightColor,
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
              timePickerTheme: TimePickerThemeData(
                backgroundColor: kScaffoldColor,
                hourMinuteColor: kTextColor,
                hourMinuteTextColor: kScaffoldColor,
                dayPeriodColor: kTextColor,
                dayPeriodTextColor: kScaffoldColor,
                dialBackgroundColor: kTextColor,
                dialHandColor: kPrimaryColor,
                dialTextColor: kScaffoldColor,
                entryModeIconColor: kPrimaryColor,
                dayPeriodTextStyle: GoogleFonts.raleway(
                  fontSize: 7.5.sp,
                ),
              ),
            ),
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
