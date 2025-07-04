import 'package:flutter/material.dart';
import 'package:flutter_blueprint/src/core/config/routes/route_manager.dart';
import 'package:flutter_blueprint/src/core/config/routes/routes.dart';
import 'package:flutter_blueprint/src/core/themes/app_theme.dart';

class MaterialConfiguration extends StatefulWidget {
  final ThemeMode themeMode;

  const MaterialConfiguration({super.key, required this.themeMode});

  @override
  State<MaterialConfiguration> createState() => _MaterialConfigurationState();
}

class _MaterialConfigurationState extends State<MaterialConfiguration> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: widget.themeMode,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      onGenerateRoute: RouteManager.generateRoute,
      initialRoute: Routes.home,
    );
  }
}
