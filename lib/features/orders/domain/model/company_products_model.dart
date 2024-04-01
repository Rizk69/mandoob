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
  Unit unit;
  UnitCategory unitCategory;
  UnitSubCategory unitSubCategory;

  ProductsCompanyModel({
    required   this.id,
    required    this.img,
    required  this.nameAr,
    required this.nameEn,
    required   this.unit,
    required  this.unitCategory,
    required  this.unitSubCategory});



}

class UnitSubCategory {
  int id;
  String nameAr;
  String nameEn;
  String count;

  UnitSubCategory({
    required   this.id,
    required   this.nameAr,
    required   this.nameEn,
    required  this.count});



}

class UnitCategory {
  int id;
  String nameAr;
  String nameEn;
  String count;

  UnitCategory({
    required   this.id,
    required  this.nameAr,
    required  this.nameEn,
    required  this.count});



}

class Unit {
  int id;
  String nameAr;
  String nameEn;
  String count;

  Unit({
    required  this.id,
    required   this.nameAr,
    required  this.nameEn,
    required  this.count});



}