import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bookmarker/view_models/providers/database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:bookmarker/data/services/database.dart';
import 'package:drift/drift.dart';

part 'domain_view_model.g.dart';

@riverpod
Future<Domain> domainById(DomainByIdRef ref, int id) async {
  final viewModel = ref.read(domainViewModelProvider.notifier);
  return viewModel.getDomainById(domainId: id);
}

@riverpod
class DomainViewModel extends _$DomainViewModel {
  late final AppDatabase _db;

  @override
  Future<List<Domain>?> build() async {
    _db = ref.read(databaseProvider);
    return ref.watch(databaseProvider).select(_db.domains).get();//ドメインテーブルすべてのデータを状態監視
  }

  Future<Domain> getDomainById({required int domainId}) async {
    final _db=ref.watch(databaseProvider);
    final query = _db.select(_db.domains)..where((tbl) => tbl.id.equals(domainId));

    final result = await query.getSingle();
    return result;
  }

  //追加した後にそのidを取得する必要がある(他のテーブルに挿入するため)
  Future<int> addDomain(String inputDomainName) async {
    return await _db.into(_db.domains).insert(
        DomainsCompanion(domainName: Value(inputDomainName)));
  }

  //引数のドメイン名がすでにテーブルに存在するか確認
  Future<int?> checkExistDomain(String inputDomainName) async {
    final existingDomain = await (_db.select(_db.domains)
      ..where((d) => d.domainName.equals(inputDomainName ?? "")))
        .getSingleOrNull();

    if (existingDomain != null) {
      //  既存のドメインがある場合、そのIDを取得
      return existingDomain.id;
    } else {
      //  既存のドメインがない場合、0を返す
      return null;
    }
  }

  Future<String?> getAccessUrl(int domainId, String directory) async {
    final query = _db.select(_db.domains)
      ..where((tbl) => tbl.id.equals(domainId));
    final result = await query.getSingleOrNull();
    String? domainName = result?.domainName;

    return "https://$domainName/$directory";
  }

}