
import 'package:flutter/material.dart';
import 'package:khabri/models/category_Model.dart';

List<CategoryModel> getCategories() {

  List<CategoryModel> category = <CategoryModel>[];
  CategoryModel  categorymodel = new CategoryModel();

  // 1
  categorymodel.categorName = "business";
  categorymodel.imageUrl = "https://images.unsplash.com/photo-1491336477066-31156b5e4f35?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";
  category.add(categorymodel);
  categorymodel = new CategoryModel();


  //2
  categorymodel.categorName = "Entertainment";
  categorymodel.imageUrl = "https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";
  category.add(categorymodel);
  categorymodel = new CategoryModel();

  //3
  categorymodel.categorName = "General";
  categorymodel.imageUrl = "https://images.unsplash.com/photo-1457369804613-52c61a468e7d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";
  category.add(categorymodel);
  categorymodel = new CategoryModel();

  //4
  categorymodel.categorName = "Health";
  categorymodel.imageUrl = "https://images.unsplash.com/photo-1506126613408-eca07ce68773?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=499&q=80";
  category.add(categorymodel);
  categorymodel = new CategoryModel();

  //5
  categorymodel.categorName = "Science";
  categorymodel.imageUrl = "https://images.unsplash.com/photo-1451187580459-43490279c0fa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=872&q=80";
  category.add(categorymodel);
  categorymodel = new CategoryModel();

  //5
  categorymodel.categorName = "Sports";
  categorymodel.imageUrl = "https://media.istockphoto.com/photos/various-sport-equipments-on-grass-picture-id949190736?s=612x612";
  category.add(categorymodel);
  categorymodel = new CategoryModel();

  //5
  categorymodel.categorName = "Technology";
  categorymodel.imageUrl = "https://images.unsplash.com/photo-1451187580459-43490279c0fa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=872&q=80";
  category.add(categorymodel);
  categorymodel = new CategoryModel();

  return category;

}