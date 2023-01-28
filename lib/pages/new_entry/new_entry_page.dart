import 'package:flutter/material.dart';
import 'package:mra/constants.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/medicine_type.dart';

class NewEntryPage extends StatefulWidget {
  const NewEntryPage({Key? key}) : super(key: key);

  @override
  State<NewEntryPage> createState() => _NewEntryPageState();
}

class _NewEntryPageState extends State<NewEntryPage> {
  late TextEditingController nameController;
  late TextEditingController dosageController;

  late GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    dosageController.dispose();
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    dosageController = TextEditingController();

    _scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Add New'),
      ),
      body: Padding(
        padding: EdgeInsets.all(2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PanelTitle(
              title: "Medicine Name",
              isRequired: true,
            ),
            TextFormField(
              maxLength: 15,
              controller: dosageController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
              ),
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: kOtherColor,
                  ),
            ),
            const PanelTitle(
              title: "Dosage in mg",
              isRequired: false,
            ),
            TextFormField(
              maxLength: 15,
              keyboardType: TextInputType.number,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
              ),
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: kOtherColor,
                  ),
            ),
            SizedBox(
              height: 2.5.h,
            ),
            const PanelTitle(title: 'Medicine Type', isRequired: false),
            Padding(
              padding: EdgeInsets.only(
                top: 1.h,
              ),
              child: StreamBuilder(
                builder: (context, snapshot) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MedicineTypeColumn(
                          medicineType: MedicineType.bottle,
                          name: 'Bottle',
                          iconValue: 'assets/icons/bottle.svg',
                          isSelected: snapshot.data == MedicineType.bottle
                              ? true
                              : false),
                      MedicineTypeColumn(
                          medicineType: MedicineType.pill,
                          name: 'Pill',
                          iconValue: 'assets/icons/pill.svg',
                          isSelected: snapshot.data == MedicineType.pill
                              ? true
                              : false),
                      MedicineTypeColumn(
                          medicineType: MedicineType.syringe,
                          name: 'Syringe',
                          iconValue: 'assets/icons/syringe.svg',
                          isSelected: snapshot.data == MedicineType.syringe
                              ? true
                              : false),
                      MedicineTypeColumn(
                          medicineType: MedicineType.tablet,
                          name: 'tablet',
                          iconValue: 'assets/icons/tablet.svg',
                          isSelected: snapshot.data == MedicineType.tablet
                              ? true
                              : false),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MedicineTypeColumn extends StatelessWidget {
  const MedicineTypeColumn(
      {Key? key,
      required this.medicineType,
      required this.name,
      required this.iconValue,
      required this.isSelected})
      : super(key: key);
  final MedicineType medicineType;
  final String name;
  final String iconValue;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //select medicine Type
      },
      child: Column(
        children: [
          Container(
            width: 20.w,
            height: 10.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.h),
              color: isSelected ? kOtherColor : Colors.white,
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 1.h,
                  bottom: 0.h,
                ),
                child: SvgPicture.asset(
                  iconValue,
                  height: 10.h,
                  color: isSelected ? Colors.white : kOtherColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 1.h),
            child: Container(
              width: 20.w,
              height: 5.h,
              decoration: BoxDecoration(
                color: isSelected ? kOtherColor : Colors.transparent,
                borderRadius: BorderRadius.circular(3.h),
              ),
              child: Center(
                child: Text(
                  name,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(color: isSelected ? Colors.white : kOtherColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PanelTitle extends StatelessWidget {
  const PanelTitle({Key? key, required this.title, required this.isRequired})
      : super(key: key);
  final String title;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: Text.rich(
        TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: title,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            TextSpan(
              text: isRequired ? "*" : "",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: kPrimaryColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
