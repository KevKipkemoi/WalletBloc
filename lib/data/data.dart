
class AccountType {
  final String name;
  final int id;

  AccountType._(this.id, this.name);

  static final List<AccountType> all = [
    paymentAccount,
    credit,
    assets,
    liability
  ];

  static final AccountType paymentAccount = AccountType._(0, "Payment Account");
  static final AccountType credit = AccountType._(1, "Credit");
  static final AccountType assets = AccountType._(2, "Assets");
  static final AccountType liability = AccountType._(3, "Liability");
}

class TransactionType {
  final String name;
  final int id;

  TransactionType._(this.id, this.name);

  static final expenses = TransactionType._(0, "Expense");
  static final income = TransactionType._(1, "Income");
  static final moneyTransafer = TransactionType._(2, "Money Transfer");
  static final assetPurchase = TransactionType._(3, "Asset Purchase");
  static final assetSale = TransactionType._(4, "Asset Sale");
  static final liabilityAcquisition = TransactionType._(5, "Liability Acquisition");
  static final dischargeOfLiability = TransactionType._(6, "Discharge Of Liabiity");

  static final List<TransactionType> typeExpense = [
    expenses,
    assetPurchase,
    dischargeOfLiability
  ];

  static final List<TransactionType> typeIncome = [
    income,
    assetSale,
    liabilityAcquisition
  ];

  static final List<TransactionType> all = [
    expenses,
    income,
    moneyTransafer,
    assetSale,
    assetPurchase,
    liabilityAcquisition,
    dischargeOfLiability
  ];

  static final List<TransactionType> dailyTransaction = []
    ..addAll(typeExpense)
    ..addAll(typeIncome);

  static bool isExpense(TransactionType type) {
    return typeExpense.contains(type);
  }

  static bool isIncome(TransactionType type) {
    return typeIncome.contains(type);
  }
}

class CategoryType {
  final int id;
  final String name;

  CategoryType._(this.id, this.name);

  static final expense = CategoryType._(0, "Expense");
  static final income = CategoryType._(1, "Income");

  static List<CategoryType> all = [
    expense,
    income
  ];
}