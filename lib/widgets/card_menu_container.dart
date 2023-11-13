import 'package:flutter/material.dart';

class CardMenuContainer extends StatelessWidget {
  final String title;
  final String content;
  final IconData iconData;
  final void Function()? onPressed;
  const CardMenuContainer({
    super.key,
    required this.title,
    required this.content,
    required this.iconData,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 5,
      height: MediaQuery.of(context).size.height / 6,
      child: MouseRegion(
        cursor: MaterialStateMouseCursor.clickable,
        child: GestureDetector(
          onTap: onPressed,
          child: Card(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            maxRadius: MediaQuery.of(context).size.height / 22,
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            child: Icon(
                              iconData,
                              size: MediaQuery.of(context).size.height / 22,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: Theme.of(context).textTheme.headlineLarge,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 19.1,
                              child: Text(
                                content,
                                style: Theme.of(context).textTheme.bodyMedium,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
