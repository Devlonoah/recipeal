import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:recipeal/constants/size.dart';
import 'package:recipeal/global_widget/reusable_button.dart';
import 'package:recipeal/presentation/bloc/authentication/authentication_cubit.dart';
import 'package:recipeal/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:recipeal/presentation/bloc/user/user_cubit.dart';
import 'package:recipeal/presentation/recipe_info/recipe_info.dart';
import 'package:recipeal/presentation/welcome/welcome.dart';
import 'package:recipeal/spacing.dart';
import 'package:recipeal/theme/colors.dart';
import 'package:recipeal/theme/dialogs.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) async {
        if (state is AuthenticationFailure) {
          await showFailedAuthDialog(context);
        }
      },
      child: MultiBlocListener(listeners: [
        BlocListener<AuthenticationCubit, AuthenticationState>(
            listener: (context, state) {
          if (state is AuthenticationSuccessful) {
            context.read<UserCubit>().getUser();
          }

          if (state is AuthenticationLoggedOut) {
            Navigator.pushNamedAndRemoveUntil(
                context, Welcome.id, (route) => false);
          }
        })
      ], child: const ProfileBody()),
    );
  }
}

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      if (state is UserLoaded) {
        return buildUserSignedIn(state);
      }

      return buildNotSignedInWidget(context);
    });
  }

  Widget buildUserSignedIn(UserLoaded state) {
    return Column(
      children: [
        AppBar(
          actions: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Icon(
                Icons.settings_outlined,
                color: kkPink,
                size: 30,
              ),
            ),
          ],
        ),
        Expanded(
          child: MainView(),
        )
      ],
    );
  }
}

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    addVerticalSpace(20),
                    Center(
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage:
                            CachedNetworkImageProvider(state.user.photoURL!),
                      ),
                    ),
                    addVerticalSpace(20),
                    Center(
                        child: Text(state.user.displayName!,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                    fontWeight: FontWeight.bold, height: 1.2))),
                    addVerticalSpace(20),
                    const FavoriteSection(),
                    addVerticalSpace(15),
                  ],
                ),
              ),
              ReusableButton(
                  color: kkBlack,
                  label: 'Logout',
                  onTap: () {
                    // BlocProvider.of<AuthenticationCubit>(context).signOut();

                    BlocProvider.of<UserCubit>(context).clearUser();
                  }),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

class FavoriteSection extends StatelessWidget {
  const FavoriteSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FavoriteWidget();
  }
}

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:
          BlocBuilder<FavoriteBloc, FavoriteState>(builder: (context, state) {
        if (state.recipes.isEmpty) {
          return SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultHorizontalPadding),
              child: Text('Favourite Recipe',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold, height: 1.2)),
            ),
            addVerticalSpace(10),
            GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultHorizontalPadding),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 20),
                itemCount: state.recipes.length,
                itemBuilder: (context, index) {
                  final _favoriteRecipe = state.recipes[index];

                  return GestureDetector(
                    onTap: () => _navigateToRecipeInfo(context),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: CachedNetworkImage(
                              imageUrl: _favoriteRecipe.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          addVerticalSpace(5),
                          Text(
                              _favoriteRecipe.title +
                                  "diu skdjfhs sdjkfhsdk dfjkk skdjskd sdjk",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      height: 1.2)),
                        ]),
                  );
                }),
          ],
        );
      }),
    );
  }

  void _navigateToRecipeInfo(BuildContext context) {
    Navigator.pushNamed(context, RecipeInfo.id);
  }
}

Widget buildNotSignedInWidget(BuildContext context) {
  return SafeArea(
    child: Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: kDefaultHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Icon(
                Icons.settings_outlined,
                color: kkPink,
                size: 30,
              ),
            ),
          ),
          // Spacer(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "😍",
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                // addVerticalSpace(30),
                Text(
                  'Log in or create an account to save your favourite recipes',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),

          ReusableButton(
              color: kkSkyBlue,
              label: 'Log in with Google',
              onTap: () {
                BlocProvider.of<AuthenticationCubit>(context)
                    .signInWithGoogle();
              }),
        ],
      ),
    ),
  );
}
