import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredGrid extends StatefulWidget {
  StaggeredGrid({Key key}) : super(key: key);

  @override
  _StaggeredGridState createState() => _StaggeredGridState();
}

class _StaggeredGridState extends State<StaggeredGrid> {
  List<String> imageList = [
    'https://image.freepik.com/free-psd/t-shirt-mockup-design_15879-476.jpg',
    "https://image.freepik.com/free-psd/man-wearing-t-shirt-mockup_23-2148595356.jpg",
    "https://image.freepik.com/free-psd/front-side-t-shirt-mockup-template-wooden-table_185216-226.jpg",
    "https://image.freepik.com/free-psd/black-t-shirt-mockup_125540-430.jpg",
    "https://image.freepik.com/free-psd/white-t-shirt-mockup_125540-452.jpg",
    "https://image.freepik.com/free-psd/top-view-cute-t-shirt-concept-mock-up_23-2148809085.jpg",
    "https://image.freepik.com/free-psd/man-showing-mock-up-shirt-front-view_23-2148685097.jpg",
    "https://image.freepik.com/free-psd/flat-lay-t-shirt-concept-mock-up_23-2148809054.jpg",
    'https://image.freepik.com/free-psd/t-shirt-mockup-design_15879-476.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Staggered Grid",
          style: TextStyle(fontFamily: "Sofia", fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(12),
        child: new StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            itemCount: imageList.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: Image.network(
                    imageList[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            staggeredTileBuilder: (index) {
              return new StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
            }),
      ),
    );
  }
}
