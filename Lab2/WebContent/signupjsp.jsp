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
    <title>Sign up - UNIO</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="parsley/parsley.min.js"></script>
    <!--  <script src="parsley/i18n/ca.js"></script> -->
    <link rel="stylesheet" type="text/css" href="css/main.css" />
  </head>

  <body>
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

    <ul class="server-errors-list">
      <c:if test="${model.error[0]}">
        <li>Entered user name has been already registered</li>
      </c:if>
    </ul>

    <div class="description">
      <img
        class="mb-4"
        src="images/unio.svg"
        alt="unio"
        width="72"
        height="72"
      />

      <h1>Sign up in UNIO</h1>
      <hr />
      <br />
    </div>
    <div class="center_form">
      <form
        class="mx-sm-5"
        data-parsley-trigger="keyup"
        data-parsley-validate
        action="FormController"
      >
        <div class="form-row">
          <div class="form-group col-sm-2">
            <label class="sr-only" for="name">Nombre</label>
            <input
              type="text"
              id="name"
              name="name"
              class="form-control"
              placeholder="Nombre"
              value="${model.name}"
              pattern="[A-Za-z]+"
              required
            />
          </div>
          <div class="form-group col-sm-2">
            <label class="sr-only" for="surname">Apellidos</label>
            <input
              type="text"
              id="surname"
              name="surname"
              class="form-control"
              placeholder="Apellidos"
              value="${model.surname}"
              pattern="[A-Za-z]+"
              required
            />
          </div>
        </div>
        <!-- data-parsley-pattern="^[0-9]{2}/[0-9]{2}/[0-9]{4}$" -->
        <div class="form-row mb-4">
          <div class="col-sm-2">
            <label class="control-label" for="birthday"
              >Fecha de nacimiento</label
            >
            <input
              class="form-control"
              id="birthday"
              name="birthday"
              type="date"
              required
              data-parsley-pattern-message="Invalid Date."
              data-date-format="DD/MM/YYYY"
              data-parsley-minimumage="13"
              data-parsley-minimumage-message="Minimum age is 13"
              value="${model.birthday}"
            />
          </div>
          <!--data-parsley-maxdate="10/10/2019"-->

          <div class="col-sm-2">
            <label for="gender">Género:</label>
            <select
              id="gender"
              name="gender"
              class="form-control"
              value="${model.gender}"
              required
            >
              <option></option>
              <option value="hombre">Hombre</option>
              <option value="mujer">Mujer</option>
              <option value="otro">Otro</option>
              <option value="nodecir">Prefiero no decirlo</option>
            </select>
          </div>
        </div>
        <div class="form-row mb-2">
          <div class="col-sm-4">
            <label class="sr-only" for="userName">Nombre de Usuario</label>
            <div class="input-group mb-3">
              <div class="input-group-prepend">
                <div class="input-group-text">@</div>
              </div>
              <input
                type="text"
                class="form-control"
                id="userName"
                name="userName"
                placeholder="Nombre de Usuario"
                required
                data-parsley-type="alphanum"
                value="${model.userName}"
              />
            </div>
          </div>
        </div>
        <div class="form-row mb-4">
          <div class="col-sm-4">
            <label for="email" class="sr-only">Email</label>
            <input
              type="email"
              class="form-control"
              id="email"
              name="email"
              placeholder="Email"
              required
              data-parsley-type="email"
              value="${model.email}"
            />
          </div>
        </div>
        <div class="form-row mb-4">
          <div class="col-sm-4">
            <label class="sr-only" for="pwd1">Contraseña:</label>
            <input
              type="password"
              id="pwd1"
              name="pwd1"
              class="form-control"
              placeholder="Password"
              aria-describedby="passwordHelpBlock"
              required
              data-parsley-minlength="8"
              data-parsley-maxlength="20"
              data-parsley-uppercase="1"
              data-parsley-lowercase="1"
              data-parsley-number="1"
              data-parsley-nowhitespace
              value="${model.pwd1}"
            />
            <small id="passwordHelpBlock" class="form-text text-muted">
              Your password must be 8-20 characters long, contain lowercase and
              captial letters and numbers, and must not contain spaces, special
              characters, or emoji.
            </small>
          </div>
        </div>
        <div class="form-row mb-4">
          <div class="col-sm-4">
            <label class="sr-only" for="pwd2">Repite la contraseña:</label
            ><input
              type="password"
              id="pwd2"
              name="pwd2"
              class="form-control"
              placeholder="Repeat password"
              aria-describedby="passwordHelpBlock"
              value="${model.pwd2}"
              required
              data-parsley-equalto="#pwd1"
            />
          </div>
        </div>
        <div class="form-row mb-4">
          <div class="col-auto">
            <div class="form-check">
              <input
                class="form-check-input"
                type="checkbox"
                id="termCheck"
                required
              />
              <label class="form-check-label" for="termCheck">
                He leido y acepto los
                <a
                  href="PoliticaDatos.html"
                  target="popup"
                  onclick="window.open('PoliticaDatos.html','popup','width=600,height=600'); return false;"
                  >términos de uso</a
                >
              </label>
            </div>
          </div>
        </div>
        <div class="form-row mb-4">
          <div class="col-sm-4">
            <button type="submit" class="btn btn-primary btn-block">
              Sign up
            </button>
          </div>
        </div>
      </form>
    </div>
  </body>
</html>
