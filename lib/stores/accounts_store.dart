import 'package:mobx/mobx.dart';
import 'package:coinspace/models/account_model.dart'; // Adjust the import path as needed

part 'accounts_store.g.dart';

class AccountsStore = _AccountsStore with _$AccountsStore;

abstract class _AccountsStore with Store {
  @observable
  ObservableList<Account> accounts = ObservableList<Account>();

  @action
  void addAccount(Account account) {
    accounts.add(account);
  }

  @action
  void removeAccount(String accountNumber) {
    accounts.removeWhere((account) => account.account_number == accountNumber);
  }

  @action
  void updateAccount(Account updatedAccount) {
    final index = accounts.indexWhere(
        (account) => account.account_number == updatedAccount.account_number);
    if (index != -1) {
      accounts[index] = updatedAccount;
    }
  }

  // Additional actions as needed, such as clearing all accounts or finding an account by number
}
