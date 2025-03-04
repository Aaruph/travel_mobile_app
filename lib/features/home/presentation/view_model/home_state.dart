import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_mobile_app/features/home/presentation/view/bottom_view/account_view.dart';
import 'package:travel_mobile_app/features/home/presentation/view/bottom_view/inbox_view.dart';
import 'package:travel_mobile_app/features/home/presentation/view/bottom_view/wishlist_view.dart';

import '../../../../app/di/di.dart';
import '../view/bottom_view/dashboard_view.dart';
import 'home_cubit.dart';

class HomeState extends Equatable {
  final int selectedIndex;
  final List<Widget> views;

  const HomeState({
    required this.selectedIndex,
    required this.views,
  });

  // Initial state
  static HomeState initial() {
    return HomeState(
      selectedIndex: 0,
      views: [
        BlocProvider(
          create: (context) => getIt<HomeCubit>(),
          child: DashboardView(),
        ),
        BlocProvider(
          create: (context) => getIt<HomeCubit>(),
          child: WishlistView(),
        ),
        // const Center(
        //   child: Text('inbox'),
        // ),
        BlocProvider(
          create: (context) => getIt<HomeCubit>(),
          child: InboxView(),
        ),
        BlocProvider(
          create: (context) => getIt<HomeCubit>(),
          child: ProfileView(), // ✅ Replacing placeholder with ProfileView
        ),
      ],
    );
  }

  HomeState copyWith({
    int? selectedIndex,
    List<Widget>? views,
  }) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      views: views ?? this.views,
    );
  }

  @override
  List<Object?> get props => [selectedIndex, views];
}
