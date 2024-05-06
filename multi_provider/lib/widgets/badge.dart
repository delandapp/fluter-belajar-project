import 'package:flutter/material.dart';

class BadgeCart extends StatelessWidget {
  const BadgeCart({
    required this.child,
    required this.value,
    required this.color,
    super.key,
  });

  final Widget child;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        if (value != '0')
          Positioned(
            right: 4,
            top: 2,
            child: Container(
              padding: const EdgeInsets.all(2.0),
              // color: Theme.of(context).accentColor,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: color != null
                    ? color
                    : Theme.of(context).colorScheme.secondary,
              ),
              constraints: const BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                ),
              ),
            ),
          )
      ],
    );
  }
}
