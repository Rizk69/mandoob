class CompanyProductsModel {
  bool status;
  String message;
  List<ProductsCompanyModel> products;

  CompanyProductsModel({
    required this.status,
    required  this.message,
    required  this.products});



}

class ProductsCompanyModel {
  int id;
  String img;
  String nameAr;
  String nameEn;
  UnitModel? unit;
  UnitModel? unitCategory;
  UnitModel? unitSubCategory;

  ProductsCompanyModel({
    required   this.id,
    required    this.img,
    required  this.nameAr,
    required this.nameEn,
    required   this.unit,
    required  this.unitCategory,
    required  this.unitSubCategory});



}
class UnitModel {
  int id;
  String nameAr;
  String nameEn;
  String count;
  int type;

  UnitModel({
    required  this.id,
    required   this.nameAr,
    required  this.nameEn,
    required  this.type,
    required  this.count});



}