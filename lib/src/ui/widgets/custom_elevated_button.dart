import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final String iconPath;
  final Color color;
  final void Function() onTap;

  const CustomElevatedButton({
    Key key,
    @required this.text,
    this.icon,
    this.iconPath,
    @required this.color,
    @required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: color,
            width: 3,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: <Widget>[
              if (icon != null)
                Icon(
                  icon,
                  color: color,
                  size: 35,
                ),
              if (iconPath != null)
                ImageIcon(
                  AssetImage(
                    iconPath,
                  ),
                  color: color,
                  size: 35,
                ),
              const SizedBox(width: 15),
              Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
