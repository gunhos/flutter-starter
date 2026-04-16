import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/presentation/auth_provider.dart';
import '../data/profile_repository.dart';
import '../domain/user_profile.dart';

final profileRepositoryProvider =
    Provider<ProfileRepository>((_) => ProfileRepository());

final profileProvider = FutureProvider.autoDispose<UserProfile?>((ref) async {
  final user = ref.watch(authStateProvider).valueOrNull;
  if (user == null) return null;
  final repo = ref.watch(profileRepositoryProvider);
  await repo.seedFromFirebaseUser(user);
  return repo.getProfile(user.uid);
});

class EditProfileNotifier extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<void> save(UserProfile updated) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(profileRepositoryProvider).upsertProfile(updated);
      ref.invalidate(profileProvider);
    });
  }
}

final editProfileProvider =
    AsyncNotifierProvider<EditProfileNotifier, void>(EditProfileNotifier.new);
