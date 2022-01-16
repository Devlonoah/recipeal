import 'package:flutter/material.dart';
import 'package:recipeal/data/data_source/recipe_remote_data_source.dart';
import '../../constants/size.dart';
import '../discover/discover.dart';
import '../../spacing.dart';
import '../../theme/colors.dart';
import 'package:http/http.dart';

class Welcome extends StatelessWidget {
  static String id = 'Welcome';
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const WelcomeBody();
  }
}

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size.height;

    RecipeRemoteDataSourceImpl recipeDataSource =
        RecipeRemoteDataSourceImpl(client: Client());

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: kkPink,
              alignment: Alignment.center,
              child: Text(
                'Reciepal.',
                style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: mq * 0.3,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultHorizontalPadding),
                  child: ReusableButton(
                    label: 'Get Started',
                    color: kkPink,
                    onTap: () async {
                      try {
                        final result =
                            await recipeDataSource.getRecipeDetails(716429);

                        print(result);
                      } catch (e) {
                        print("error: $e  ");
                      }
                      // return _navigateToDiscover(context);
                    },
                  ),
                ),
                addVerticalSpace(35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
                          color: kkBlack, fontWeight: FontWeight.bold),
                    ),
                    addHorizontalSpace(10),
                    Builder(builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              // enableDrag: true,
                              builder: (context) {
                                return _AuthMethodsDialog();
                              });
                        },
                        child: Text(
                          'Sign in',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(
                                  color: kkPink, fontWeight: FontWeight.bold),
                        ),
                      );
                    })
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _navigateToDiscover(BuildContext context) =>
      Navigator.pushNamed(context, DiscoverPage.id);
}

class ReusableButton extends StatelessWidget {
  const ReusableButton({
    Key? key,
    required this.color,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  final Color color;
  final String label;

  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(
        backgroundColor: color,
        onSurface: kkSkyBlue,
        shadowColor: kkBlack,
      ),
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Text(
          label,
          style: Theme.of(context)
              .textTheme
              .button
              ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}

class _AuthMethodsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: kDefaultHorizontalPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          addVerticalSpace(25),
          Column(
            children: [
              Text(
                'Welcome back!',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: kkBlack, fontWeight: FontWeight.bold),
              ),
              Text(
                'Sign in to view your saved recipes',
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: kkBlack,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ],
          ),
          addVerticalSpace(20),
          ReusableButton(
            color: kkSkyBlue,
            label: 'Log in with Google',
            onTap: () {
              print('login in with Google');
            },
          ),
          addVerticalSpace(20),
          Row(
            children: [
              Expanded(
                child: Text(
                  'By signing up, you are agreeing to our User Agreement.',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption?.copyWith(
                        color: kkFadeGrey,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              )
            ],
          ),
          addVerticalSpace(25),
        ],
      ),
    );
  }
}
