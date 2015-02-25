$(function() {
  $('#site_asset_file_name').on('change', function(){
    var file_name, extension, mode;
    file_name = $(this).val();
    extension = file_name.split('.')[1];

    switch(extension) {
      case 'js':
        mode = 'javascript';
        break;
      default:
        mode = 'scss';
    }

    editor.getSession().setMode("ace/mode/"+mode);
  });
});
