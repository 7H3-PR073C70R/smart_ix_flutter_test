import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';


class WimuevePage extends StatelessWidget {
  const WimuevePage({super.key, this.body, this.title});
  final Widget? body;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: body,
      appBar: PlatformAppBar(
        title: title,
      ),
    );
  }
}
