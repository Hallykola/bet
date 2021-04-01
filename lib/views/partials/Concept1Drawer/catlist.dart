import 'package:bettingtips/blocs/tips_bloc.dart';
import 'package:bettingtips/models/tip.dart';
import 'package:flutter/material.dart';
import 'package:bettingtips/Template_Material/Sample_Screen/Animation/FadeAnimation.dart';

class TipList extends StatelessWidget {
  final List<Tip> tipList;

  const TipList({Key key, this.tipList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RaisedButton(
          onPressed: () {
            AddDialog(context);
          },
          child: Text('Add'),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: tipList.length,
            // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //   crossAxisCount: 2,
            //   childAspectRatio: 1.5 / 1.8,
            // ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () {},
                    child: FadeAnimation(
                      0.5,
                      itemCard(
                        image: "assets/images/category7.jpg",
                        title: tipList[index].title,
                        tip: tipList[index],
                      ),
                    )),
              );
            },
          ),
        ),
      ],
    );
  }
}

class itemCard extends StatelessWidget {
  String image, title;
  Tip tip;
  TipsBloc _tipsBloc;
  itemCard({this.image, this.title, this.tip});

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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
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
                    SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.edit, color: Colors.blueAccent),
                        SizedBox(width: 18),
                        GestureDetector(
                            onTap: () {
                              simpleDialog(context, tip);
                            },
                            child: Icon(Icons.delete, color: Colors.redAccent)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void simpleDialog(BuildContext context, Tip tip) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Delete Tip?",
            style: TextStyle(
                fontFamily: "Sofia",
                fontWeight: FontWeight.w700,
                fontSize: 18.0)),
        actions: <Widget>[
          FlatButton(
            child: const Text('CANCEL', style: TextStyle(fontFamily: "Sofia")),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: const Text('OK', style: TextStyle(fontFamily: "Sofia")),
            onPressed: () {
              TipsBloc bloc = new TipsBloc();
              bloc.deleteTip(tip.id);
              Navigator.of(context).pop();
            },
          )
        ],
      );
    },
  );
}

void AddDialog(BuildContext context, {Tip tip}) {
  final _formKey = GlobalKey<FormState>();
  Tip nutip = new Tip();
  TextEditingController catname = new TextEditingController();
  TextEditingController tags = new TextEditingController();
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Add Tip",
            style: TextStyle(
                fontFamily: "Sofia",
                fontWeight: FontWeight.w700,
                fontSize: 18.0)),
        content: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                // The validator receives the text that the user has entered.
                controller: tags,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some tip name';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    autofocus: false,
                    controller: catname,
                    cursorColor: Colors.amber,
                    style: TextStyle(height: 2.0),
                    cursorWidth: 2.5,
                    decoration: InputDecoration(
                      labelText: "Category name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                              color: Colors.amber, style: BorderStyle.solid)),
                    ),
                    onFieldSubmitted: (text) {
                      print(text);
                    },
                    validator: (value) {
                      if (value.isEmpty || value == " ") {
                        return "Value cannot  be empty";
                      }
                      return "";
                    }),
              ),
              ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState.validate()) {
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')));
                    TipsBloc bloc = new TipsBloc();
                    bloc.add(nutip);
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: const Text('CANCEL', style: TextStyle(fontFamily: "Sofia")),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: const Text('OK', style: TextStyle(fontFamily: "Sofia")),
            onPressed: () {
              TipsBloc bloc = new TipsBloc();
              bloc.deleteTip(tip.id);
              Navigator.of(context).pop();
            },
          )
        ],
      );
    },
  );
}
