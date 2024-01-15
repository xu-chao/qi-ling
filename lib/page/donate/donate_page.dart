import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonatePage extends StatelessWidget {
  const DonatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  _PageContainer();
  }
}

class _PageContainer extends StatefulWidget {
  const _PageContainer({Key? key}) : super(key: key);

  @override
  State<_PageContainer> createState() => _PageContainerState();
}

class _PageContainerState extends State<_PageContainer> {
  List<_DonateItemData>? _donateConfig;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const LinearProgressIndicator(
        backgroundColor: Colors.transparent,
        minHeight: 2,
      );
    }

    return ListView.builder(
      itemBuilder: (context, index) {
        final itemData = _donateConfig![index];
        final List<String> imageUrls =
            _donateConfig?.map((e) => e.image).toList() ?? [];

        return InkWell(
          onTap: () {
            Get.toNamed(
              '/gallary',
              arguments: {"urls": imageUrls, "index": index},
            );
          },
          child: _ListItem(
            data: itemData,
          ),
        );
      },
      itemCount: _donateConfig?.length ?? 0,
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({Key? key, required this.data}) : super(key: key);
  final _DonateItemData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 24,
        ),
        SizedBox(
          width: 202,
          height: 202,
        ),
        const SizedBox(
          height: 28,
        ),
        Text(data.name),
      ],
    );
  }
}

class _DonateItemData {
  final String name;
  final String image;
  final String imageSmall;

  const _DonateItemData(
      {required this.name, required this.image, required this.imageSmall});
}
