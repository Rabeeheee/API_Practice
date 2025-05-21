
//FLUTTER PACKAGES
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//APP FILES
import 'package:grocery_app/core/routes/app_router.dart';
import 'package:grocery_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:grocery_app/features/home/presentation/widgets/categories_section.dart';
import 'package:grocery_app/features/home/presentation/widgets/craze_deals_card.dart';
import 'package:grocery_app/features/home/presentation/widgets/custom_appbar.dart';
import 'package:grocery_app/features/home/presentation/widgets/custom_bottom_nav.dart';
import 'package:grocery_app/features/home/presentation/widgets/custom_elevated_button.dart';
import 'package:grocery_app/features/home/presentation/widgets/home_error.dart' as error_widget;
import 'package:grocery_app/features/home/presentation/widgets/home_loading.dart' as loading_widget;
import 'package:grocery_app/features/home/presentation/widgets/nearby_store_section.dart';
import 'package:grocery_app/features/home/presentation/widgets/promotions_section.dart';
import 'package:grocery_app/features/home/presentation/widgets/refer_earn_banner.dart';
import 'package:grocery_app/features/home/presentation/widgets/section_header.dart';
import 'package:grocery_app/features/home/presentation/widgets/trending_stores_section.dart';
import 'package:grocery_app/features/notifications/presentation/bloc/notification_bloc.dart';
import 'package:grocery_app/features/notifications/presentation/bloc/notification_event.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
             
              return const loading_widget.HomeLoading();
            } else if (state is HomeLoaded) {
            // REFRESH INDICATOR
              return RefreshIndicator(
      onRefresh: () async {
                  context.read<HomeBloc>().add(RefreshHomeDataEvent());
                },
      child: CustomScrollView(
        slivers: [
          // APPBAR
          SliverToBoxAdapter(
            child: CustomAppBar(
              onNotificationTap:  () {
                      context.read<NotificationsBloc>().add(GetNotificationsEvent());
                 Navigator.pushNamed(context, AppRouter.notificationsRoute);
                },
            ),
          ),
          // SECTION HEADER
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
          // CATEGORY SECTION
          SliverToBoxAdapter(
            child: CategoriesSection(categories: state.categories),
          ),
           // SECTION HEADER
          SliverToBoxAdapter(
            child: SectionHeader(
              title: 'Top picks for you',
              showSeeAll: false,
              onSeeAllTap: () {},
            ),
          ),
          // PROMOTION SECTION
          SliverToBoxAdapter(
            child: PromotionsSection(promotions: state.promotions),
          ),
          // SECTION HEADER
          SliverToBoxAdapter(
            child: SectionHeader(
              title: 'Trending',
              showSeeAll: true,
              onSeeAllTap: () {},
            ),
          ),
          // TRENDING SECTION 
          SliverToBoxAdapter(
            child: TrendingStoresSection(stores: state.trendingStores),
          ),
           // SECTION HEADER
          SliverToBoxAdapter(
            child: SectionHeader(
              title: 'Craze deals',
              showSeeAll: false,
              onSeeAllTap: () {},
            ),
          ),
          // CRAZY DEALS SECTION
          const SliverToBoxAdapter(
            child: HorizontalCrazeDeals(),
          ),
          // REFER TO EARN SECTION
          const SliverToBoxAdapter(
            child: ReferEarnBanner(),
          ),
           // SECTION HEADER
          SliverToBoxAdapter(
            child: SectionHeader(
              title: 'Nearby stores',
              showSeeAll: true,
              onSeeAllTap: () {},
            ),
          ),
          // NEARBY SECTION
          SliverToBoxAdapter(
            child: NearbyStoresSection(stores: state.nearbyStores),
          ),
          // ELEVATED BUTTON
          SliverToBoxAdapter(
  child: CustomElevatedButton(),
),

          const SliverToBoxAdapter(
            child: SizedBox(height: 80),
          ),
        ],
      ),
    );
              
              
            } else if (state is HomeError) {
              return error_widget.HomeError(
                message: state.message,
                onRetry: () {
                  context.read<HomeBloc>().add(LoadHomeDataEvent());
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
      // BOTTOM NAVIGATION BAR
      bottomNavigationBar: CustomBottomNav(),
    );
  }
}

