import 'package:flutter/foundation.dart';

class routes {
  static const AddTransaction = "AddTransaction";
  static const TransactionListAccount = "TransactionListAccount";
  static const TransactionListCategory = "TransactionListCategory";
  static const TransactionListDate = "TransactionListDate";

  static const SelectCategory = "SelectCategory";
  static const ListCategory = "ListCategory";
  static const CreateCategory = "CreateCategory";

  static const SelectAccount = "SelectAccount";
  static const ListAccounts = "ListAccounts";
  static const Accounts = "_AccountDetail";
  static const AddAccount = "AddAccount";
  static const TransferAccount = "TransferAccount";

  static const UserProfile = "UserProfile";
  static const AboutUs = "AboutUs";
  static const SplashView = "SplashView";

  static const ListBudgets = "ListBudgets";
  static const AddBudget = "AddBudget";
  static const Liability = "Liability";
  static const Pay = "Pay";

  static const Login = "Login";
  static const RequestValidation = "RequestValidation";
  static const ValidationProcessing = "ValidationProcessing";
  static const HomeProfile = "HomeProfile";
  static const MyHome = "MyHome";
  static const Register = "Register";

  static String AddTransactionWithParam(int transactionId, int accountId, int categoryId) {
    return "$AddTransaction/$transactionId/$accountId/$categoryId";
  }

  static String TransactionList(String title, {int accountId, int categoryId, DateTime datetime}) {
    if (accountId != null) return "$TransactionListAccount/$accountId/$title";
    if (categoryId != null) return "$TransactionListCategory/$categoryId/$title";
    if (datetime != null) return "$TransactionListDate/${datetime.millisecondsSinceEpoch}:$title";

    return "Unknown";
  }

  static String EditBudget({@required int categoryId, @required DateTime month}) {
    return "$AddBudget/$categoryId:${month.millisecondsSinceEpoch}";
  }

  static String AccountDetail({@required int accountId, @required String accountName}) {
    return "$Accounts/$accountId/$accountName";
  }

  static String TransferToAccount({@required int accountId, @required String accountName}) {
    return "$TransferAccount/from:$accountId/name:$accountName";
  }

  static String LiabilityDetail({@required int accountId, @required String accountName}) {
    return "$Liability/from:$accountId/name:$accountName";
  }

  static String PayLiability({@required int accountId, @required String accountName}) {
    return "$Pay/from:$accountId/name:$accountName";
  }

  static String EditCategory({@required int accuntId, @required String categoryName}) {
    return "$CreateCategory/id:$accuntId/name:$categoryName";
  }
}