// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mra/constants.dart';
import 'package:mra/pages/medicine_details/medicine_details.dart';
import 'package:mra/pages/new_entry/new_entry_page.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(2.h),
        child: Column(
          children: [
            const TopContainer(),
            SizedBox(
              height: 2.h,
            ),
            //the widget take space as per need
            const Flexible(
              child: BottomContainer(),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          InkResponse(
            onTap: () {
              //go to new entry page
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const NewEntryPage(),
              //   ),
              // );
            },
            child: Container(
              margin: const EdgeInsets.only(left: 30.0),
              child: SizedBox(
                width: 72.w,
                child: Card(
                  color: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1.h),
                  ),
                  child: Icon(
                    Icons.add_outlined,
                    color: kScaffoldColor,
                    size: 50.sp,
                  ),
                ),
              ),
            ),
          ),
          InkResponse(
            onTap: () {
              //go to new entry page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NewEntryPage(),
                ),
              );
            },
            child: SizedBox(
              child: Card(
                color: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.h),
                ),
                child: Icon(
                  Icons.add_outlined,
                  color: kScaffoldColor,
                  size: 50.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopContainer extends StatelessWidget {
  const TopContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
            bottom: 1.h,
          ),
          child: Text(
            'We Take Care \nOf Your Health. ',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
            bottom: 1.h,
          ),
          child: Text('Welcome for your daily doses.',
              style: Theme.of(context).textTheme.subtitle2),
        ),
        // SizedBox(
        //   height: 1.h,
        // ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(
            top: 1.h,
            bottom: 1.h,
          ),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.baseline,
            // textBaseline: TextBaseline.ideographic,
            children: [
              Text(
                '0',
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                'Medicines',
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ],
          ),
        ),
        // HealthKit(),
      ],
    );
  }
}

class BottomContainer extends StatelessWidget {
  const BottomContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // later we will use condition

    // return Center(
    //   child: Text(
    //     'No Medicine',
    //     textAlign: TextAlign.center,
    //     style: Theme.of(context).textTheme.headline3,
    //   ),
    return GridView.builder(
      padding: EdgeInsets.only(top: 1.h),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return MedicineCard();
      },
    );
  }
}

class MedicineCard extends StatelessWidget {
  const MedicineCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.white,
      splashColor: Colors.grey,
      onTap: () {
        //go to details activity with animation, later
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MedicineDetails()),
        );
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(3.w, 0.h, 2.w, 1.h),
        margin: EdgeInsets.all(1.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2.h),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            SvgPicture.asset(
              'assets/icons/tablet.svg',
              height: 12.5.h,
              color: kOtherColor,
            ),
            const Spacer(),
            //hero tag animation,later
            Text(
              'Calpol',
              overflow: TextOverflow.fade,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 0.3.h,
            ),
            //time interval data with condition, later
            Text(
              'Every 8 hours',
              overflow: TextOverflow.fade,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
    );
  }
}

// class HealthKit extends StatelessWidget {
//   const HealthKit({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       highlightColor: Colors.white,
//       splashColor: Colors.grey,
//       onTap: () {
//         //go to details activity with animation, later
//         // Navigator.push(
//         //   context,
//         //   MaterialPageRoute(builder: (context) => MedicineDetails()),
//         // );
//       },
//       child: Container(
//         padding: EdgeInsets.fromLTRB(3.w, 0.h, 2.w, 1.h),
//         margin: EdgeInsets.all(1.h),
//         height: 8.75.h,
//         decoration: BoxDecoration(
//           color: kPrimaryColor,
//           borderRadius: BorderRadius.circular(2.h),
//         ),
//         child: Row(
//           // crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               'Heart Rate and \n'
//               'Pulse Monitoring',
//               overflow: TextOverflow.fade,
//               textAlign: TextAlign.start,
//               style: Theme.of(context).textTheme.headline6!.copyWith(
//                     fontSize: 16.sp,
//                     color: kScaffoldColor,
//                   ),
//             ),
//             SvgPicture.asset(
//               'assets/icons/arrow.svg',
//               height: 3.75.h,
//               color: kScaffoldColor,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
