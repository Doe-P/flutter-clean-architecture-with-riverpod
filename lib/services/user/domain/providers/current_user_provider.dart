import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_store_app/services/user/domain/providers/user_provider.dart';
import 'package:product_store_app/shared/domain/models/model.dart';

final currentUserProvider = FutureProvider<User?>((ref) async {
 final userRepository = ref.watch(userCacheRepositoryProvider);
 final eitherType = (await userRepository.getUser());
 return eitherType.fold((failure) => null, (user) => user);
});