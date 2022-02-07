import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

dynamic openImagePicker(
    {BuildContext context, 
    Function onGalleryTapped,
     Function onCameraTapped,}) {
  showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          cancelButton: CupertinoButton(
            child: Text(
//              translator.currentLanguage == "en" ? "Cancel" :
              "الغاء",
              style: TextStyle(
              ),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: <Widget>[
            CupertinoButton(
                child: Row(
                  children: <Widget>[
                    Icon(
                      CupertinoIcons.photo_camera_solid,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
//                      translator.currentLanguage == "en"
//                          ? "Camera"
//                          :
                      "الكاميرا",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                onPressed: onCameraTapped),
            CupertinoButton(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.insert_photo, ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
//                      translator.currentLanguage == "en"
//                          ? "Gallery"
//                          :
                      "الاستوديو",
                      style: TextStyle(
                  
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                onPressed: onGalleryTapped),
          ],
        );
      });
}