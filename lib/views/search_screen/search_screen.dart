import 'package:edu_admit/data_model/universities_model.dart';
import 'package:edu_admit/resources/components/main_container.dart';
import 'package:edu_admit/views/description_screen/description_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  final List<Admission>? admissions;
  const SearchScreen({super.key, required this.admissions});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String search = '';
  TextEditingController searchController = TextEditingController();
  SearchController ctr = Get.put(SearchController());

  @override
  void dispose() {
    searchController.dispose();
    ctr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(top: height * 0.07, left: 5, right: 5, bottom: 10),
        child: Obx(() => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    controller: ctr.controller.value,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search',
                      hintStyle: Theme.of(context).textTheme.bodyLarge,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onChanged: (value) {
                      search = value;
                      ctr.controller.value.text = value;
                    },
                  ),
                ),
                Expanded(
                  child: widget.admissions == null
                      ? const Center(child: Text('No Data Available'))
                      : ListView.builder(
                          itemCount: widget.admissions!.length,
                          itemBuilder: (context, index) {
                            Admission admission = widget.admissions![index];

                            return (ctr.controller.value.text.isEmpty ||
                                    admission.name.toLowerCase().contains(ctr
                                        .controller.value.text
                                        .toLowerCase()))
                                ? MainContainer(
                                    image: admission.logo,
                                    title: admission.name,
                                    subtitle: admission.location,
                                    onPress: () {
                                      Get.to(() => const DescriptionScreen(),
                                          arguments: admission);
                                      FocusScope.of(context).unfocus();
                                      ctr.controller.value.clear();
                                    },
                                  )
                                : const SizedBox();
                          },
                        ),
                ),
              ],
            )),
      ),
    );
  }
}

class SearchController extends GetxController {
  var controller = TextEditingController().obs;
}
