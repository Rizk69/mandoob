import 'package:mandoob/app/constants.dart';

import '../../domain/model/company_products_model.dart';
import '../responses/company_products_response.dart';

extension CompanyProductsResponseMapper on CompanyProductsResponse? {
  CompanyProductsModel toDomain() {
    return CompanyProductsModel(
      status: this?.status ?? false,
      message: this?.message ?? Constants.empty,
      products: (this?.products ?? []).map((product) {
        return product.toDomain();
      }).toList(),
    );
  }
}

extension ProductsCompanyResponseMapper on ProductsCompanyResponse? {
  ProductsCompanyModel toDomain() {
    return ProductsCompanyModel(
      id: this?.id ?? Constants.zero,
      nameEn: this?.nameEn ?? Constants.empty,
      nameAr: this?.nameAr ?? Constants.empty,
      img: this?.img ?? Constants.empty,
      unit: this?.unit?.toDomain() ??
          Unit(nameAr: '', nameEn: '', id: 0, count: ''),
      unitCategory: this?.unitCategory?.toDomain() ??
          UnitCategory(count: '', id: 0, nameEn: '', nameAr: ''),
      unitSubCategory: this?.unitSubCategory?.toDomain() ??
          UnitSubCategory(nameAr: '', nameEn: '', id: 0, count: ''),
    );
  }
}

extension UnitResponseMapper on UnitResponse? {
  Unit toDomain() {
    return Unit(
      id: this?.id ?? Constants.zero,
      nameAr: this?.nameAr ?? Constants.empty,
      nameEn: this?.nameEn ?? Constants.empty,
      count: this?.count ?? Constants.empty,
    );
  }
}

extension UnitCategoryResponseMapper on UnitCategoryResponse {
  UnitCategory toDomain() {
    return UnitCategory(
      id: this.id ?? Constants.zero,
      nameAr: this.nameAr ?? "",
      nameEn: this.nameEn ?? "",
      count: this.count ?? "",
    );
  }
}

extension UnitSubCategoryResponseMapper on UnitSubCategoryResponse {
  UnitSubCategory toDomain() {
    return UnitSubCategory(
      id: this.id ?? Constants.zero,
      nameAr: this.nameAr ?? "",
      nameEn: this.nameEn ?? "",
      count: this.count ?? "",
    );
  }
}
