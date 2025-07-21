// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prompts_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$generativeModelHash() => r'c2bed2cd6a563270e76aee4993ac79594d7c69dc';

/// See also [generativeModel].
@ProviderFor(generativeModel)
final generativeModelProvider = Provider<GenerativeModel>.internal(
  generativeModel,
  name: r'generativeModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$generativeModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GenerativeModelRef = ProviderRef<GenerativeModel>;
String _$promptsRemoteDataSourceHash() =>
    r'f5cd70c8e8e712683f341537ece6da5f3d012d37';

/// See also [promptsRemoteDataSource].
@ProviderFor(promptsRemoteDataSource)
final promptsRemoteDataSourceProvider =
    Provider<PromptsRemoteDataSource>.internal(
  promptsRemoteDataSource,
  name: r'promptsRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$promptsRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PromptsRemoteDataSourceRef = ProviderRef<PromptsRemoteDataSource>;
String _$promptsRepositoryHash() => r'7be8fd7e30ece7aa35585bc57279a009d2e0be58';

/// See also [promptsRepository].
@ProviderFor(promptsRepository)
final promptsRepositoryProvider = Provider<PromptsRepository>.internal(
  promptsRepository,
  name: r'promptsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$promptsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PromptsRepositoryRef = ProviderRef<PromptsRepository>;
String _$makePromptUseCaseHash() => r'6b68d4201b5e61105ce43c8530ecda355b7cf002';

/// See also [makePromptUseCase].
@ProviderFor(makePromptUseCase)
final makePromptUseCaseProvider = Provider<MakePromptUseCase>.internal(
  makePromptUseCase,
  name: r'makePromptUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$makePromptUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MakePromptUseCaseRef = ProviderRef<MakePromptUseCase>;
String _$promptsNotifierHash() => r'604e7469e944d1f1c9b6dcce7ce46ac1068221d6';

/// See also [PromptsNotifier].
@ProviderFor(PromptsNotifier)
final promptsNotifierProvider = AutoDisposeNotifierProvider<PromptsNotifier,
    AsyncValue<PromptResponse?>>.internal(
  PromptsNotifier.new,
  name: r'promptsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$promptsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PromptsNotifier = AutoDisposeNotifier<AsyncValue<PromptResponse?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
