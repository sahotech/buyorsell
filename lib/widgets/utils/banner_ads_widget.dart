import 'package:flutter/material.dart';

import 'constants.dart';

class BannerAdsWidget extends StatefulWidget {
  const BannerAdsWidget({super.key});

  @override
  State<BannerAdsWidget> createState() => _BannerAdsWidgetState();
}

class _BannerAdsWidgetState extends State<BannerAdsWidget> {
  int currentAds = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // large ads
        GestureDetector(
          onHorizontalDragEnd: (_) {
            if (currentAds == (largeAds.length - 1)) {
              currentAds = -1;
            }
            setState(() {
              currentAds++;
            });
          },
          child: Image.network(
            largeAds[currentAds],
            width: double.infinity,
          ),
        ),

        // small ads
      ],
    );
  }
}
