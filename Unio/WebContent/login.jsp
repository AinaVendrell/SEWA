<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
      crossorigin="anonymous"
    />
    <title>Log in UNIO</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="parsley/parsley.min.js"></script>
    <!--  <script src="parsley/i18n/ca.js"></script> -->
    <link rel="stylesheet" type="text/css" href="css/main.css" />
  </head>

  <body>

    <div class="description">
      <img
        class="mb-4"
        src="images/unio.svg"
        alt="unio"
        width="72"
        height="72"
      />

      <h1>Log in UNIO</h1>
      <hr />
      <br />
    </div>
    <div class="container">
      <form
        data-parsley-trigger="keyup"
        data-parsley-validate
        action="RegisterController"
      >
        <div class="form-row justify-content-center h-100 mb-2">
          <div class="col-sm-4">
            <label class="sr-only" for="username">Username</label>
            <div class="input-group mb-3">
              <div class="input-group-prepend">
                <div class="input-group-text">@</div>
              </div>
              <input
                type="text"
                class="form-control"
                id="username"
                name="username"
                placeholder="Username"
                required
                data-parsley-type="alphanum"
                value="${user.username}"
              />
            </div>
          </div>
        </div>
        <div class="form-row justify-content-center h-100 mb-4">
          <div class="col-sm-4">
            <label class="sr-only" for="pwd1">Password</label>
            <input
              type="password"
              id="pwd1"
              name="pwd1"
              class="form-control"
              placeholder="Password"
              aria-describedby="passwordHelpBlock"
              required
              value="${user.pwd1}"
            />
          </div>
        </div>
        <div class="form-row justify-content-center h-100 mb-4">
          <div class="col-sm-4">
            <button type="submit" class="btn btn-primary btn-block">
              Log in
            </button>
          </div>
        </div>
      </form>
    </div>

    <!-- SCRIPTS -->
    <script
      src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
      integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
      integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
      integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
      crossorigin="anonymous"
    ></script>
    <!-- Include Date Range Picker -->
    <script
      type="text/javascript"
      src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"
    ></script>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"
    />
    <script src="parsley/parsley.js"></script>
    <script type="text/javascript">
      //has uppercase
      window.Parsley.addValidator('uppercase', {
        requirementType: 'number',
        validateString: function (value, requirement) {
          var uppercases = value.match(/[A-Z]/g) || []
          return uppercases.length >= requirement
        },
        messages: {
          en: 'Your password must contain at least (%s) uppercase letter.',
        },
      })

      //has lowercase
      window.Parsley.addValidator('lowercase', {
        requirementType: 'number',
        validateString: function (value, requirement) {
          var lowecases = value.match(/[a-z]/g) || []
          return lowecases.length >= requirement
        },
        messages: {
          en: 'Your password must contain at least (%s) lowercase letter.',
        },
      })

      //has number
      window.Parsley.addValidator('number', {
        requirementType: 'number',
        validateString: function (value, requirement) {
          var numbers = value.match(/[0-9]/g) || []
          return numbers.length >= requirement
        },
        messages: {
          en: 'Your password must contain at least (%s) number.',
        },
      })

      //has number
      window.Parsley.addValidator('nowhitespace', {
        requirementType: 'number',
        validateString: function (value) {
          var numbers = value.match(/\s/g) || []
          return numbers.length == 0
        },
        messages: {
          en: 'Your password must not contain white spaces.',
        },
      })

      /* add validation for minimum age */
      window.Parsley.addValidator('minimumage', {
        validateString: function (value, requirements) {
          // get validation requirments
          var reqs = value.split('/'),
            day = reqs[0],
            month = reqs[1],
            year = reqs[2]

          // check if date is a valid
          var birthday = new Date(year + '-' + month + '-' + day)

          // Calculate birtday and check if age is greater than 18
          var today = new Date()

          var age = today.getFullYear() - birthday.getFullYear()
          var m = today.getMonth() - birthday.getMonth()
          if (m < 0 || (m === 0 && today.getDate() < birthday.getDate())) {
            age--
          }

          return age >= requirements
        },
      })
    </script>
    <script>
      $(document).ready(function () {
        $('form').parsley()
      })
    </script>
    <!-- END SCRIPTS -->
  </body>
</html>
