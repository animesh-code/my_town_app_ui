import 'package:flutter/material.dart';
import 'package:my_town/config/app/size_config.dart';
import 'package:my_town/constants/constants.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget title;
  final AppBar appBar;

  const CustomAppBar({
    @required this.title,
    @required this.appBar,
  });

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}

class _CustomAppBarState extends State<CustomAppBar> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() => setState(() {}));
  }

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      // pinned: true,
      iconTheme: IconThemeData(color: kDarkColor),
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      // snap: true,
      title: widget.title,
      actions: [
        IconButton(
          onPressed: () {
            showGeneralDialog(
              context: context,
              barrierDismissible: false,
              transitionDuration: Duration(milliseconds: 0),
              transitionBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(
                    scale: animation,
                    child: child,
                  ),
                );
              },
              pageBuilder: (context, animation, secondaryAnimation) {
                return Scaffold(
                  body: SafeArea(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      padding: EdgeInsets.all(20),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Text('Cart products'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
          icon: ImageIcon(
            AssetImage('assets/images/bag1.png'),
            size: 24,
            color: kDarkColor,
          ),
        ),
      ],
      // bottom: PreferredSize(
      //   preferredSize: Size.fromHeight(
      //     getProportionateScreenHeight(56.5),
      //   ),
      //   child: Padding(
      //     padding: EdgeInsets.fromLTRB(18, 5, 18, 5),
      //     child:
      //   ),
      // ),
    );
  }

  void search(String text) {
    //
  }
}

// title: Container(
//         color: Colors.white,
//         child: Container(
//           height: getProportionateScreenHeight(40),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(5),
//             border: Border.all(
//               width: 1,
//               color: kLightColor,
//             ),
//           ),
//           child: GestureDetector(
//             onTap: () {
//               showSearch(
//                 context: context,
//                 delegate: CustomSearchDelegate(),
//               );
//             },
//             child: Row(
//               children: [
//                 SizedBox(
//                   width: getProportionateScreenWidth(14),
//                 ),
//                 Icon(
//                   Icons.search,
//                   color: kLightColor,
//                   size: 20,
//                 ),
//                 SizedBox(
//                   width: getProportionateScreenWidth(6),
//                 ),
//                 Text(
//                   'Search anything in your city',
//                   style: TextStyle(
//                     color: kLightColor,
//                     fontSize: 15,
//                     fontWeight: FontWeight.normal,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
