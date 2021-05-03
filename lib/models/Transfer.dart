class Transfer {
  final double transferValue;
  final int accountNumber;

  Transfer(this.transferValue, this.accountNumber);

  @override
  String toString() {
    return 'Transferência{valor: $transferValue, numero da conta: $accountNumber }';
  }
}
