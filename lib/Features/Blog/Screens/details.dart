import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Core/Config/routes.dart';
import '../../../Core/Widgets/flutter_icons.dart';
import '../../../Core/Widgets/global_appbar.dart';
import '../../../Core/Widgets/loading_widget.dart';
import '../../../Core/Widgets/new_page_navigator_button.dart';
import '../Providers/details.dart';

class BlogDetailsScreen extends StatelessWidget {
  const BlogDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BlogDetailsProvider>(
      create: (ctx) => BlogDetailsProvider(
        blogId: ModalRoute.of(context)!.settings.arguments as String,
      ),
      child: const BlogDetailsScreenTile(),
    );
  }
}

class BlogDetailsScreenTile extends StatefulWidget {
  const BlogDetailsScreenTile({
    Key? key,
  }) : super(key: key);

  @override
  _BlogDetailsScreenTileState createState() => _BlogDetailsScreenTileState();
}

class _BlogDetailsScreenTileState extends State<BlogDetailsScreenTile> {
  @override
  initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<BlogDetailsProvider>(context, listen: false)
          .getDatas(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context).textTheme;
    return Consumer<BlogDetailsProvider>(
      builder: (ctx, provider, _) => Scaffold(
        appBar: const GlobalAppBar(
          eLabel: 'BLOG DETAILS',
          pLabel: 'جزئیات خبر',
        ).build(context),
        body: provider.isLoading
            ? const Center(
                child: LoadingWidget(),
              )
            : ListView(
                children: [
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 15,
                    ),
                    child: Image.network(
                      provider.blog.thumbnail,
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      provider.blog.title,
                      style: themeData.subtitle1,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            provider.blog.createdAt,
                            style: themeData.headline5,
                            // textScaleFactor: _pixelRatio,
                            overflow: TextOverflow.visible,
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                        const SizedBox(width: 2),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 1),
                          child: const Icon(
                            FlutterIcons.clock,
                            size: 10,
                            color: Color(0XFF1B2749),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20, left: 20, bottom: 40),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Html(
                        shrinkWrap: true,
                        data: provider.blog.content,
                        onLinkTap: (site, _, __, ___) async {
                          await launch(site!);
                        },
                        // onLinkTap: (link) async {
                        //   await launch(link);
                        // },
                        // style: {
                        //   'p': Style(
                        //     color: Colors.black,
                        //     // direction: TextDirection.rtl,
                        //     textAlign: TextAlign.end,
                        //   ),
                        // },
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  NewPageNavigatorButton(
                    themeData: themeData,
                    title: 'نظـــــــرات کـــــــــــــاربران',
                    subTitle: 'Comments',
                    color: const Color(0XFF102A45),
                    func: () {
                      Navigator.of(context).pushNamed(
                        Routes.comment,
                        arguments: [
                          provider.blog.id,
                          'article',
                        ],
                      );
                    },
                    isCommentType: true,
                    subValue: provider.blog.commentsCount,
                    icon: FlutterIcons.chat,
                  ),
                  const SizedBox(height: 50),
                ],
              ),
      ),
    );
  }
}
