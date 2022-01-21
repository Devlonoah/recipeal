import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../global_widget/reusable_button.dart';
import '../bloc/authentication/authentication_cubit.dart';
import '../tab_manager/tab_manager.dart';
import '../../utils/dialogs.dart';
import '../../constants/size.dart';
import '../../spacing.dart';
import '../../theme/colors.dart';

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
                      //TODO: resolve back to navigate function

                      _navigateToDiscover(context);
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
      Navigator.pushNamed(context, TabManager.id);
}

class _AuthMethodsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) async {
        if (state is AuthenticationFailure) {
          showFailedAuthDialog(context);
        }
        if (state is AuthenticationSuccessful) {
          Navigator.pushNamedAndRemoveUntil(
              context, TabManager.id, (route) => false);
        }
      },
      child: Padding(
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
                BlocProvider.of<AuthenticationCubit>(context)
                    .signInWithGoogle();
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
      ),
    );
  }
}
