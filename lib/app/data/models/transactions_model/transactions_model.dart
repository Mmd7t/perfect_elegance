import 'currency.dart';
import 'store.dart';
import 'transactions.dart';

class TransactionsModel {
  Transactions? transactions;
  List<Currency>? currencies;
  Store? store;

  TransactionsModel({this.transactions, this.currencies, this.store});

  factory TransactionsModel.fromJson(Map<String, dynamic> json) {
    return TransactionsModel(
      transactions: json['transactions'] == null
          ? null
          : Transactions.fromJson(json['transactions'] as Map<String, dynamic>),
      currencies: (json['currencies'] as List<dynamic>?)
          ?.map((e) => Currency.fromJson(e as Map<String, dynamic>))
          .toList(),
      store: json['store'] == null
          ? null
          : Store.fromJson(json['store'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'transactions': transactions?.toJson(),
        'currencies': currencies?.map((e) => e.toJson()).toList(),
        'store': store?.toJson(),
      };
}
