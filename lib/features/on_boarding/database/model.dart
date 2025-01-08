import 'package:dalel/core/utils/assets.dart';

// ignore: camel_case_types
class onBoardingData {
  final String image;
  final String title;
  final String subTitle;

  onBoardingData(
      {required this.image, required this.title, required this.subTitle});
}

List<onBoardingData> onboarding = [
  onBoardingData(
      image: Assets.assetsImagesOnboarding1,
      title: 'Explore The history withDalel in a smart way',
      subTitle:
          'Using our app’s history libraries you can find many historical periods '),
  onBoardingData(
      image: Assets.assetsImagesOnboarding2,
      title: 'From every placeon earth',
      subTitle: 'A big variety of ancient places from all over the world '),
  onBoardingData(
      image: Assets.assetsImagesOnboarding3,
      title: 'Using modern AI technology for better user experience',
      subTitle:
          'AI provide recommendations and helps you to continue the search journey '),
];
