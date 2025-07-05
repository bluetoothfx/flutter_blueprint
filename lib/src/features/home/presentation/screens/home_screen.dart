import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blueprint/src/core/utils/context_extension.dart';
import 'package:flutter_blueprint/src/features/home/data/models/recipe.dart';
import 'package:flutter_blueprint/src/features/home/presentation/bloc/recipe_bloc.dart';
import 'package:flutter_blueprint/src/features/home/presentation/bloc/recipe_event.dart';
import 'package:flutter_blueprint/src/features/home/presentation/bloc/recipe_state.dart';
import 'package:flutter_blueprint/src/features/home/presentation/screens/design_sample_page.dart';
import 'package:flutter_blueprint/src/features/home/presentation/widgets/recipe_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //late AuthServiceBase authServiceHandler;
  //CompositeAnalyticsService analyticsService = inject();
  //RemoteConfigService remoteConfigService = inject();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.appColors.systemPrimary,
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text("Blueprint Template"),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => DesignSamplePage()));
            },
            child: Icon(
              Icons.account_tree
            ), //SvgPicture.asset(Assets.icons.icThemeChange, height: 32, width: 32,)
          ),
          InkWell(
            onTap: () async {
              // await authServiceHandler.logout().then((onValue) {
              //   ScaffoldMessenger.of(context).showSnackBar(
              //     const SnackBar(
              //       content: Text('Logged Out!'),
              //       backgroundColor: Colors.green,
              //     ),
              //   );
              //   Navigator.of(context).pushReplacement(MaterialPageRoute(
              //     builder: (_) => const SplashScreen(),
              //   ));
              // });
            },
            child: Text(
              '',
            ), //SvgPicture.asset(Assets.icons.icLogout, height: 32, width: 32,)
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: BlocBuilder<RecipeBloc, RecipeState>(
        bloc: context.read<RecipeBloc>()..add(const RecipeStartEvent()),
        builder: (context, state) {
          if (state is RecipeInProgress || state is RecipeInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RecipeResult) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: state.recipeBaseResponse?.recipe?.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                Recipe? recipe = state.recipeBaseResponse!.recipe?[index];
                return RecipeItem(
                  recipe: recipe,
                  onItemClick: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (_) => DesignSamplePage(),
                    // ));
                  },
                );
              },
            );
          } else if (state is RecipeError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text("Something Went Wrong"));
          }
        },
      ),
    );
  }
}
