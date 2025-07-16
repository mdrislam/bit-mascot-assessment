import 'package:bit_mascot_assessment/core/theme/app_colors.dart';
import 'package:bit_mascot_assessment/core/theme/app_sizes.dart';
import 'package:bit_mascot_assessment/core/theme/app_text_styles.dart';
import 'package:bit_mascot_assessment/core/utils/app_responsive_info.dart';
import 'package:bit_mascot_assessment/data/remote/featurs/details/models/movie_model.dart';
import 'package:bit_mascot_assessment/features/details/controllers/details_controller.dart';
import 'package:bit_mascot_assessment/features/details/views/components/details_row_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailScreen extends GetView<DetailsController> {
  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MovieModel moviee = MovieModel.fromJson(controller.moviee);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: AppResponsiveInfo.h(AppSizes.apBarHeight),
            backgroundColor: AppColors.primary,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://image.tmdb.org/t/p/original${moviee.backdropPath}',
                fit: BoxFit.cover,
              ),
            ),
            pinned: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.white),
              color: AppColors.textWhite,
              onPressed: () => Get.back(),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.favorite_border, color: AppColors.white),
                onPressed: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: AppResponsiveInfo.paddingAll(AppSizes.paddingMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500${moviee.backdropPath}',
                          width: AppResponsiveInfo.h(AppSizes.iconMedium),
                          height: AppResponsiveInfo.h(AppSizes.iconLarge),
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: AppResponsiveInfo.spacingMedium),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(moviee.title, style: AppTextStyles.headline2),
                            SizedBox(height: AppResponsiveInfo.spacingSmall),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: AppColors.warning,
                                  size: AppResponsiveInfo.icon(
                                    AppSizes.iconSmall,
                                  ),
                                ),
                                SizedBox(width: AppResponsiveInfo.spacingSmall),
                                Text(
                                  moviee.voteAverage.toString(),
                                  style: AppTextStyles.body,
                                ),
                                SizedBox(
                                  width: AppResponsiveInfo.spacingMedium,
                                ),
                                Text(
                                  controller.formatDate(
                                    moviee.releaseDate.toString(),
                                  ),
                                  style: AppTextStyles.body,
                                ),
                              ],
                            ),
                            SizedBox(width: AppResponsiveInfo.spacingMedium),
                            Wrap(
                              spacing: AppResponsiveInfo.spacingSmall,
                              runSpacing: AppResponsiveInfo.spacingSmall,
                              children: (moviee.genres)
                                  .map<Widget>(
                                    (genre) => Chip(
                                      label: Text(genre),
                                      backgroundColor: Get
                                          .theme
                                          .colorScheme
                                          .secondary
                                          .withOpacity(0.2),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppResponsiveInfo.spacingLarge),
                  Text('Overview', style: AppTextStyles.headline2),
                  SizedBox(height: AppResponsiveInfo.spacingSmall),
                  Text(moviee.overview.toString(), style: AppTextStyles.body),
                  SizedBox(height: AppResponsiveInfo.spacingLarge),
                  DetailsRowComponents(
                    title: 'Status',
                    value: moviee.status.toString(),
                  ),
                  DetailsRowComponents(
                    title: 'Budget',
                    value: controller.formatCurrency(moviee.budget as int?),
                  ),
                  DetailsRowComponents(
                    title: 'Revenue',
                    value: controller.formatCurrency(moviee.revenue),
                  ),
                  DetailsRowComponents(
                    title: 'Runtime',
                    value: controller.formatRuntime(moviee.runtime),
                  ),
                  SizedBox(height: AppResponsiveInfo.spacingLarge),
                  Text('Cast', style: AppTextStyles.bodyLarge),
                  SizedBox(height: AppResponsiveInfo.spacingMedium),

                  SizedBox(
                    height: AppResponsiveInfo.h(
                      AppSizes.detailsScreenImageheight,
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: moviee.cast.length,
                      itemBuilder: (context, index) {
                        final actor = moviee.cast[index];

                        return Container(
                          width: AppResponsiveInfo.w(
                            AppSizes.detailsScreenImagewidth,
                          ),
                          margin: AppResponsiveInfo.marginOnly(
                            right: AppSizes.paddingSmall,
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  actor.profilePath != null
                                      ? 'https://image.tmdb.org/t/p/w200${actor.profilePath}'
                                      : '', // Intentionally empty to trigger errorBuilder if null
                                  width: AppResponsiveInfo.w(
                                    AppSizes.detailsScreenImagewidth,
                                  ),
                                  height: AppResponsiveInfo.h(
                                    AppSizes.detailsScreenImagewidth,
                                  ),
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                      'assets/images/flutter_logo.png', // Use your Flutter logo here
                                      width: AppResponsiveInfo.w(
                                        AppSizes.detailsScreenImagewidth,
                                      ),
                                      height: AppResponsiveInfo.h(
                                        AppSizes.detailsScreenImagewidth,
                                      ),
                                      fit: BoxFit.cover,
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: AppResponsiveInfo.spacingSmall),
                              Text(
                                actor.name ?? 'Unknown',
                                style: AppTextStyles.body,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                actor.character ?? '',
                                style: AppTextStyles.bodySmall,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
