import 'package:e_commerce/util/constants.dart';
import 'package:flutter/material.dart';

class AttributesView extends StatefulWidget {
  final List attributes;
  final String title, subtitle;
  final double height, width;
  final List options;

  @override
  _AttributesViewState createState() => _AttributesViewState();

  //TODO adjust screen size

  AttributesView(
      {@required this.attributes,
      @required this.title,
      this.subtitle = 'size chart',
      @required this.width,
      @required this.height,
      this.options});
}

class _AttributesViewState extends State<AttributesView> {
  int _selectedIndex = 0;

  void _onAttributeTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Constants.screenAwareSize(100, context),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  widget.subtitle.toUpperCase(),
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).accentColor),
                ),
              ],
            ),
            SizedBox(
              height: Constants.screenAwareSize(10, context),
            ),
            Container(
                height: widget.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount: widget.attributes.length, //values.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, pos) {
                      return GestureDetector(
                        onTap: () {
                          _onAttributeTap(pos);
                        },
                        child: Container(
                          constraints: BoxConstraints(
                              minWidth: Constants.screenAwareSize(
                                  widget.width, context)),
                          padding: EdgeInsets.all(4),
                          margin: EdgeInsets.all(4),
                          child: Center(
                              child: Text(
                            '${widget.attributes[pos]}',
//                            style: TextStyle(color: pos == _selectedIndex
//                                ? Colors.orangeAccent
//                                : Theme.of(context).textTheme.title.color,),
                          )),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            boxShadow: [
                              BoxShadow(
                                color: pos == _selectedIndex
                                    ? Theme.of(context)
                                        .accentColor
                                        .withOpacity(.7)
                                    : Colors.transparent,
                                offset: Offset(0, 3),
                                blurRadius: 10,
                              )
                            ],
                            border: Border.all(
                                color: pos == _selectedIndex
                                    ? Colors.amberAccent
                                    : Theme.of(context).textTheme.title.color),
                          ),
                        ),
                      );
                    }))
          ],
        ));
  }
}
