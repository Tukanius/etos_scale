import 'package:after_layout/after_layout.dart';
import 'package:etos_scale_windows/components/info/scale_card.dart';
import 'package:etos_scale_windows/models/result.dart';
import 'package:flutter/material.dart';

class ScaleList extends StatefulWidget {
  final Result? data;
  const ScaleList({
    super.key,
    this.data,
  });

  @override
  State<ScaleList> createState() => _ScaleListState();
}

class _ScaleListState extends State<ScaleList> with AfterLayoutMixin {
  @override
  afterFirstLayout(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: widget.data!.count,
      itemBuilder: (context, index) {
        return ScaleCard(
          data: widget.data!.rows![index],
        );
      },
    );
  }
}
