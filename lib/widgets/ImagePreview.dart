import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/util/constants.dart';

class ImagePreview extends StatefulWidget {
  final List src;
  final double height, width, previewHeight, previewWidth;
  final int defaultImageIndex;

  ImagePreview(
      {@required this.src,
      this.height,
      this.width,
      this.previewHeight,
      this.previewWidth,
      this.defaultImageIndex = 0});

  @override
  _ImagePreviewState createState() => _ImagePreviewState(defaultImageIndex);
}

class _ImagePreviewState extends State<ImagePreview> {
  int _selectedIndex;

  _ImagePreviewState(this._selectedIndex);

  void _onPreviewTap(int index) {
    setState(() {
      _selectedIndex = index > widget.src.length - 1 ? 0 : index;
    });
  }

  @override
  Widget build(BuildContext context) {
//    return Stack(
//      children: <Widget>[
//        GestureDetector(
//          onHorizontalDragEnd: (details) {
//             _onPreviewTap(_selectedIndex + 1);
//          },
//          child: Container(
//            width: widget.width == null
//                ? MediaQuery.of(context).size.width
//                : widget.width,
//            height: widget.height == null
//                ? (MediaQuery.of(context).size.height / 1.55)
//                : widget.height,
//            decoration: BoxDecoration(
//              color: Colors.transparent,
//              borderRadius: BorderRadius.all(
//                Radius.circular(6),
//              ),
//              image: DecorationImage(
//                  image: NetworkImage(widget.src[_selectedIndex]),
//                  fit: BoxFit.cover),
//            ),
//          ),
//        ),
//        Positioned(
//          bottom: 0,
//          height: widget.previewHeight + 10,
//          width: MediaQuery.of(context).size.width,
//          child: ListView.builder(
//              scrollDirection: Axis.horizontal,
//              itemCount: widget.src.length,
//              shrinkWrap: true,
//              itemBuilder: (context, pos) {
//                return GestureDetector(
//                  onTap: () {
//                    _onPreviewTap(pos);
//                  },
//                  child: Container(
//                    margin: EdgeInsets.all(2),
//                    height: widget.previewHeight,
//                    width: widget.previewWidth,
//                    decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(4),
//                        border: Border.all(
//                            color: _selectedIndex == pos
//                                ? Theme.of(context).accentColor
//                                : Colors.black54),
//                        image: DecorationImage(
//                            image: NetworkImage(widget.src[pos]))),
//                  ),
//                );
//              }),
//        )
//      ],
//    );

    return Stack(
      children: <Widget>[
        CarouselSlider(
//          autoPlay: true,
//          height: MediaQuery.of(context).size.height / 1.55,
          height: Constants.screenAwareSize(
              MediaQuery.of(context).size.height / 2.5, context),
//          pauseAutoPlayOnTouch: Duration(seconds: 1),
          viewportFraction: .9,

          enlargeCenterPage: true,
          items: widget.src.map((url) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 2.0),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover, image: NetworkImage(url))),
                );
              },
            );
          }).toList(),
        ),
        // TODO add a favourite button
      ],
    );
  }
}
