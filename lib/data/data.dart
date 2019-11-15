
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