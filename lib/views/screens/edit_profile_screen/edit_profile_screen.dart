import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harsa_mobile/viewmodels/edit_profile_provider.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late final EditProfileProvider pageProvider;

  @override
  void initState() {
    super.initState();

    pageProvider = Provider.of<EditProfileProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              width: screenWidth,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.chevron_left_outlined),
                  ),
                  Text(
                    'Edit Profile',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Consumer<EditProfileProvider>(
                builder: (context, value, child) => SingleChildScrollView(
                  controller: value.scrollController,
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: screenWidth,
                        child: Stack(
                          fit: StackFit.loose,
                          alignment: Alignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 70,
                              ),
                              child: GestureDetector(
                                onTap: pageProvider.pickImage,
                                child: Stack(
                                  fit: StackFit.passthrough,
                                  alignment: Alignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: screenWidth * 0.15,
                                    ),
                                    SvgPicture.asset(
                                      'assets/icons/outline/square_and_pencil.svg',
                                      colorFilter: const ColorFilter.mode(
                                        Colors.white,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Visibility(
                              visible: value.pickerVisible,
                              child: Positioned(
                                top: screenWidth * 0.2,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Color.fromARGB(50, 0, 0, 0),
                                            blurRadius: 5,
                                            blurStyle: BlurStyle.outer),
                                      ]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: screenWidth * 0.5,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 10, bottom: 5),
                                          child: Text(
                                            'Ambil Foto',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.5,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 5, bottom: 10),
                                          child: Text(
                                            'Pilih Foto',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: screenWidth,
                        child: Text(
                          'Nama Depan',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.grey),
                        ),
                      ),
                      TextFormField(
                        controller: value.firstNameController,
                        decoration: const InputDecoration(
                          isDense: true,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Colors.grey,
                            ),
                          ),
                          contentPadding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 5,
                            bottom: 10,
                          ),
                          hintText: 'John',
                        ),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: screenWidth,
                        child: Text(
                          'Nama Belakang',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.grey),
                        ),
                      ),
                      TextFormField(
                        controller: value.lastNameController,
                        decoration: const InputDecoration(
                          isDense: true,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Colors.grey,
                            ),
                          ),
                          contentPadding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 5,
                            bottom: 10,
                          ),
                          hintText: 'Doe',
                        ),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: screenWidth,
                        child: Text(
                          'Jenis Kelamin',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Row(
                          children: [
                            Radio(
                              visualDensity: const VisualDensity(
                                  horizontal: VisualDensity.minimumDensity,
                                  vertical: VisualDensity.minimumDensity),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              value: 'male',
                              groupValue: value.gender,
                              onChanged: (value) =>
                                  pageProvider.genderSelector(value!),
                            ),
                            Text(
                              'Pria',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(color: Colors.grey),
                            ),
                            SizedBox(
                              width: screenWidth * 0.05,
                            ),
                            Radio(
                              visualDensity: const VisualDensity(
                                  horizontal: VisualDensity.minimumDensity,
                                  vertical: VisualDensity.minimumDensity),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              value: 'female',
                              groupValue: value.gender,
                              onChanged: (value) =>
                                  pageProvider.genderSelector(value!),
                            ),
                            Text(
                              'Wanita',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: screenWidth,
                        child: Text(
                          'Tanggal Lahir',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: value.birthDateController,
                        onTap: pageProvider.datePicker,
                        readOnly: true,
                        decoration: const InputDecoration(
                          isDense: true,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Colors.grey,
                            ),
                          ),
                          contentPadding: EdgeInsets.only(
                            left: 15,
                            right: 10,
                            top: 5,
                            bottom: 10,
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(bottom: 10, right: 5),
                            child: Icon(
                              Icons.calendar_month_rounded,
                              size: 25,
                            ),
                          ),
                          prefixIconConstraints: BoxConstraints(),
                          hintText: 'DD-MM-YYYY',
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(bottom: 5, right: 5),
                            child: Icon(
                              Icons.chevron_right,
                              size: 30,
                            ),
                          ),
                          suffixIconConstraints: BoxConstraints(),
                        ),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: screenWidth,
                        child: Text(
                          'Pekerjaan',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.grey),
                        ),
                      ),
                      TextFormField(
                        controller: value.jobController,
                        decoration: const InputDecoration(
                          isDense: true,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Colors.grey,
                            ),
                          ),
                          contentPadding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 5,
                            bottom: 10,
                          ),
                        ),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: screenWidth,
                        child: Text(
                          'Bio',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.grey),
                        ),
                      ),
                      TextFormField(
                        controller: value.bioController,
                        maxLines: 5,
                        minLines: 1,
                        decoration: const InputDecoration(
                          isDense: true,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Colors.grey,
                            ),
                          ),
                          contentPadding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 5,
                            bottom: 10,
                          ),
                        ),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: screenWidth,
                        child: Text(
                          'Telepon',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.grey),
                        ),
                      ),
                      TextFormField(
                        controller: value.phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          isDense: true,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Colors.grey,
                            ),
                          ),
                          contentPadding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 5,
                            bottom: 10,
                          ),
                          hintText: '08xx xxxx xxxx',
                        ),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: screenWidth,
                        child: Text(
                          'Kota',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.grey),
                        ),
                      ),
                      TextFormField(
                        controller: value.cityController,
                        decoration: const InputDecoration(
                          isDense: true,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Colors.grey,
                            ),
                          ),
                          contentPadding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 5,
                            bottom: 10,
                          ),
                        ),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: screenWidth,
                        child: Text(
                          'Alamat',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.grey),
                        ),
                      ),
                      TextFormField(
                        controller: value.addressController,
                        decoration: const InputDecoration(
                          isDense: true,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Colors.grey,
                            ),
                          ),
                          contentPadding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 5,
                            bottom: 10,
                          ),
                        ),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: 70,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
