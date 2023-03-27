import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:start_up_project/utils/extensions.dart';

import '../../controllers/shop controllers/product_controller.dart';
import '../../models/shop models/product.dart';
import '../../utils/animations/animated_switcher_wrapper.dart';
import '../../utils/colors.dart';
import '../../widgets/shop widgets/empty_cart.dart';

final ProductController controller = Get.put(ProductController());

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.white,
      shadowColor: Colors.white,
      leading: Icon(Icons.chevron_left,color: Colors.black,),
      elevation: 2,
      centerTitle: true,
      title: Text(
        "My Cart",
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Colors.black
        ),
      ),
    );
  }

  Widget cartList() {
    return SingleChildScrollView(
      child: Column(
        children: controller.cartProducts.mapWithIndex((index, _) {
          Product product = controller.cartProducts[index];
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey[400]?.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Wrap(
              runAlignment: WrapAlignment.spaceBetween,
              spacing: 10,
              runSpacing: 10,

              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.spaceEvenly,
              children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Container(
                     padding: const EdgeInsets.all(5),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       color: ColorExtension.randomColor,
                     ),
                     child: ClipRRect(
                       borderRadius: const BorderRadius.all(Radius.circular(10)),
                       child: ClipRRect(
                         borderRadius: BorderRadius.circular(10),
                         child: Padding(
                           padding: const EdgeInsets.all(5),
                           child: Image.asset(
                             product.images[0],
                             width: 0.1.sh,
                             height: 0.1.sh,
                           ),
                         ),
                       ),
                     ),
                   ),
                   SizedBox(width: 0.06.sw,),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                         product.name.nextLine,
                         maxLines: 2,
                         overflow: TextOverflow.ellipsis,
                         style: const TextStyle(
                           fontWeight: FontWeight.w600,
                           fontSize: 15,
                         ),
                       ),

                       Text(
                         controller.getCurrentSize(product),
                         style: TextStyle(
                           color: Colors.black.withOpacity(0.5),
                           fontWeight: FontWeight.w400,
                         ),
                       ),
                       const SizedBox(height: 5),
                       Text(
                         controller.isPriceOff(product)
                             ? "\$${product.off}"
                             : "\$${product.price}",
                         style:  TextStyle(
                           fontWeight: FontWeight.w900,
                           fontSize: 0.02.sh,
                         ),
                       ),
                     ],
                   ),
                 ],
               ),
                Align(
                  alignment:Alignment(1, 0) ,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          splashRadius: 10.0,
                          onPressed: () =>
                              controller.decreaseItemQuantity(product),
                          icon: const Icon(
                            Icons.remove,
                            color: Color(0xFFEC6813),
                          ),
                        ),
                        GetBuilder<ProductController>(
                          builder: (ProductController controller) {
                            return AnimatedSwitcherWrapper(
                              child: Text(
                                '${controller.cartProducts[index].quantity}',
                                key: ValueKey<int>(
                                  controller.cartProducts[index].quantity,
                                ),
                                style:  TextStyle(
                                  fontSize: 0.02.sh,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          splashRadius: 10.0,
                          onPressed: () =>
                              controller.increaseItemQuantity(product),
                          icon: const Icon(Icons.add, color: Color(0xFFEC6813)),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget bottomBarTitle() {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Total",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
          ),
          Obx(
            () {
              return AnimatedSwitcherWrapper(
                child: Text(
                  "\$${controller.totalPrice.value}",
                  key: ValueKey<int>(controller.totalPrice.value),
                  style:  TextStyle(
                    fontSize: 0.02.sh,
                    fontWeight: FontWeight.w900,
                    color: AppColors.darkGreen,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget bottomBarButton() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(20),shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),backgroundColor: AppColors.darkGreen),
          onPressed: controller.isEmptyCart ? null : () {},
          child: const Text("Buy Now"),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    controller.getCartItems();
    return Scaffold(
      appBar: _appBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: !controller.isEmptyCart ? cartList() : const EmptyCart(),
          ),
          bottomBarTitle(),
          bottomBarButton()
        ],
      ),
    );
  }
}
