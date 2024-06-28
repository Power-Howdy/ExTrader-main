// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AccountsStore on _AccountsStore, Store {
  late final _$accountsAtom =
      Atom(name: '_AccountsStore.accounts', context: context);

  @override
  ObservableList<Account> get accounts {
    _$accountsAtom.reportRead();
    return super.accounts;
  }

  @override
  set accounts(ObservableList<Account> value) {
    _$accountsAtom.reportWrite(value, super.accounts, () {
      super.accounts = value;
    });
  }

  late final _$_AccountsStoreActionController =
      ActionController(name: '_AccountsStore', context: context);

  @override
  void addAccount(Account account) {
    final _$actionInfo = _$_AccountsStoreActionController.startAction(
        name: '_AccountsStore.addAccount');
    try {
      return super.addAccount(account);
    } finally {
      _$_AccountsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeAccount(String accountNumber) {
    final _$actionInfo = _$_AccountsStoreActionController.startAction(
        name: '_AccountsStore.removeAccount');
    try {
      return super.removeAccount(accountNumber);
    } finally {
      _$_AccountsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateAccount(Account updatedAccount) {
    final _$actionInfo = _$_AccountsStoreActionController.startAction(
        name: '_AccountsStore.updateAccount');
    try {
      return super.updateAccount(updatedAccount);
    } finally {
      _$_AccountsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
accounts: ${accounts}
    ''';
  }
}


