<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
  <form id="uploadForm" enctype="multipart/form-data">
    <input type="file" id="fileInput" name="hinhAnh">
    <button type="submit" id="uploadButton">Upload</button>
  </form>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script>
      $(document).ready(function(){
          $('#uploadButton').on('click', function(){
              var formData = new FormData();
              var file = $('#fileInput')[0].files[0];
              formData.append('file', file);

              $.ajax({
                  url: 'test/upload', // Địa chỉ URL của endpoint xử lý việc tải ảnh lên máy chủ
                  type: 'POST',
                  data: formData,
                  contentType: false,
                  processData: false,
                  success: function(response){
                      console.log('Upload successful');
                      // Xử lý phản hồi từ máy chủ nếu cần
                  },
                  error: function(xhr, status, error){
                      console.error('Upload error:', error);
                      // Xử lý lỗi nếu có
                  }
              });
          });
      });
  </script>


<%---- sản phẩm--%>
  <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>--%>
  <%--<script>--%>
  <%--    $(document).ready(function(){--%>
  <%--        $('#addSanPham').on('click', function(){--%>
  <%--            var formData = new FormData();--%>
  <%--            var file = $('#hinhAnh')[0].files[0];--%>
  <%--            formData.append('hinhAnh', file);--%>

  <%--            $.ajax({--%>
  <%--                url: 'san-pham', // Địa chỉ URL của endpoint xử lý việc tải ảnh lên máy chủ--%>
  <%--                type: 'POST',--%>
  <%--                data: formData,--%>
  <%--                contentType: false,--%>
  <%--                processData: false,--%>
  <%--                success: function(response){--%>
  <%--                    console.log('Upload successful');--%>
  <%--                    // Xử lý phản hồi từ máy chủ nếu cần--%>
  <%--                },--%>
  <%--                error: function(xhr, status, error){--%>
  <%--                    console.error('Upload error:', error);--%>
  <%--                    // Xử lý lỗi nếu có--%>
  <%--                }--%>
  <%--            });--%>
  <%--        });--%>
  <%--    });--%>
  <%--</script>--%>

</body>
</html>