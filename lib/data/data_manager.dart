import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wallet_bloc/data/data_observer.dart';
import 'package:wallet_bloc/data/data_observer.dart';

// database manager
final _id = "_id";
final _updated = "_updated";

// table Account
final _tableAccounts = tableAccount;
final _accName = "_name";
final _accInitialBalance = "_initialBalance";
final _accCreated = "_created";
final _accType = "_type";
final _accCurrency = "_currency";
final _accBalance = "_balance";
final _accSpent = "_spent";
final _accEarned = "_earned";

// table Transaction
final _tableTransactions = tableTransactions;
final _transDateTime = "_dateTime";
final _transAcc = "_accountId";
final _transCategory = "_categoryId";
final _transAmount = "_amount";
final _transDesc = "_transactionDescription";
final _transType = "_transactionType";
final _transUid = "_transactionUserUid";

// table Category
final _tableCategory = tableCategory;
final _catName = "_name";
final _catColorHex = "_colorHex";
final _catCategoryType = "_type";

// table Budget
final _tableBudget = tableBudget;
final _budgetCategoryId = "_catId";
final _budgetPerMonth = "_budgetPerMonth";
final _budgetStart = "_budgetStart";
final _budgetEnd = "_budgetEnd";

// table User
final _tableUser = tableUser;
final _userDisplayName = "_displayName";
final _userEmail = "_email";
final _userPhotoUrl = "_photoUrl";
final _userColor = "_userColor";
final _userVerified = "_userVerified";

// table MoneyTransfer
final _tableTransfer = tableTransfer;
final _transferFrom = "_transferFrom";
final _transferTo = "_transferTo";
final _transferAmount = "_transferAmount";
final _transferDate = "_transferDate";
final _transferUuid = "_uuid";

// table DischargeLiability
final _tableDischargeLiability = tableDischargeLiability;
final _dischargeDateTime = "_dateTime";
final _dischargeFromAcc = "_accountId";
final _dischargeLiabilityId = "_liabilityId";
final _dischargeCategory = "_categoryId";
final _dischargeAmount = "_amount";
final _dischargeUserId = "_dischargeUserUid";

_Database db = _Database();

Map<String, String> _tableMap = {
  "Account": _tableAccounts,
  "Transaction": _tableTransactions,
  "Category": _tableCategory,
  "User": _tableUser,
  "Budget": _tableBudget,
  "Transfer": _tableTransfer
};

void registerDatabaseObservable(List<String> tables, DatabaseObservable observable) {
  db.registerDatabaseObservable(tables, observable);
}

void unregisterDatabaseObservable(List<String> tables, DatabaseObservable observable) {
  db.unregisterDatabaseObservable(tables, observable);
}

Future<void> init() {
  return db.init();
}

Future<void> resume() {
  return init();
}

Future<void> dispose() {
  return db.dispose();
}

// private data helper
class _Database {
  Database db;
  Map<String, List<DatabaseObservable>> _watchers = {};
  _PrivateDbHelper _privateDbHelper = _PrivateDbHelper();

  Future<Database> _openDatabase() async {
    String dbPath = join((await getApplicationDocumentsDirectory()).path, "MyWalletDb");

    return await openDatabase(
      dbPath,
      version: 11,
      onCreate: (Database db, int version) async {
        await _privateDbHelper._executeCreateDatabase(db);
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        // Delete all tables and create anew
        var allTables = [
          _tableAccounts,
          _tableTransactions,
          _tableCategory,
          _tableBudget,
          _tableUser,
          _tableTransfer,
          _tableDischargeLiability
        ];

        for (String tbl in allTables) {
          try {
            await db.execute("DROP TABLE $tbl");
          } catch(e, stacktrace) {
            debugPrint(stacktrace.toString());
          }
        }

        await _privateDbHelper._executeCreateDatabase(db);
      }
    );
  }
}
