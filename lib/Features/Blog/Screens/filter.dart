// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Core/Widgets/global_appbar.dart';
import '../../../Core/Widgets/loading_widget.dart';
import '../Providers/list.dart';

class BlogFilterScreen extends StatelessWidget {
  const BlogFilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BlogFilterScreenTile();
  }
}

class BlogFilterScreenTile extends StatefulWidget {
  const BlogFilterScreenTile({
    Key? key,
  }) : super(key: key);

  @override
  _BlogFilterScreenTileState createState() => _BlogFilterScreenTileState();
}

class _BlogFilterScreenTileState extends State<BlogFilterScreenTile> {
  @override
  initState() {
    super.initState();
    // Future.microtask(
    //   () => Provider.of<Test>(context, listen: false).getUserDatas(context),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BlogListProvider>(
      builder: (ctx, provider, _) => Scaffold(
        appBar: const GlobalAppBar(
          eLabel: 'BLOG FILTER',
          pLabel: 'فیلتر اخبار',
        ).build(context),
        body: provider.isLoading
            ? const Center(
                child: LoadingWidget(),
              )
            : NotificationListener(
                // onNotification: (ScrollNotification notification) {
                //   if (notification is ScrollUpdateNotification) {
                //     if (provider.scrollController.position.pixels >
                //             provider.scrollController.position
                //                     .maxScrollExtent -
                //                 30 &&
                //         provider.isLoadingMore) {}
                //   }
                //   return true;
                // },
                child: RefreshIndicator(
                  onRefresh: () async => print('object'),
                  child: ListView(
                    children: const [],
                  ),
                ),
              ),
      ),
    );
  }
}
