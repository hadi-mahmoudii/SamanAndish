import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Core/Config/app_session.dart';
import '../../../Core/Widgets/five_navigation_button.dart';
import '../Widgets/blog_overview_row.dart';

import '../../../Core/Widgets/global_appbar.dart';
import '../../../Core/Widgets/loading_widget.dart';
import '../Providers/list.dart';

class BlogListScreen extends StatelessWidget {
  const BlogListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BlogListProvider>(
      create: (ctx) => BlogListProvider(),
      child: const BlogListScreenTile(),
    );
  }
}

class BlogListScreenTile extends StatefulWidget {
  const BlogListScreenTile({
    Key? key,
  }) : super(key: key);

  @override
  _BlogListScreenTileState createState() => _BlogListScreenTileState();
}

class _BlogListScreenTileState extends State<BlogListScreenTile> {
  @override
  initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<BlogListProvider>(context, listen: false)
          .getDatas(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context).textTheme;
    return Consumer<BlogListProvider>(
      builder: (ctx, provider, _) => Scaffold(
        bottomNavigationBar: const BottomNavigationButtons(
          curIndex: 1,
          mainFontColor: mainFontColor,
        ),
        appBar: const GlobalAppBar(
          eLabel: 'BLOG',
          pLabel: 'اخبار و مطالب',
        ).build(context),
        body: provider.isLoading
            ? const Center(
                child: LoadingWidget(),
              )
            : NotificationListener(
                onNotification: (ScrollNotification notification) {
                  if (notification is ScrollUpdateNotification) {
                    if (provider.scrollController.position.pixels >
                            provider.scrollController.position.maxScrollExtent -
                                30 &&
                        !provider.isLoadingMore) {
                      provider.getDatas(context);
                    }
                  }
                  return true;
                },
                child: RefreshIndicator(
                  onRefresh: () async =>
                      provider.getDatas(context, resetPage: true),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView(
                      controller: provider.scrollController,
                      children: [
                        const SizedBox(height: 20),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (ctx, ind) => BlogOverviewRow(
                              blog: provider.blogs[ind], themeData: themeData),
                          separatorBuilder: (ctx, ind) =>
                              const SizedBox(height: 10),
                          itemCount: provider.blogs.length,
                        ),
                        const SizedBox(height: 25),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
