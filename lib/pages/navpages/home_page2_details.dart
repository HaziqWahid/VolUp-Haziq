

import 'package:flutter/material.dart';


import '../../misc/colors.dart';
import '../../misc/event_details.dart';


class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:AppColors.kDefaultPaddin ),
          child: Text("Volunteering Event", style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight:FontWeight.bold)),
        ),
        Categories(),
        Expanded(
          
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppColors.kDefaultPaddin),
            child: GridView.builder(
              itemCount: event_info.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:2,
            mainAxisSpacing: AppColors.kDefaultPaddin,
            crossAxisSpacing: AppColors.kDefaultPaddin,
            childAspectRatio: 0.75,
        ),
        itemBuilder:(context, index)=> itemCard(eventList: event_info[index]),),
          ) )
      ],
    );
  }
}

class itemCard extends StatelessWidget {
  final EventDetails eventList;
  const itemCard({
    Key? key,
    required this.eventList,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(AppColors.kDefaultPaddin),    
        
            //height: 180,
             //width: 160,
             decoration: BoxDecoration(
              color: AppColors.outline,
              borderRadius: BorderRadius.circular(16)),
              child: Image.asset(eventList.picture),
             ),
        ),
           Padding(
             padding: const EdgeInsets.symmetric(vertical: AppColors.kDefaultPaddin/4),
             child: Text(eventList.title, style: TextStyle(color: AppColors.kTextLightColor),),
           ),
           Text(eventList.location, style: TextStyle(fontWeight: FontWeight.bold),

           )
      ],
    );
  }
}
// the thing above on that that thing
class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => CategoriesState();
}

class CategoriesState extends State<Categories> {

  List<String> categories = ["List Event", "Organization","Donation"," Admin"];
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppColors.kDefaultPaddin),
      child: SizedBox(
        height:25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context,index) => 
          buildCategory( index,
          )
          )

      ),
    );
  }
Widget buildCategory(int index)
{
  return GestureDetector(
    onTap:() {
      setState((){
        selectedIndex = index;
      });
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppColors.kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            categories[index],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: selectedIndex==index?AppColors.kTextColor:AppColors.kTextLightColor,
            ),
          ),
          Container( 
            margin: EdgeInsets.only(top: AppColors.kDefaultPaddin/4),
            height:2,
            width: 30,
            color: selectedIndex == index? Colors.black: Colors.transparent,
          )
        ],
      ),
    ),
  );

}


}

