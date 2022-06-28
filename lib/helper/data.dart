import '../models/category_model.dart';

List<CategoryModel> getCategory() {
  List<CategoryModel> array = <CategoryModel>[];
  CategoryModel type = new CategoryModel();

  //---1---
  type.categoryname = "General";
  type.imagename = "Assets/images/General.jpeg";
  array.add(type);
  type = new CategoryModel();

  //---2---
  type.categoryname = "Business";
  type.imagename = "Assets/images/Business.jpeg";
  array.add(type);
  type = new CategoryModel();

  //---3---
  type.categoryname = "Entertainment";
  type.imagename = "Assets/images/Entertainment.jpeg";
  array.add(type);
  type = new CategoryModel();

  //---4---
  type.categoryname = "Sports";
  type.imagename = "Assets/images/Sports.jpeg";
  array.add(type);
  type = new CategoryModel();

  //---5---
  type.categoryname = "Technology";
  type.imagename = "Assets/images/tech.jpeg";
  array.add(type);
  type = new CategoryModel();

  //---6---
  type.categoryname = "Health";
  type.imagename = "Assets/images/Health.jpeg";
  array.add(type);
  type = new CategoryModel();

  //---7---
  type.categoryname = "Science";
  type.imagename = "Assets/images/science.jpeg";
  array.add(type);
  type = new CategoryModel();

  return array;
}
