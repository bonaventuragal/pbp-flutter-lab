class Budget {
  static List<Budget> listBudget = [];
  String judul;
  int nominal;
  String jenis;
  DateTime date;

  Budget({
    required this.judul,
    required this.nominal,
    required this.jenis,
    required this.date,
  });

  static void add({
    required judul,
    required nominal,
    required jenis,
    required date,
  }) {
    listBudget.add(Budget(
      judul: judul,
      nominal: nominal,
      jenis: jenis,
      date: date,
    ));
  }
}
