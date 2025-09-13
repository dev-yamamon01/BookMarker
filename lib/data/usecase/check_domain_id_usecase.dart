import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bookmarker/view_models/providers/database_provider.dart';
import 'package:bookmarker/view_models/domain/domain_view_model.dart';
import '../services/database.dart';

final checkDomainIdUsecaseProvider = Provider<CheckDomainIdUsecase>((ref) {
  final db = ref.watch(databaseProvider);
  return CheckDomainIdUsecase(ref, db);
});


class CheckDomainIdUsecase {
  final Ref ref;
  final AppDatabase _db;

  CheckDomainIdUsecase(this.ref, this._db);

  Future<int> execute({required String domainName}) async {
    // ① domainName がすでに存在するか確認
    final domainId = await ref.read(domainViewModelProvider.notifier)
        .checkExistDomain(domainName)
        // ② 存在しない場合は新規挿入
        ?? await _db.into(_db.domains).insert(DomainsCompanion(
          domainName: Value(domainName),
        ));

    return domainId;
  }
}