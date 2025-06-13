import 'package:flutter/material.dart';

class SocialMediaContainer extends StatelessWidget {
  final IconData icon;
  final String text;

  const SocialMediaContainer(
      {super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Stack(
            children: [
              const Icon(
                Icons.circle,
                color: Colors.green,
                size: 55,
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Align(
                  alignment: Alignment.center,
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            width: 30,
          ),
          Text(
            text,
            softWrap: true,
            maxLines: null,
            overflow: TextOverflow.visible,
            style: const TextStyle(
                fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }
}
