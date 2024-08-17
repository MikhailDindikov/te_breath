import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';

enum TeState { none, loading, done }

class TeBloomingController extends GetxController {
  RxInt teTrees = 0.obs;
  RxInt tePlants = 0.obs;
  RxInt teGrass = 0.obs;
  bool isEmpty = true;
  TeState teState = TeState.none;

  Future<void> getTeData(String teCity) async {
    teState = TeState.loading;
    update();
    final response = await get(
      Uri.parse(
        'http://dataservice.accuweather.com/locations/v1/cities/search?apikey=d8GyNitatXKGn17GR0wvxHRWI8GcrSZg&q=$teCity',
      ),
    );

    final data = json.decode(response.body) as List<dynamic>;
    if (data.isNotEmpty) {
      final teKey = (data.first as Map<String, dynamic>)['Key'].toString();

      final response2 = await get(
        Uri.parse(
          'http://dataservice.accuweather.com/forecasts/v1/daily/1day/$teKey?apikey=d8GyNitatXKGn17GR0wvxHRWI8GcrSZg&details=true',
        ),
      );

      if (response2.statusCode == 200) {
        final data2 = ((json.decode(response2.body)
                as Map<String, dynamic>)['DailyForecasts'] as List<dynamic>)
            .firstOrNull;
        if (data2 != null) {
          final pollens = data2['AirAndPollen'] as List<dynamic>;
          final grass =
              pollens.firstWhereOrNull((element) => element['Name'] == 'Grass');
          if (grass != null) {
            teGrass.value =
                (int.tryParse(grass['CategoryValue'].toString()) ?? 1) - 1;
          }
          final plants = pollens
              .firstWhereOrNull((element) => element['Name'] == 'Ragweed');
          if (plants != null) {
            tePlants.value =
                (int.tryParse(plants['CategoryValue'].toString()) ?? 1) - 1;
          }
          final trees =
              pollens.firstWhereOrNull((element) => element['Name'] == 'Tree');
          if (trees != null) {
            teTrees.value =
                (int.tryParse(trees['CategoryValue'].toString()) ?? 1) - 1;
          }
          isEmpty = false;
        } else {
          isEmpty = true;
        }
      } else {
        isEmpty = true;
      }
    } else {
      isEmpty = true;
    }

    teState = TeState.done;
    update();
  }
}
