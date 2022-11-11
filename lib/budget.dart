class Budget {
  static List<Budget> listBudget = [];
  String judul;
  int nominal;
  String jenis;

  Budget({required this.judul, required this.nominal, required this.jenis});

  static void add({required judul, required nominal, required jenis}) {
    listBudget.add(Budget(judul: judul, nominal: nominal, jenis: jenis));
  }
}
