import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  static String id = "ProfilePage";

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 14),
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            ProfileTopBanner(),
            ProfilePageHeader(
              text: "Orders",
            ),
            Row(
              children: <Widget>[
                TopIconButton(
                  text: "Orders",
                  onPressed: () {},
                  icon: Icons.reorder,
                ),
                VerticalDivider(),
                TopIconButton(
                  text: "Returns",
                  onPressed: () {},
                  icon: Icons.keyboard_return,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                indent: 8,
                color: Colors.grey,
              ),
            ),
            ProfilePageHeader(text: 'My Info'),
            Row(
              children: <Widget>[
                TopIconButton(
                  text: "Personal Info",
                  onPressed: () {},
                  icon: Icons.group,
                ),
                VerticalDivider(),
                TopIconButton(
                  text: "Saved Cards",
                  onPressed: () {},
                  icon: Icons.credit_card,
                ),
                VerticalDivider(),
                TopIconButton(
                  text: "Bank Details",
                  onPressed: () {},
                  icon: Icons.account_balance,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                indent: 8,
                color: Colors.grey,
              ),
            ),
            ProfilePageHeader(text: 'Share and Feedback'),
            IconTile(
              text: "Feedback",
            ),
            IconTile(
              text: "Rate us",
            ),
            ProfilePageHeader(
              text: "Support",
            ),
            IconTile(
              text: "Help/Support",
            ),
            IconTile(
              text: "FAQ's",
            ),
            IconTile(
              text: "About us",
            ),
            Padding(
              padding: EdgeInsets.all(18),
              child: Text("mithileshparmar1@gmail.com"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ButtonTheme(
                minWidth: 320,
                height: 40,
                child: FlatButton(
                    onPressed: () {},
                    color: Colors.deepOrangeAccent,
                    child: Text(
                      "LOGOUT",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w500),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6))),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class VerticalDivider extends StatelessWidget {
  final double width;
  final double height;

  VerticalDivider({this.width = 1, this.height = 35});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.all(height),
      color: Colors.grey,
    );
  }
}

class IconTile extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final String text;
  final TextStyle textStyle;
  final Function onPressed;

  IconTile(
      {this.icon = Icons.arrow_forward_ios,
      this.iconSize = 20,
      this.text,
      this.textStyle,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(.7),
      child: ListTile(
        onTap: onPressed,
        trailing: Icon(
          icon,
          size: iconSize,
        ),
        title: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}

class TopIconButton extends StatelessWidget {
  final String text;
  final double height;
  final Function onPressed;
  final double iconHeight;
  final IconData icon;
  final double fontSize;

  TopIconButton(
      {this.text,
      this.height = 65,
      this.onPressed,
      this.iconHeight = 40,
      this.icon,
      this.fontSize = 16});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ButtonTheme(
        height: height,
        child: FlatButton(
            color: Colors.white.withOpacity(.7),
            onPressed: onPressed,
            child: Column(
              children: <Widget>[
                Icon(
                  icon,
                  size: iconHeight,
                  color: Colors.black.withOpacity(.6),
                ),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Raleway', fontSize: fontSize),
                )
              ],
            )),
      ),
    );
  }
}

class ProfilePageHeader extends StatelessWidget {
  final String text;

  ProfilePageHeader({this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
        child: Text(
          text,
          style: TextStyle(
              fontFamily: 'Raleway', fontSize: 22, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class ProfileTopBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [Colors.orangeAccent, Colors.amberAccent],
        ),
        color: Colors.deepOrangeAccent.shade100,
      ),
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 55,
              child: Placeholder(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                  ),
                  child: Text(
                    'Welcome Mithilesh',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Raleway'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 4),
                  child: Text(
                    '8561057510',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FlatButton.icon(
                        onPressed: () {},
                        splashColor: Colors.deepOrangeAccent.shade100,
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                        label: Text(
                          'Wishlist',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        )),
                    FlatButton.icon(
                        onPressed: () {},
                        splashColor: Colors.deepOrangeAccent.shade100,
                        icon: Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        label: Text(
                          'Address',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
