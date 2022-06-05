import 'package:community_material_icon/community_material_icon.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:pharus/ui/screens/courses/course_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharus/constant/colors.dart';
import 'package:pharus/ui/screens/register.dart';
import 'package:pharus/ui/widgets/DropDownField.dart';
import 'package:pharus/ui/widgets/custome_drawer.dart';
import 'package:pharus/ui/widgets/list_tile_drawer.dart';

class CoursesNames extends StatefulWidget {
  static const id = "CoursesNames";

  @override
  State<CoursesNames> createState() => _CoursesNamesState();
}

class _CoursesNamesState extends State<CoursesNames> {
  List images = [
    'https://www.ukraineitnow.com/wp-content/uploads/2019/10/flutter_banner.jpg'
  ];
  List<String> courseTitle = [
    'Agricultural Inspectors',
    'Bicycle Repairers',
    'Carpenters',
    'Biomass Plant Technicians',
  ];
  List<String> subtitle = [
    'Inspect agricultural commodities,processing equipment,and facilities,to ensure compliance with regulations and laws governing health,quality,and safety'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                CommunityMaterialIcons.sort_reverse_variant,
                color: primaryColor,
                size: 40,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        elevation: 0,
        backgroundColor: Colors.white12,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: Colors.grey,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person,
                color: Colors.grey,
              ))
        ],
      ),
      drawer:  CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TextDropdownFormField(
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          borderSide: BorderSide(color: border),
                        ),
                        filled: false,
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          borderSide: BorderSide(color: border),
                        ),
                        suffixIcon: const Icon(
                          Icons.arrow_drop_down,
                          color: border,
                        ),
                        labelText: ("search"),
                        labelStyle: TextStyle(color: border),
                      ),
                    ),
                  ),
                  Container(
                    height: 35,
                    width: 45,
                    decoration: BoxDecoration(
                      color: bottom,
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                    child: Icon(Icons.search, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text('Recommended for you :'),
              SizedBox(
                height: 300,
                width: 550,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: courseTitle.length,
                    itemBuilder: (BuildContext ctxt, index) {
                      return CardData(
                          images: images[0],
                          courseTitle: courseTitle[index],
                          subtitle: subtitle[0]);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }


}


class CardData extends StatelessWidget {
  CardData(
      {@required this.images,
      @required this.courseTitle,
      @required this.subtitle});
  String images;
  String courseTitle;
  String subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: SizedBox(
        //  height: 180,
        width: 300,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            Navigator.pushNamed(context, courseDetail.id);
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Container(
                  width: 300.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(images)),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0)),
                  ),
                ),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 20, 0, 8),
                    child: Text('$courseTitle',
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 15,
                            fontWeight: FontWeight.w600)),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Text('$subtitle'),
                  ),
                  isThreeLine: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
