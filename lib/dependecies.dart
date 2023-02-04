import 'package:delivary_bloc_clean/data/datasource/api_repository_impl.dart';
import 'package:delivary_bloc_clean/data/datasource/local_repository_impl.dart';
import 'package:delivary_bloc_clean/data/datasource/shopping_repository_impl.dart';
import 'package:delivary_bloc_clean/domain/repository/api_repository.dart';
import 'package:delivary_bloc_clean/domain/repository/local_storage_repository.dart';
import 'package:delivary_bloc_clean/domain/repository/shopping_repository.dart';
import 'package:delivary_bloc_clean/domain/usecase/login_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<RepositoryProvider> buildRepositories() {
  return [
    RepositoryProvider<ApiRepositoryInterface>(
        create: (_) => ApiRepositoryImpl()),
    RepositoryProvider<LocalRepositoryInterface>(
        create: (_) => LocalRepositoryImpl()),
    RepositoryProvider<ShoppingRepositoryInterface>(
        create: (_) => ShoppingRepositoryImpl()),
    RepositoryProvider<LoginUseCase>(
      create: (context) => LoginUseCase(context.read(), context.read()),
    ),
  ];
}
