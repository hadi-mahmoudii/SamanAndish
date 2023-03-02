import 'package:flutter/material.dart';

import '../../../Core/Config/app_session.dart';
import '../../../Core/Widgets/flutter_icons.dart';
import '../../Product/Models/category_product.dart';
import '../../Product/Widgets/product_item_card.dart';

class HomeSpecialCategoriesWidget extends StatefulWidget {
  const HomeSpecialCategoriesWidget({
    Key? key,
    required this.themeData,
    required this.categories,
  }) : super(key: key);

  final TextTheme themeData;
  final List<List<CategoryProductModel>> categories;

  @override
  State<HomeSpecialCategoriesWidget> createState() =>
      _HomeSpecialCategoriesWidgetState();
}

class _HomeSpecialCategoriesWidgetState
    extends State<HomeSpecialCategoriesWidget> {
  final ScrollController _controller = ScrollController();
  // ignore: prefer_final_fields
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return widget.categories.isNotEmpty
        ? ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              SizedBox(
                height: 200,
                // width: 100,
                child: ListView.builder(
                  controller: _controller,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, ind) => SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 200,
                          width: MediaQuery.of(context).size.width / 10 * 4,
                          child: ProductItemCard(
                              widget.categories[ind][0], widget.themeData),
                        ),
                        const SizedBox(width: 5),
                        widget.categories[ind].length > 1
                            ? SizedBox(
                                height: 200,
                                width:
                                    MediaQuery.of(context).size.width / 10 * 4,
                                child: ProductItemCard(
                                    widget.categories[ind][1],
                                    widget.themeData),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  itemCount: widget.categories.length,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () async {
                      _controller.jumpTo(
                        _controller.position.pixels -
                            MediaQuery.of(context).size.width +
                            40,
                        // duration: const Duration(milliseconds: 300),
                        // curve: Curves.linear,
                      );
                      setState(() {
                        if (_current > 0) {
                          _current--;
                        }
                      });
                    },
                    icon: const Icon(
                      FlutterIcons.left_chevron,
                      size: 20,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.categories.asMap().entries.map((entry) {
                      return GestureDetector(
                        // onTap: () => _controller.jumpToPage(entry.key),
                        child: Container(
                          width: 10.0,
                          height: 10.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: _current != entry.key
                                ? Colors.grey.withOpacity(.5)
                                : mainFontColor,
                          ),
                          child: const Text(' '),
                        ),
                      );
                    }).toList(),
                  ),
                  IconButton(
                    onPressed: () async {
                      _controller.jumpTo(
                        _controller.position.pixels +
                            MediaQuery.of(context).size.width -
                            40,
                        // duration: const Duration(milliseconds: 300),
                        // curve: Curves.linear,
                      );
                      setState(() {
                        if (_current < widget.categories.length - 1) {
                          _current++;
                        }
                      });
                    },
                    icon: const Icon(
                      FlutterIcons.right_chevron,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ],
          )
        : Container();
  }
}
