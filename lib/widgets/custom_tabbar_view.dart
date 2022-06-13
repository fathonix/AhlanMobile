import 'package:ahlan_mobile/constants.dart';
import 'package:ahlan_mobile/models/page_data.dart';
import 'package:ahlan_mobile/models/posts.dart';
import 'package:ahlan_mobile/screens/blog_detail.dart';
import 'package:ahlan_mobile/screens/magazine_detail.dart';
import 'package:ahlan_mobile/services/api_client.dart';
import 'package:ahlan_mobile/widgets/list_item.dart';
import 'package:ahlan_mobile/widgets/reload_dialog.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CustomTabBarView extends StatefulWidget {
  final String type;

  const CustomTabBarView({Key? key, required this.type}) : super(key: key);

  @override
  State<CustomTabBarView> createState() => _CustomTabBarViewState();
}

class _CustomTabBarViewState extends State<CustomTabBarView> {
  late final PagingController _pagingController;
  int _currentPage = 1;

  @override
  void initState() {
    _pagingController = PagingController<int, Posts>(
      firstPageKey: 1,
    );
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView.separated(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<dynamic>(
        itemBuilder: (context, post, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: ListItem(
              post: post,
              onTap: (post) => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    if (widget.type == 'E-Magazine') {
                      return MagazineDetailScreen(post: post);
                    }
                    return BlogDetailScreen(post: post);
                  }))),
        ),
        noItemsFoundIndicatorBuilder: (context) =>
            Center(child: Text(
              'No items found.',
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                fontFamily: Constants.globalFontFamily,
              ),
            )),
        noMoreItemsIndicatorBuilder: (context) => const SizedBox.shrink(),
        firstPageErrorIndicatorBuilder: (context) => ReloadDialog(
          desc: _pagingController.error.toString(),
          callback: () => _pagingController.refresh(),
        ),
        newPageErrorIndicatorBuilder: (context) => ReloadDialog(
          desc: _pagingController.error.toString(),
          callback: () => _pagingController.refresh(),
        ),
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 15.0),
    );
  }

  Future<void> _fetchPage(int page) async {
    try {
      late final PageData? newPage;
      switch (widget.type) {
        case 'Rubrik':
          newPage = await ApiClient.getPosts(page);
          break;

        case 'E-Magazine':
          newPage = await ApiClient.getMagazines(page);
          break;
      }

      debugPrint('_currentPage = $_currentPage');
      final isLastPage = newPage!.totalPages < ++_currentPage;

      if (isLastPage) {
        _pagingController.appendLastPage(newPage.posts);
      } else {
        _pagingController.appendPage(newPage.posts, _currentPage);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }
}
