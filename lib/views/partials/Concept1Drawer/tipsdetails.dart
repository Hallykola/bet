import 'package:bettingtips/views/partials/Concept1Drawer/Concept1Drawer.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:bettingtips/Template_Material/Sample_Screen/Animation/FadeAnimation.dart';

import 'package:provider/provider.dart';

import 'DrawerScreen.dart';

class TipsDetails extends StatefulWidget {
  TipsDetails({Key key}) : super(key: key);

  @override
  _TipsDetailsState createState() => _TipsDetailsState();
}

class _TipsDetailsState extends State<TipsDetails>
    with TickerProviderStateMixin {
  MenuController menuController;

  @override
  void initState() {
    super.initState();

    menuController = new MenuController(
      vsync: this,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    menuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => menuController,
      child: ScreenHomePage(
        menuScreen: MenuScreen(),
        contentScreen: Layout(
            contentBuilder: (cc) => Container(
                  color: Colors.grey[200],
                  child: Container(
                    color: Colors.grey[200],
                  ),
                )),
      ),
    );
  }
}

class Layout {
  final WidgetBuilder contentBuilder;

  Layout({
    this.contentBuilder,
  });
}

class ScreenHomePage extends StatefulWidget {
  final Widget menuScreen;
  final Layout contentScreen;

  ScreenHomePage({
    this.menuScreen,
    this.contentScreen,
  });

  @override
  _ScreenHomePageState createState() => _ScreenHomePageState();
}

class _ScreenHomePageState extends State<ScreenHomePage> {
  Curve scaleDownCurve = new Interval(0.0, 0.3, curve: Curves.easeOut);
  Curve scaleUpCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideOutCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideInCurve = new Interval(0.0, 1.0, curve: Curves.easeOut);

  createContentDisplay() {
    return zoomAndSlideContent(new Container(
      child: new Scaffold(
        backgroundColor: Colors.white,

        // backgroundColor: Colors.white,

        // Calling variable appbar
        appBar: AppBar(
          backgroundColor: Color(0xFFFFFFFF),
          elevation: 0.0,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Text(
              "Game Tips",
              style: TextStyle(
                  fontFamily: "Sofia",
                  fontSize: 23.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
          ),
          leading: new IconButton(
              icon: Icon(
                EvaIcons.menu2Outline,
                color: Colors.black,
              ),
              onPressed: () {
                Provider.of<MenuController>(context, listen: false).toggle();
              }),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: InkWell(onTap: () {}, child: Icon(EvaIcons.personOutline)),
            ),
          ],
        ),

        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              InkWell(
                  onTap: () {},
                  child: FadeAnimation(
                    0.2,
                    itemCard(
                      image: "assets/images/category3.jpg",
                      title: "Restaurant",
                    ),
                  )),
              InkWell(
                  onTap: () {},
                  child: FadeAnimation(
                    0.3,
                    itemCard(
                      image: "assets/images/category5.jpg",
                      title: "Home Made",
                    ),
                  )),
              InkWell(
                  onTap: () {},
                  child: FadeAnimation(
                    0.4,
                    itemCard(
                      image: "assets/images/category6.jpg",
                      title: "Street Food",
                    ),
                  )),
              InkWell(
                  onTap: () {},
                  child: FadeAnimation(
                    0.5,
                    itemCard(
                      image: "assets/images/category7.jpg",
                      title: "Catering Service",
                    ),
                  )),
            ],
          ),
        ),
      ),
    ));
  }

  zoomAndSlideContent(Widget content) {
    var slidePercent, scalePercent;

    switch (Provider.of<MenuController>(context, listen: false).state) {
      case MenuState.closed:
        slidePercent = 0.0;
        scalePercent = 0.0;
        break;
      case MenuState.open:
        slidePercent = 1.0;
        scalePercent = 1.0;
        break;
      case MenuState.opening:
        slidePercent = slideOutCurve.transform(
            Provider.of<MenuController>(context, listen: false).percentOpen);
        scalePercent = scaleDownCurve.transform(
            Provider.of<MenuController>(context, listen: false).percentOpen);
        break;
      case MenuState.closing:
        slidePercent = slideInCurve.transform(
            Provider.of<MenuController>(context, listen: false).percentOpen);
        scalePercent = scaleUpCurve.transform(
            Provider.of<MenuController>(context, listen: false).percentOpen);
        break;
    }

    final slideAmount = 275.0 * slidePercent;
    final contentScale = 1.0 - (0.2 * scalePercent);
    final cornerRadius =
        16.0 * Provider.of<MenuController>(context, listen: false).percentOpen;

    return new Transform(
      transform: new Matrix4.translationValues(slideAmount, 0.0, 0.0)
        ..scale(contentScale, contentScale),
      alignment: Alignment.centerLeft,
      child: new Container(
        decoration: new BoxDecoration(
          boxShadow: [
            new BoxShadow(
              color: Colors.black12,
              offset: const Offset(0.0, 5.0),
              blurRadius: 15.0,
              spreadRadius: 10.0,
            ),
          ],
        ),
        child: new ClipRRect(
            borderRadius: new BorderRadius.circular(cornerRadius),
            child: content),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Scaffold(
            body: widget.menuScreen,
          ),
        ),
        createContentDisplay()
      ],
    );
  }
}

//
// Create item card
//

class itemCard extends StatelessWidget {
  String image, title;
  itemCard({this.image, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 10.0, right: 10.0, top: 8.0, bottom: 5.0),
      child: Container(
        height: 140.0,
        width: 400.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        child: Material(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFABABAB).withOpacity(0.7),
                  blurRadius: 4.0,
                  spreadRadius: 3.0,
                ),
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                color: Colors.black12.withOpacity(0.1),
              ),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    shadows: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.7),
                          blurRadius: 10.0,
                          spreadRadius: 2.0)
                    ],
                    color: Colors.white,
                    fontFamily: "Sofia",
                    fontWeight: FontWeight.w800,
                    fontSize: 39.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
