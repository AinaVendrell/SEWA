<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>

<div>
  <ul class="server-errors-list">
    <c:if test="${user.error[0]}">
      <li>Entered user name has been already registered</li>
    </c:if>
    <c:if test="${user.error[1]}">
      <li>Entered email has been already registered</li>
    </c:if>
  </ul>

  <div class="description">
    <img class="mb-4" src="images/unio.svg" alt="unio" width="72" height="72" />

    <h1>SignUp UNIO</h1>
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
        <div class="form-group col-lg-2 col-md-4">
          <label class="sr-only" for="name">First Name</label>
          <input
            type="text"
            id="name"
            name="name"
            class="form-control"
            placeholder="First Name"
            value="${user.name}"
            pattern="[A-Za-z]+"
            required
          />
        </div>
        <div class="form-group col-lg-2 col-md-4">
          <label class="sr-only" for="surname">Last Name</label>
          <input
            type="text"
            id="surname"
            name="surname"
            class="form-control"
            placeholder="Last Name"
            value="${user.surname}"
            pattern="[A-Za-z]+"
            required
          />
        </div>
      </div>
      <!-- data-parsley-pattern="^[0-9]{2}/[0-9]{2}/[0-9]{4}$" -->
      <div class="form-row justify-content-center h-100 mb-2">
        <div class="form-group col-lg-2 col-md-4">
          <label class="control-label sr-only" for="birthday">Birthday</label>
          <input
            class="form-control"
            id="birthday"
            name="birthday"
            type="text"
            onfocus="(this.type='date')"
            onblur="if(!this.value)this.type='text'"
            placeholder="Birthday"
            required
            data-parsley-pattern-message="Invalid Date."
            data-date-format="DD/MM/YYYY"
            data-parsley-minimumage="13"
            data-parsley-minimumage-message="Minimum age is 13"
            value="${user.birthday}"
          />
        </div>
        <!--data-parsley-maxdate="10/10/2019"-->
        <div class="form-group col-lg-2 col-md-4">
          <label class="sr-only" for="gender">Gender</label>
          <select
            id="gender"
            name="gender"
            class="form-control"
            value="${user.gender}"
            required
          >
            <option value="">Gender</option>
            <option value="hombre">Male</option>
            <option value="mujer">Female</option>
            <option value="otro">Other</option>
            <option value="nodecir">Prefer not to answer</option>
          </select>
        </div>
      </div>
      <div class="form-row justify-content-center h-100 mb-2">
        <div class="col-lg-4 col-md-8">
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
        <div class="col-lg-4 col-md-8">
          <label for="email" class="sr-only">Email</label>
          <input
            type="email"
            class="form-control"
            id="email"
            name="email"
            placeholder="Email"
            required
            data-parsley-type="email"
            value="${user.email}"
          />
        </div>
      </div>
      <div class="form-row justify-content-center h-100 mb-4">
        <div class="col-lg-4 col-md-8">
          <label class="sr-only" for="pwd1">Password</label>
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
            value="${user.pwd1}"
          />
          <small id="passwordHelpBlock" class="form-text text-muted">
            Your password must be 8-20 characters long, contain lowercase and
            captial letters and numbers, and must not contain spaces, special
            characters, or emoji.
          </small>
        </div>
      </div>
      <div class="form-row justify-content-center h-100 mb-4">
        <div class="col-lg-4 col-md-8">
          <label class="sr-only" for="pwd2">Confirm Password</label
          ><input
            type="password"
            id="pwd2"
            name="pwd2"
            class="form-control"
            placeholder="Confirm Password"
            aria-describedby="passwordHelpBlock"
            value="${user.pwd2}"
            required
            data-parsley-equalto="#pwd1"
          />
        </div>
      </div>
      <div class="form-row justify-content-center h-100 mb-4">
        <div class="col-lg-4 col-md-8">
          <div class="form-check">
            <input
              class="form-check-input"
              type="checkbox"
              id="termCheck"
              required
            />
            <label class="form-check-label" for="termCheck">
              I have read an agree to the
              <a
                href="PrivacyPolicy.html"
                target="popup"
                onclick="window.open('PrivacyPolicy.html','popup','width=600,height=600'); return false;"
                >Terms of Use</a
              >
            </label>
          </div>
        </div>
      </div>
      <div class="form-row justify-content-center h-100 mb-4">
        <div class="col-lg-4 col-md-8">
          <button type="submit" class="btn btn-primary btn-block">
            Sign up
          </button>
        </div>
      </div>
    </form>
  </div>

  <!-- SCRIPTS -->

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
</div>
