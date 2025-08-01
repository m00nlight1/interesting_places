import 'package:flutter/material.dart';
import 'package:interesting_places/assets/images/app_svg_icons.dart';
import 'package:interesting_places/features/onboarding/ui/screens/onboarding_wm.dart';
import 'package:interesting_places/uikit/buttons/main_button.dart';
import 'package:interesting_places/uikit/buttons/text_button_widget.dart';
import 'package:interesting_places/uikit/images/svg_picture_widget.dart';
import 'package:interesting_places/uikit/themes/colors/app_color_theme.dart';
import 'package:interesting_places/uikit/themes/text/app_text_theme.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatelessWidget {
  final IOnboardingWM wm;

  const OnboardingScreen({super.key, required this.wm});

  @override
  Widget build(BuildContext context) {
    final colorTheme = AppColorTheme.of(context);
    final textTheme = AppTextTheme.of(context);

    // todo: add strings
    final List<PageViewModel> pages = [
      PageViewModel(
        title: 'Добро пожаловать\nв Путеводитель',
        body: 'Ищи новые локации и сохраняй\nсамые любимые.',
        image: SvgPictureWidget(AppSvgIcons.onboardingPage1),
        decoration: _pageDecoration(textTheme, colorTheme),
      ),
      PageViewModel(
        title: "Построй маршрут\nи отправляйся в путь",
        body: "Достигай цели максимально\nбыстро и комфортно.",
        image: SvgPictureWidget(AppSvgIcons.onboardingPage2),
        decoration: _pageDecoration(textTheme, colorTheme),
      ),
      PageViewModel(
        title: "Добавляй места,\nкоторые нашёл сам",
        body: "Делись самыми интересными\nи помоги нам стать лучше!",
        image: SvgPictureWidget(AppSvgIcons.onboardingPage3),
        decoration: _pageDecoration(textTheme, colorTheme),
      ),
    ];

    return ValueListenableBuilder<int>(
      valueListenable: wm.currentPageIndex,
      builder: (context, index, _) {
        final isLastPage = index == pages.length - 1;
        return IntroductionScreen(
          pages: pages,
          onChange: wm.onPageChanged,
          showNextButton: false,
          showDoneButton: false,
          globalHeader:
              !isLastPage
                  ? Align(
                    alignment: Alignment.topRight,
                    child: SafeArea(
                      child: TextButtonWidget(
                        title: "Пропустить",
                        onPressed: () => wm.onSkipPressed(context),
                      ),
                    ),
                  )
                  : const SizedBox.shrink(),
          globalFooter:
              isLastPage
                  ? SafeArea(
                    top: false,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 24,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: MainButton(
                          onPressed: () => wm.onDonePressed(context),
                          child: Text('НА СТАРТ'),
                        ),
                      ),
                    ),
                  )
                  : const SizedBox.shrink(),
          controlsMargin: EdgeInsets.only(bottom: isLastPage ? 0 : 80),
          dotsDecorator: DotsDecorator(
            size: const Size(8.0, 8.0),
            activeSize: const Size(24.0, 8.0),
            activeColor: colorTheme.accent,
            color: colorTheme.inactive,
            spacing: const EdgeInsets.symmetric(horizontal: 4.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        );
      },
    );
  }

  PageDecoration _pageDecoration(
    AppTextTheme textTheme,
    AppColorTheme colorTheme,
  ) {
    return PageDecoration(
      titleTextStyle: textTheme.title,
      bodyTextStyle: textTheme.small.copyWith(
        color: colorTheme.secondaryVariant,
      ),
      contentMargin: const EdgeInsets.all(24),
      pageMargin: const EdgeInsets.only(top: 160, bottom: 60),
      bodyPadding: EdgeInsets.zero,
      imagePadding: const EdgeInsets.only(bottom: 24),
      titlePadding: const EdgeInsets.only(bottom: 6),
      imageAlignment: Alignment.bottomCenter,
    );
  }
}
