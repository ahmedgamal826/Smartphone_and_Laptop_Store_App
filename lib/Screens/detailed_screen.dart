import 'package:flutter/material.dart';
import 'package:phones_and_laptops_store_app/Model/store_model.dart';
import 'package:phones_and_laptops_store_app/widgets/show_AwesomeDialog.dart';
import 'package:phones_and_laptops_store_app/widgets/show_image_dialog.dart';

class DetailedScreen extends StatefulWidget {
  final StoreModel storeModel;

  const DetailedScreen({Key? key, required this.storeModel}) : super(key: key);

  @override
  State<DetailedScreen> createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(size: 30),
        centerTitle: true,
        title: const Text(
          'Details',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSelected = !isSelected;
              });
            },
            icon: Icon(
              Icons.favorite,
              size: 30,
              color: isSelected ? Colors.red : Colors.grey,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(widget.storeModel.thumbnail),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.storeModel.images.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        showImageDialog(
                            widget.storeModel.images[index], context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            widget.storeModel.images[index],
                            width: 100,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              Text(
                widget.storeModel.title,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Brand',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                widget.storeModel.brand,
                style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              const Text(
                'Price',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "\$${widget.storeModel.price}",
                style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                "Description",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.storeModel.description,
                style: const TextStyle(fontSize: 17, color: Colors.grey),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Colors.blue),
                      onPressed: () {
                        setState(() {
                          showAwesomeDialog(context);
                        });
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(
                            left: 100, right: 100, top: 10, bottom: 10),
                        child: Text(
                          'Add to cart',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
