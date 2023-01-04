import 'package:flutter/material.dart';

import '../../misc/colors.dart';
import 'home_page2_details.dart';


class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        color: Colors.black,
         onPressed: () {  },
         ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          color: AppColors.kTextColor,
          onPressed: (){},),

          SizedBox(width: AppColors.kDefaultPaddin),
          
      ]
    );
  }
}