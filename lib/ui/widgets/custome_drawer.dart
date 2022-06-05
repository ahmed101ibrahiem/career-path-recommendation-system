import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:pharus/constant/colors.dart';
import 'package:pharus/ui/screens/profile_view.dart';

import 'list_tile_drawer.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: const Color(0xFFF7FFFF),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 48, bottom: 48, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close,
                  color: Colors.teal.shade200,
                  size: 36,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.040,
              ),
              listTileDrawer(
                  text: 'Profile',
                  iconData: Icons.account_circle_rounded,
                  color: primaryColor,
                  pressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => ProfileView()));
                  }),
              listTileDrawer(
                  text: '3D virtual Recruitment',
                  iconData: CommunityMaterialIcons.rotate_3d),
              listTileDrawer(text: 'Saved', iconData: Icons.bookmark),
              listTileDrawer(
                  text: 'Setting', iconData: CommunityMaterialIcons.cogs),
              listTileDrawer(text: 'About', iconData: Icons.info),
              listTileDrawer(
                  text: 'Help & Support',
                  iconData: CommunityMaterialIcons.face_agent),
              Spacer(),
              listTileDrawer(
                  text: 'Logout',
                  iconData: CommunityMaterialIcons.logout_variant,
                  color: Colors.red),
            ],
          ),
        ),
      ),
    );
  }
}
