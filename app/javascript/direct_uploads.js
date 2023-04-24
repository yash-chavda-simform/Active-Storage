debugger
$(document).ready(function() {
    $('form.upload-form').on('submit', function(event) {
      event.preventDefault(); // prevent the form from submitting normally
      var formData = new FormData($('form.upload-form')[0]); // get the form data
      $.ajax({
        url: $(this).attr('action'),
        type: 'POST',
        data: formData,
        xhr: function() {
          var xhr = $.ajaxSettings.xhr();
          xhr.upload.onprogress = function(event) {
            var percentage = Math.round((event.loaded / event.total) * 100);
            $('.progress').css('width', percentage + '%');
          };
          return xhr;
        },
        cache: false,
        contentType: false,
        processData: false,
        success: function(response) {
          alert('Upload successful!');
        },
        error: function(xhr, status, error) {
          alert('Error: ' + error);
        }
      });
    });
  });