import 'dart:convert';
import 'package:rxdart/rxdart.dart';
import 'models/medicine.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalBloc {
  BehaviorSubject<List<Medicine>>? _medicineList$;
  BehaviorSubject<List<Medicine>>? get medicineList$ => _medicineList$;

  GlobalBloc() {
    _medicineList$ = BehaviorSubject<List<Medicine>>.seeded([]);
    makeMedicineList();
  }

  Future updateMedicineList(Medicine newMedicine) async {
    var blocList = _medicineList$!.value;
    blocList.add(newMedicine);
    _medicineList$!.add(blocList);

    Map<String, dynamic> tempMap = newMedicine.toJson();
    SharedPreferences? sharedUser = await SharedPreferences.getInstance();
    String newMedicineJson = jsonEncode(tempMap);
    List<String> medicineJsonList = [];
    if (sharedUser.getStringList('medicine') == null) {
      medicineJsonList.add(newMedicineJson);
    } else {
      medicineJsonList = sharedUser.getStringList('medicine')!;
      medicineJsonList.add(newMedicineJson);
    }
    sharedUser.setStringList('medicine', medicineJsonList);
  }

  Future makeMedicineList() async {
    SharedPreferences? sharedUser = await SharedPreferences.getInstance();
    List<String>? jsonList = sharedUser.getStringList('medicine');
    List<Medicine> prefList = [];

    if (jsonList == null) {
      return;
    } else {
      for (String jsonMedicine in jsonList) {
        dynamic userMap = jsonDecode(jsonMedicine);
        Medicine tempMedicine = Medicine.fromJson(userMap);
        prefList.add(tempMedicine);
      }
      //state update
      _medicineList$!.add(prefList);
    }
  }

  void dispose() {
    medicineList$!.close();
  }
}
