import 'package:uberdriver/widgets/stars.dart';

stars({required int votes, required double rating}) {
  if (votes == 0) {
    return StarsWidget(
      numberOfStars: 0,
    );
  } else {
    double finalRate = rating / votes;
    return StarsWidget(
      numberOfStars: finalRate.floor(),
    );
  }
}
