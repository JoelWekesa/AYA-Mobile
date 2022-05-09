// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, body_might_complete_normally_nullable

import 'dart:io';

import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:aya2/controllers/knowbase/subarticles.dart';
import 'package:aya2/controllers/knowbase/title.dart';
import 'package:aya2/helpers/basecreate.dart';
import 'package:aya2/palette.dart';
import 'package:aya2/screens/dialog.dart';
import 'package:aya2/screens/pagecontainer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class AddForm extends StatefulWidget {
  const AddForm({Key? key}) : super(key: key);

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final _formKey = GlobalKey<FormState>();
  String title = "";
  String subArticleTitle = "";
  String content = "";
  PDFDocument? doc;

  File? imagePicked;

  bool? isLoading = false;

  PlatformFile? file;

  AddArticleTitleController controller = Get.put(AddArticleTitleController());
  SubArticlesController articles = Get.put(SubArticlesController());
  HtmlEditorController editor = HtmlEditorController();

  Future pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        file = result.files.first;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return pageContainer(
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        helperStyle: TextStyle(
                          letterSpacing: 2,
                          color: Palette.kToDark,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        prefixIcon: Icon(FontAwesomeIcons.textWidth),
                        helperText: "Article Title"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter some text';
                      }
                      title = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        helperStyle: TextStyle(
                          letterSpacing: 2,
                          color: Palette.kToDark,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        prefixIcon: Icon(FontAwesomeIcons.textWidth),
                        helperText: "Sub Article Title"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter some text';
                      }
                      subArticleTitle = value;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () async {
                      await pickFile();
                    },
                    child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Palette.kToDark),
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Center(
                          child: ListTile(
                              leading: Icon(FontAwesomeIcons.fileImage, size: 50),
                              title: file == null ? Text("Select Document") : Text(file!.name)),
                        )),
                  ),
                ),

                // HtmlEditor(
                //   controller: editor, //required
                //   htmlEditorOptions: HtmlEditorOptions(
                //     hint: "Your text here...",

                //     //initalText: "text content initial, if any",
                //   ),
                //   htmlToolbarOptions: HtmlToolbarOptions(
                //     toolbarPosition: ToolbarPosition.aboveEditor, //by default
                //     toolbarType: ToolbarType.nativeGrid, //by default
                //     mediaLinkInsertInterceptor: (String url, InsertFileType type) {
                //       print(url);
                //       return true;
                //     },
                //     mediaUploadInterceptor: (PlatformFile file, InsertFileType type) async {
                //       print(file.name); //filename
                //       print(file.size); //size in bytes
                //       print(file.extension); //file extension (eg jpeg or mp4)
                //       return true;
                //     },
                //   ),
                //   otherOptions: OtherOptions(
                //     height: 500,
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        if (file != null) {
                          setState(() {
                            isLoading = true;
                          });
                          Map<String, String> body = {
                            "title": title,
                            "subtitle": subArticleTitle,
                          };
                          await BaseCreate().makeApiCallWithFile("/kbase", body, "file", file!);

                          setState(() {
                            isLoading = false;
                          });
                        } else {
                          showDialogFail("Error", "Please select a file");
                        }
                      }
                    },
                    child: Text(isLoading == true ? "Loading..." : "Submit"),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
