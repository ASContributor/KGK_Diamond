import 'package:diamond_catalog/core/theme/app_theme.dart';
import 'package:diamond_catalog/logic/blocs/cart/cart_bloc.dart';
import 'package:diamond_catalog/logic/blocs/diamond/filter/diamond_filter_bloc.dart';
import 'package:diamond_catalog/logic/blocs/diamond/sort/diamond_sort_bloc.dart';
import 'package:diamond_catalog/logic/blocs/theme/theme_bloc.dart';
import 'package:diamond_catalog/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  HydratedBloc.storage = storage;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider<CartBloc>(
          create: (context) => CartBloc(),
        ),
        BlocProvider<DiamondFilterBloc>(
          create: (context) => DiamondFilterBloc(),
        ),
        BlocProvider<DiamondSortBloc>(
          create: (context) => DiamondSortBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Diamond Catalog',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeState.themeMode == ThemeModeData.light
                ? ThemeMode.light
                : ThemeMode.dark,
            onGenerateRoute: AppRoutes().onGenerateRoute,
            initialRoute: AppRoutes.filter,
          );
        },
      ),
    );
  }
}
