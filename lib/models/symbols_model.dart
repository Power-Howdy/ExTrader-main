
class Symbol {
  String symbol;
  double bid;
  double ask;
  double high;
  double low;
  String timestmp;
  bool ishigh = true;

  Symbol(this.symbol, this.bid, this.ask, this.high, this.low,
      this.timestmp, this.ishigh);
}
