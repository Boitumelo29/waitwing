import 'package:flutter/material.dart';
import 'package:waitwing/core/extenstions/localization_extensions.dart';


class ServiceContent extends StatelessWidget {
  const ServiceContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(context.loc.describeContent),
              Text(context.loc.describeContentSub),
              GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(8),
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(6, (index) {
                  return Container(
                    color: Colors.blueAccent,
                    child: Center(
                      child: Text('Item $index',
                          style: const TextStyle(color: Colors.white)),
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
