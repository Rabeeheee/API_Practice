// Option 1: Using import prefix
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/core/routes/app_router.dart';
import 'package:grocery_app/features/home/presentation/bloc/home_bloc.dart';
// Import with prefix to resolve naming conflicts
import 'package:grocery_app/features/home/presentation/widgets/home_content.dart';
import 'package:grocery_app/features/home/presentation/widgets/home_error.dart' as error_widget;
import 'package:grocery_app/features/home/presentation/widgets/home_loading.dart' as loading_widget;
import 'package:grocery_app/features/notifications/presentation/bloc/notifications_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              // Use the prefixed widget
              return const loading_widget.HomeLoading();
            } else if (state is HomeLoaded) {
              return HomeContent(
                state: state,
                onRefresh: () async {
                  context.read<HomeBloc>().add(RefreshHomeDataEvent());
                },
                onNotificationTap: () {
                  context.read<NotificationsBloc>().add(
                        FetchNotificationsEvent(),
                      );
                  Navigator.pushNamed(
                    context,
                    AppRouter.notificationsRoute,
                  );
                },
              );
            } else if (state is HomeError) {
              // Use the prefixed widget
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Iconify(Mdi.store),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Iconify(Mdi.cart),
            label: 'My order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}