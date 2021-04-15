import 'package:flutter/material.dart';
import 'package:bigkit_material/Template_Material/Sample_Screen/Brand.dart';
import 'package:bigkit_material/Template_Material/Sample_Screen/Favorite.dart';
import 'package:bigkit_material/Template_Material/Sample_Screen/Home.dart';
import 'package:bigkit_material/Template_Material/Sample_Screen/Profile.dart';

class LightBottomNavBar extends StatefulWidget {
  @override
  _LightBottomNavBarState createState() => _LightBottomNavBarState();
}

class _LightBottomNavBarState extends State<LightBottomNavBar> {
  int currentIndex = 0;

  /// Set a type current number a layout class
  Widget callPage(int current) {
    switch (current) {
      case 0:
        return new Home();
      case 1:
        return new Category();
      case 2:
        return new Favorite();
      case 3:
        return new Profile();
        break;
      default:
        return Home();
    }
  }

  /// Build BottomNavigationBar Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: callPage(currentIndex),
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.white,
              textTheme: Theme.of(context).textTheme.copyWith(
                  caption: TextStyle(color: Colors.black38.withOpacity(0.15)))),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            fixedColor: Color(0xFF5FBD84),
            onTap: (value) {
              currentIndex = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 23.0,
                  ),
                  title: Text(
                    "Home",
                    style: TextStyle(
                        fontFamily: "Sofia", fontWeight: FontWeight.w800),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shop),
                  title: Text(
                    "Category",
                    style: TextStyle(
                        fontFamily: "Sofia", fontWeight: FontWeight.w800),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  title: Text(
                    "Favorite",
                    style: TextStyle(
                        fontFamily: "Sofia", fontWeight: FontWeight.w800),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    size: 24.0,
                  ),
                  title: Text(
                    "Account",
                    style: TextStyle(
                        fontFamily: "Sofia", fontWeight: FontWeight.w800),
                  )),
            ],
          )),
    );
  }
}
