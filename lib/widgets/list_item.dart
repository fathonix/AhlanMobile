import 'package:ahlan_mobile/constants.dart';
import 'package:ahlan_mobile/models/posts.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';

class ListItem extends StatelessWidget {
  final Posts post;
  final void Function(Posts) onTap;

  const ListItem({
    Key? key,
    required this.post,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(post),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Constants.borderRadius),
          border: Border.all(color: Constants.borderColor),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 150.0,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(Constants.borderRadius),
                  topRight: Radius.circular(Constants.borderRadius),
                ),
                image: DecorationImage(
                  image: NetworkImage(post.embedded.wpFeaturedMedia.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(Constants.borderRadius),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(Constants.borderRadius),
                  bottomRight: Radius.circular(Constants.borderRadius),
                ),
              ),
              child: Column(
                children: [
                  Text(parse(post.title.rendered).body!.innerHtml,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Constants.titleColor,
                          fontSize: 20,
                          fontFamily: Constants.headingFontFamily)),
                  post.embedded.author != null
                      ? Column(
                          children: [
                            const SizedBox(height: 10.0),
                            Row(
                              children: [
                                CircleAvatar(
                                    foregroundImage: NetworkImage(
                                        post.embedded.author!.avatarUrl24)),
                                const SizedBox(width: 10.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(post.embedded.author!.name,
                                        style: const TextStyle(
                                            color: Constants.subtitleColor,
                                            fontFamily:
                                                Constants.globalFontFamily)),
                                    Text(
                                        DateFormat.yMMMd(Intl.getCurrentLocale())
                                            .format(post.dateGmt.toLocal()),
                                        style: const TextStyle(
                                            fontFamily:
                                                Constants.globalFontFamily)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
