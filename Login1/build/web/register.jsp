<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   
    
    <title>Đăng Kí</title>
    <link rel="stylesheet" href="style2.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  
    
</head>
<body>
    

   
    <div class="main">
        <h1 class="heading">Đăng kí</h1>
        <form action="register" method="POST" class="form" id="form-1">
          <div class="spacer"></div>
  
          <div class="form-group">
            <label for="fullname" class="form-label">Tên đầy đủ</label>
            <input id="fullname" name="fullname" type="text"  class="form-control">
            <span class="form-message"></span>
          </div>
  
          <div class="form-group">
            <label for="email" class="form-label">Email</label>
            <input id="email" name="email" type="text"  class="form-control">
            <span class="form-message"></span>
          </div>
  
          <div class="form-group">
            <label for="password" class="form-label">Mật khẩu</label>
            <input id="password" name="password" type="password"  class="form-control">
            <span class="form-message"></span>
          </div>
  
          <div class="form-group">
            <label for="password_confirmation" class="form-label">Nhập lại mật khẩu</label>
            <input id="password_confirmation" name="password_confirmation"  type="password" class="form-control">
            <span class="form-message"></span>
          </div>
  
          <button type="submit" class="form-submit" name="signup" value="register">Đăng ký</button>
          <div class="signup">
            Đã có tài khoản? <a href="Login.jsp">Đăng Nhập </a>
        </div>
        </form>
  
        
  
      </div>
      
      <script>
  
        document.addEventListener('DOMContentLoaded', function () {
          // Mong muốn của chúng ta
          Validator({
            form: '#form-1',
            formGroupSelector: '.form-group',
            errorSelector: '.form-message',
            rules: [
              Validator.isRequired('#fullname', 'Vui lòng nhập tên đầy đủ của bạn'),
              Validator.isEmail('#email'),
              Validator.minLength('#password', 6),
              Validator.isRequired('#password_confirmation'),
              Validator.isConfirmed('#password_confirmation', function () {
                return document.querySelector('#form-1 #password').value;
              }, 'Mật khẩu nhập lại không chính xác')
            ],
            onSubmit: function (data) {
              // Call API
              console.log(data);
            }
          });
          });
  
      </script>
      <script>
          document.addEventListener('DOMContentLoaded', function() {
    const submitButton = document.querySelector('.form-submit');

    submitButton.addEventListener('click', function(event) {
        // Prevent the default form submission behavior
        event.preventDefault();

        // Your custom form submission logic here
        console.log('Button clicked!');
        document.getElementById('form-1').submit(); // Manually submit the form
    });
});

      </script>
      <script src="register.js"></script>
</body>

</html>
