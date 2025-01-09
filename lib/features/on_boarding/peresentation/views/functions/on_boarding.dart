

import 'package:dalel/core/cashe/cashe_helper.dart';
import 'package:dalel/core/services/services_locator.dart';

void onBoardingVisited(){
    getIt<CasheHelper>().saveData(key: 'onBoardingVisited', value: true);
}