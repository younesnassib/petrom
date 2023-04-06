class Product {
  late String title;
  late String description;
  late String image;
  late int categorie;

  Product(String Title, String Description, String Image, int Categorie) {
    this.title = Title;
    this.description = Description;
    this.image = Image;
    this.categorie = Categorie;
  }
}

class Lubrifiant extends Product {
  late String shortdesc;
  late String avantages;
  late String applications;

  Lubrifiant(String Title, String Image, String ShortDesc, String Description,
      String Avantages, String Application)
      : super(Title, Description, Image, 2) {
    this.shortdesc = ShortDesc;
    this.avantages = Avantages;
    this.applications = Application;
  }
}
