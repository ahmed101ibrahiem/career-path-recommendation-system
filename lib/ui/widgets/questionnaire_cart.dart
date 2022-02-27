import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';

class QuestionnaireCard extends StatelessWidget {
  String queston ;

  QuestionnaireCard(this.queston) ;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      elevation: 3,
      color: const Color(0xFFD9D9D9),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(queston),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CommunityMaterialIcons.emoticon_angry,
                          size: 40,
                          color: Colors.red,
                        )),
                    Text(
                      '  Strongly\nAngry',
                      textAlign: TextAlign.center,
                      style: TextStyle(),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon:
                        Icon(CommunityMaterialIcons.emoticon_sad,
                          size: 40,
                          color: Colors.yellow,
                        )),
                    Text('  disike', textAlign: TextAlign.center),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CommunityMaterialIcons.emoticon_neutral,
                          size: 40,
                          color: Colors.yellow,
                        )),
                    Text('  Not Sure', textAlign: TextAlign.center),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CommunityMaterialIcons.emoticon_happy,size: 40,
                          color: Colors.yellow,)),
                    Text('  Like', textAlign: TextAlign.center),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CommunityMaterialIcons.emoticon_excited,
                          size: 40,
                          color: Colors.green,
                        )),
                    Text(   'Strongly\nLike', textAlign: TextAlign.center),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

