import 'package:flutter/material.dart';
import 'package:grocery_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:grocery_app/features/home/presentation/widgets/categories_section.dart';
import 'package:grocery_app/features/home/presentation/widgets/custom_appbar.dart';
import 'package:grocery_app/features/home/presentation/widgets/mod.dart';
import 'package:grocery_app/features/home/presentation/widgets/nearby_store_section.dart';
import 'package:grocery_app/features/home/presentation/widgets/promotions_section.dart';
import 'package:grocery_app/features/home/presentation/widgets/refer_earn_banner.dart';
import 'package:grocery_app/features/home/presentation/widgets/section_header.dart';
import 'package:grocery_app/features/home/presentation/widgets/trending_stores_section.dart';
import 'package:grocery_app/features/home/presentation/widgets/craze_deals_card.dart';

class HomeContent extends StatelessWidget {
  final HomeLoaded state;
  final Future<void> Function() onRefresh;
  final VoidCallback onNotificationTap;

  const HomeContent({
    super.key,
    required this.state,
    required this.onRefresh,
    required this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomAppBar(
              onNotificationTap: onNotificationTap,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Text(
                'what would you like to do today?',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold,fontSize: 18),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: CategoriesSection(categories: state.categories),
          ),
          SliverToBoxAdapter(
            child: SectionHeader(
              title: 'Top picks for you',
              showSeeAll: false,
              onSeeAllTap: () {},
            ),
          ),
          SliverToBoxAdapter(
            child: PromotionsSection(promotions: state.promotions),
          ),
          SliverToBoxAdapter(
            child: SectionHeader(
              title: 'Trending',
              showSeeAll: true,
              onSeeAllTap: () {},
            ),
          ),
          SliverToBoxAdapter(
            child: TrendingStoresSection(stores: state.trendingStores),
          ),
          SliverToBoxAdapter(
            child: SectionHeader(
              title: 'Craze deals',
              showSeeAll: false,
              onSeeAllTap: () {},
            ),
          ),
          const SliverToBoxAdapter(
            child: HorizontalCrazeDeals(),
          ),
          const SliverToBoxAdapter(
            child: ReferEarnBanner(),
          ),
          SliverToBoxAdapter(
            child: SectionHeader(
              title: 'Nearby stores',
              showSeeAll: true,
              onSeeAllTap: () {},
            ),
          ),
          SliverToBoxAdapter(
            child: NearbyStoresSection(stores: state.nearbyStores),
          ),
          SliverToBoxAdapter(
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
    child: Align(
      alignment: Alignment.center, // or center, or right as needed
      child: SizedBox(
        width: 250,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          child: const Text('View all stores'),
        ),
      ),
    ),
  ),
),

          const SliverToBoxAdapter(
            child: SizedBox(height: 80),
          ),
        ],
      ),
    );
  }
}
