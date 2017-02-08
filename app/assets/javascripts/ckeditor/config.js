/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config ) {
  // Define changes to default configuration here. For example:
  // config.language = 'fr';
  // config.uiColor = '#AADC6E';

  // Define extra plugins
  // config.extraPlugins = "autoembed,autolink,undo,embedsemantic,embedbase";

  /* Filebrowser routes */
  // The location of an external file browser, that should be launched when "Browse Server" button is pressed.
  config.filebrowserBrowseUrl = "/en/ckeditor/attachment_files";

  // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Flash dialog.
  config.filebrowserFlashBrowseUrl = "/en/ckeditor/attachment_files";

  // The location of a script that handles file uploads in the Flash dialog.
  config.filebrowserFlashUploadUrl = "/en/ckeditor/attachment_files";

  // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Link tab of Image dialog.
  config.filebrowserImageBrowseLinkUrl = "/en/ckeditor/pictures";

  // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Image dialog.
  config.filebrowserImageBrowseUrl = "/en/ckeditor/pictures";

  // The location of a script that handles file uploads in the Image dialog.
  config.filebrowserImageUploadUrl = "/en/ckeditor/pictures";

  // The location of a script that handles file uploads.
  config.filebrowserUploadUrl = "/en/ckeditor/attachment_files";

  config.allowedContent = true;

  // Toolbar groups configuration.
  config.toolbar = [
    {
      name: "styles",
      items: [
        "Format"
      ]
    },
    {
      name: "basicstyles",
      items: [
        "Bold",
        "Italic",
        "-",
        "RemoveFormat"
      ]
    },
    {
      name:  "paragraph",
      items: [
        "NumberedList",
        "BulletedList",
        "-",
        "Outdent",
        "Indent",
        "-",
        "Blockquote"
      ]
    },
    {
      name: "links",
      items: [
        "Link",
        "Unlink"
      ]
    },
    {
      name: "insert",
      items: [
        "Image"
      ]
    }
  ];

  // config.toolbar_mini = [
  //   { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ], items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ] },
  //   { name: 'styles', items: [ 'Font', 'FontSize' ] },
  //   { name: 'colors', items: [ 'TextColor', 'BGColor' ] },
  //   { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ], items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat' ] },
  //   { name: 'insert', items: [ 'Image', 'Table', 'HorizontalRule', 'SpecialChar' ] }
  // ];
};
