import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import '../model/product_model.dart';

class ProductWidget extends StatefulWidget {
  final Product product;

  ProductWidget({required this.product});

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  Color? dominantColor;

  @override
  void initState() {
    super.initState();
    _updatePalette();
  }

  Future<void> _updatePalette() async {
    final PaletteGenerator paletteGenerator = await PaletteGenerator.fromImageProvider(
      AssetImage(widget.product.imageAssetPath),
    );
    setState(() {
      dominantColor = paletteGenerator.dominantColor?.color ?? Colors.grey;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12.0),
      elevation: 4.0, // Adds a shadow all around the card
      shadowColor: Colors.black.withOpacity(0.2), // Shadow color with reduced opacity
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  color: dominantColor, // Apply the dominant color to the image container
                  child: Image.asset(
                    widget.product.imageAssetPath,
                    height: 130,
                    width: double.infinity,
                    fit: BoxFit.cover, // Ensures the image covers the entire container
                  ),
                ),
                if (widget.product.discountPercentage > 0)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Text(
                        '${widget.product.discountPercentage}% OFF',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 4.0),
            Text(
              widget.product.name,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 3.0),
            Text(
              widget.product.description,
              maxLines: 1,
              overflow: TextOverflow.ellipsis, // Add this to handle long text properly
            ),
            SizedBox(height: 3.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (widget.product.discountPercentage > 0)
                  Text(
                    '\$${widget.product.price.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.red,
                      decorationThickness: 2,
                    ),
                  ),
                if (widget.product.discountPercentage > 0)
                  SizedBox(width: 8.0),
                Text(
                  '\$${widget.product.priceAfterDiscount.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.0),
            ElevatedButton.icon(
              onPressed: () {
                // Handle add to cart action
              },
              icon: Icon(Icons.add_shopping_cart,
                color: Theme.of(context).colorScheme.surface
                ,),
              label: Text('Add to Cart',
                style:Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: Theme.of(context).colorScheme.surface
                )

                ,),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 36),
                backgroundColor: Theme.of(context).colorScheme.secondary, // Full-width button
              ),
            ),
          ],
        ),
      ),
    );
  }
}
