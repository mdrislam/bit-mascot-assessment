import 'package:bit_mascot_assessment/features/home/controllers/home_controller.dart';
import 'package:bit_mascot_assessment/features/home/views/components/photo_card.dart';


import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie List')),
      body: Obx(() {
        if (controller.isLoading.value && controller.photos.isEmpty) {
          return _buildShimmerLoader();
        }
        return ListView.builder(
          controller: controller.scrollController,
          itemCount: controller.photos.length + 1,
          itemBuilder: (context, index) {
            if (index < controller.photos.length) {
              return PhotoCard(
                photo: controller.photos[index],

                onFavorite: () =>
                    controller.toggleFavorite(controller.photos[index]),
                onTap: () {},
              );
            } else {
              return controller.isLoading.value
                  ? const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : const SizedBox();
            }
          },
        );
      }),
    );
  }

  Widget _buildShimmerLoader() => ListView.builder(
    itemCount: 10,
    itemBuilder: (_, __) => Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListTile(
        leading: const CircleAvatar(radius: 30),
        title: Container(height: 10, color: Colors.white),
        subtitle: Container(height: 8, color: Colors.white),
      ),
    ),
  );
}
