
import 'package:flutter/material.dart';

class PageViewModel {
  final String logoURI;
  final String title;
  final String description;
  final String iconURI;
  final Color backgroundColor;

  PageViewModel({
    this.logoURI,
    this.title,
    this.description,
    this.backgroundColor,
    this.iconURI,
  });
}

 var viewModel = <PageViewModel>[
    PageViewModel(
       backgroundColor:Color(0xFF678FB4),
       logoURI:'assets/hotels.png',
       title:'Hotels',
       description:'All hotels and hostels are sorted by hospitality rating',
       iconURI:'assets/key.png'
   ),
    PageViewModel(
       backgroundColor:Color(0xFF65B0B4),
       logoURI:'assets/banks.png',
       title:'Banks',
       description:'We carefully verify all banks before adding them into the app',
       iconURI:'assets/wallet.png'
   ),
    PageViewModel(
     backgroundColor:Color(0xFF9B90BC),
     logoURI:'assets/stores.png',
     title:'Store',
     description:'All local stores are categorized for your convenience',
     iconURI:'assets/shopping_cart.png',
   ),
];