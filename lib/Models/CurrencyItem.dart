class CurrencyItem {
  int id;
  String name;
  String symbol;
  String slug;
  int num_market_pairs;
  String date_added;
  List<String> tags;
  dynamic max_supply;
  dynamic circulating_supply;
  dynamic total_supply;
  Object? platform;
  int cmc_rank;
  Object? self_reported_circulating_supply;
  Object? self_reported_market_cap;
  String last_updated;
  Quote quote;

  CurrencyItem.fromJsonMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"],
        symbol = map["symbol"],
        slug = map["slug"],
        num_market_pairs = map["num_market_pairs"],
        date_added = map["date_added"],
        tags = List<String>.from(map["tags"]),
        max_supply = map["max_supply"] ?? 0,
        circulating_supply = map["circulating_supply"],
        total_supply = map["total_supply"],
        platform = map["platform"] ?? "",
        cmc_rank = map["cmc_rank"] ?? "",
        self_reported_circulating_supply =
            map["self_reported_circulating_supply"] ?? "",
        self_reported_market_cap = map["self_reported_market_cap"] ?? "",
        last_updated = map["last_updated"] ?? "",
        quote = Quote.fromJsonMap(map["quote"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['symbol'] = symbol;
    data['slug'] = slug;
    data['num_market_pairs'] = num_market_pairs;
    data['date_added'] = date_added;
    data['tags'] = tags;
    data['max_supply'] = max_supply;
    data['circulating_supply'] = circulating_supply;
    data['total_supply'] = total_supply;
    data['platform'] = platform;
    data['cmc_rank'] = cmc_rank;
    data['self_reported_circulating_supply'] = self_reported_circulating_supply;
    data['self_reported_market_cap'] = self_reported_market_cap;
    data['last_updated'] = last_updated;
    data['quote'] = quote == null ? null : quote.toJson();
    return data;
  }
}

class Quote {
  RupeeData Inr;

  Quote.fromJsonMap(Map<String, dynamic> map)
      : Inr = RupeeData.fromJsonMap(map["INR"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['INR'] = Inr == null ? null : Inr.toJson();
    return data;
  }
}

class RupeeData {
  double price;
  double volume_24h;
  double volume_change_24h;
  double percent_change_1h;
  double percent_change_24h;
  double percent_change_7d;
  double percent_change_30d;
  double percent_change_60d;
  double percent_change_90d;
  double market_cap;
  double market_cap_dominance;
  double fully_diluted_market_cap;
  String last_updated;

  RupeeData.fromJsonMap(Map<String, dynamic> map)
      : price = map["price"].toDouble(),
        volume_24h = map["volume_24h"].toDouble(),
        volume_change_24h = map["volume_change_24h"].toDouble(),
        percent_change_1h = map["percent_change_1h"].toDouble(),
        percent_change_24h = map["percent_change_24h"].toDouble(),
        percent_change_7d = map["percent_change_7d"].toDouble(),
        percent_change_30d = map["percent_change_30d"].toDouble(),
        percent_change_60d = map["percent_change_60d"].toDouble(),
        percent_change_90d = map["percent_change_90d"].toDouble(),
        market_cap = map["market_cap"].toDouble(),
        market_cap_dominance = map["market_cap_dominance"].toDouble(),
        fully_diluted_market_cap = map["fully_diluted_market_cap"].toDouble(),
        last_updated = map["last_updated"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['volume_24h'] = volume_24h;
    data['volume_change_24h'] = volume_change_24h;
    data['percent_change_1h'] = percent_change_1h;
    data['percent_change_24h'] = percent_change_24h;
    data['percent_change_7d'] = percent_change_7d;
    data['percent_change_30d'] = percent_change_30d;
    data['percent_change_60d'] = percent_change_60d;
    data['percent_change_90d'] = percent_change_90d;
    data['market_cap'] = market_cap;
    data['market_cap_dominance'] = market_cap_dominance;
    data['fully_diluted_market_cap'] = fully_diluted_market_cap;
    data['last_updated'] = last_updated;
    return data;
  }
}
