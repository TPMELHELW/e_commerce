import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Search in Store',
          hintStyle: Theme.of(context).textTheme.bodySmall,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: const Icon(Iconsax.search_normal),
        ),
      ),
    );
  }
}
