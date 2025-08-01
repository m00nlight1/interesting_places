import 'package:interesting_places/core/data/local_storage/preferences_service.dart';
import 'package:interesting_places/features/onboarding/ui/screens/onboarding_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

abstract class OnboardingDependencies {
  static List<SingleChildWidget> providers() {
    return [
      Provider<IOnboardingModel>(
        create:
            (context) => OnboardingModel(
              preferencesService: context.read<PreferencesService>(),
            ),
      ),
    ];
  }
}
