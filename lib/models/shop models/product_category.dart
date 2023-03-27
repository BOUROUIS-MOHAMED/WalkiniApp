import 'package:flutter/material.dart' show IconData;
import 'package:start_up_project/models/shop%20models/product.dart';

class ProductCategory {
  ProductType type;
  bool isSelected;
  IconData icon;

  ProductCategory(this.type, this.isSelected, this.icon);
}
