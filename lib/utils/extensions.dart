extension currencyConverter on double {
  // display in euros
  String displayPriceInEuros() {
    return this.toStringAsFixed(0) + " €";
  }

  // display in doilars
  String displayPriceInDollars() {
    return "\$" + this.toStringAsFixed(0);
  }
}
