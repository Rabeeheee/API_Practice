// Option 1: Using import prefix
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/core/routes/app_router.dart';
import 'package:grocery_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:grocery_app/features/home/presentation/widgets/custom_bottom_nav.dart';
import 'package:grocery_app/features/home/presentation/widgets/home_content.dart';
import 'package:grocery_app/features/home/presentation/widgets/home_error.dart' as error_widget;
import 'package:grocery_app/features/home/presentation/widgets/home_loading.dart' as loading_widget;
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
              //HOME CONTENT
              return HomeContent(
                state: state,
                onRefresh: () async {
                  context.read<HomeBloc>().add(RefreshHomeDataEvent());
                },
                onNotificationTap: () {
                      context.read<NotificationsBloc>().add(GetNotificationsEvent());
                 Navigator.pushNamed(context, AppRouter.notificationsRoute);
                },
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
      bottomNavigationBar: CustomBottomNav(),
    );
  }
}

