import '../models/category_model.dart';

List<CategoryModel> getCategory() {
  List<CategoryModel> array = <CategoryModel>[];
  CategoryModel type = new CategoryModel();

  //---1---
  type.categoryname = "General";
  type.imagename = "Assets/images/General.jpeg";
  array.add(type);

  //---2---
  type.categoryname = "Business";
  type.imagename = "Assets/images/Business.jpeg";
  array.add(type);

  //---3---
  type.categoryname = "Entertainment";
  type.imagename = "Assets/images/Entertainment.jpeg";
  array.add(type);

  //---4---
  type.categoryname = "Sports";
  type.imagename = "Assets/images/Sports.jpeg";
  array.add(type);

  //---5---
  type.categoryname = "Celebrity";
  type.imagename = "Assets/images/celebrity.jpeg";
  array.add(type);

  return array;
}
