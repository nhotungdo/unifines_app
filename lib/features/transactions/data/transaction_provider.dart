import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../../../core/network/api_client.dart';
import '../domain/transaction_model.dart';

final transactionProvider =
    AsyncNotifierProvider<TransactionNotifier, List<TransactionModel>>(
      TransactionNotifier.new,
    );

class TransactionNotifier extends AsyncNotifier<List<TransactionModel>> {
  @override
  Future<List<TransactionModel>> build() async {
    return _fetchTransactions();
  }

  Future<List<TransactionModel>> _fetchTransactions() async {
    try {
      final dio = ref.read(dioProvider);

      // Simulate API call for now to keep UI working without a real backend
      await Future.delayed(const Duration(seconds: 1));

      // Mock data
      return [
        TransactionModel(
          id: '1',
          title: 'Ăn trưa cơm tấm',
          amount: 45000,
          date: DateTime.now().subtract(const Duration(hours: 2)),
          type: TransactionType.expense,
          category: 'Ăn uống',
        ),
        TransactionModel(
          id: '2',
          title: 'Lương tháng 6',
          amount: 15000000,
          date: DateTime.now().subtract(const Duration(days: 1)),
          type: TransactionType.income,
          category: 'Lương',
        ),
        TransactionModel(
          id: '3',
          title: 'Mua sắm Shopee',
          amount: 350000,
          date: DateTime.now().subtract(const Duration(days: 2)),
          type: TransactionType.expense,
          category: 'Mua sắm',
        ),
      ];

      /* Actual Implementation:
      final response = await dio.get('/transactions');
      final data = response.data['data'] as List;
      return data.map((json) => TransactionModel.fromJson(json)).toList();
      */
    } catch (e, st) {
      // Log error
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  Future<void> addTransaction(TransactionModel newTx) async {
    state = const AsyncValue.loading();
    try {
      // Simulate API Post
      await Future.delayed(const Duration(seconds: 1));

      // Reload state by combining old list with new item
      final currentList =
          await _fetchTransactions(); // In a real app, refetch or insert locally
      state = AsyncValue.data([newTx, ...currentList]);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
