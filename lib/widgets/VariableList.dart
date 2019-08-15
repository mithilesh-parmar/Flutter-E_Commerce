import 'package:flutter/material.dart';

class VariableList extends StatefulWidget {
  final String title;
  final variantsList;

  final type;

  VariableList({this.title, @required this.variantsList, @required this.type});

  @override
  _VariableListState createState() => _VariableListState();
}

class _VariableListState extends State<VariableList> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        //heading container
        Text(
          widget.title,
          style: TextStyle(
//            color: Colors.black87,
            fontSize: 16,
            fontFamily: 'Raleway-bold',
          ),
        ),

        // variants container
        Container(
          height: 60,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.variantsList.length,
              itemBuilder: (context, pos) {
                var item = widget.variantsList[pos];
                return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = pos;
                      });
                    },
                    child: widget.type == 'SIZE'
                        ? _sizeItem(
                            size: item.toString(),
                            isSelected: currentIndex == pos,
                          )
                        : _colorItem(
                            color: item,
                            isSelected: currentIndex == pos,
                          ));
              }),
        ),
      ],
    );
  }

  Widget _colorItem({Color color, bool isSelected}) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(top: 8, right: 8, bottom: 8),
      width: 50,
      decoration: BoxDecoration(
          border: isSelected
              ? Border.all(color: Colors.black.withOpacity(.4), width: 3)
              : null,
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: isSelected ? Colors.black.withOpacity(.4) : Colors.white,
                offset: Offset(0, 3),
                blurRadius: 10)
          ]),
    );
  }

  Widget _sizeItem({String size, bool isSelected}) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(top: 8, right: 8, bottom: 8),
      width: 50,
      decoration: BoxDecoration(
          color: isSelected ? Colors.orangeAccent : Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
                color: isSelected ? Colors.black.withOpacity(.4) : Colors.white,
                offset: Offset(0, 0),
                blurRadius: 10)
          ]),
      child: Center(
        child: Text(
          size,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
