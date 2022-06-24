import 'package:flutter/cupertino.dart';
import 'package:pharus/models/career_model.dart';
import 'package:pharus/my_dio/my_dio.dart';
import 'package:pharus/ui/widgets/snac.dart';

enum StatusCareer { loading, done, error }

class CareerController extends ChangeNotifier {
  List<CareerModel> career = [];
  StatusCareer statusUser = StatusCareer.loading;

  getUserCareer(String code, int area, context) async {
    statusUser = StatusCareer.loading;
    career = [];
    notifyListeners();
    print(code);
    print(area);

    final response = await MyDio.getData('career/');
    if (response.error == false) {
      print(response.data.data);
      response.data.data.forEach((element) {
        career.add(CareerModel.fromMap(element));
      });
      career = career
          .where((element) =>
              (element.job_zone == area && element.interest_code == 'ECR'))
          .toList();
      statusUser = StatusCareer.done;

      print(career.first.title);
      notifyListeners();
    } else if (response.error == true) {
      statusUser = StatusCareer.error;

      showSnac(response.errorMessage, context);
    }
  }
}
