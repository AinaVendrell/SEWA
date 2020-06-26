<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>

<div>
  <div  class="description">
    <form
      data-parsley-trigger="keyup"
      data-parsley-validate
      action="UpdateUser"
    >
      <div class="mb-4"></div>
      <div class="form-row justify-content-center h-100 mb-2">
        <div class="form-group col-5">
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
        <div class="form-group col-5">
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
     <div class="form-row justify-content-center h-100 mb-2">
        <div class="col-lg-10">
          <label class="sr-only" for="uid">Username</label>
          <div class="input-group mb-3">
            <div class="input-group-prepend">
              <div class="input-group-text">@</div>
            </div>
            <input
              type="text"
              class="form-control"
              id="username"
              name="username"
              placeholder="username"
              required
              data-parsley-type="alphanum"
              value="${user.username}"
            />
          </div>
        </div>
      </div>
      <div class="form-row justify-content-center h-100 mb-4">
        <div class="col-lg-10">
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
        <div class="col-lg-10">
          <label class="sr-only" for="pwd">Password</label>
          <input
            type="password"
            id="pwd"
            name="pwd"
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
            value="${user.pwd}"
          />
          <small id="passwordHelpBlock" class="form-text text-muted">
            Your password must be 8-20 characters long, contain lowercase and
            capital letters and numbers, and must not contain spaces, special
            characters, or emoji.
          </small>
        </div>
      </div>
      <div class="form-row justify-content-center h-100 mb-4">
        <div class="col-lg-10">
          <label class="sr-only" for="pwd2">Confirm Password</label
          ><input
            type="password"
            id="pwd2"
            name="pwd2"
            class="form-control"
            placeholder="Confirm Password"
            aria-describedby="passwordHelpBlock"
            value="${user.pwd2}"
            data-parsley-equalto="#pwd"
          />
        </div>
      </div>
      <div class="form-row justify-content-center h-100 mb-4">
        <div class="col-lg-10">
          <button type="submit" class="btn btn-secondary btn-block">
            Confirm
          </button>
        </div>
      </div>
      <div class="form-row justify-content-center h-100 mb-3">
        <ul class="server-errors-list">
          <c:if test="${user.error[0]}">
            <li>Entered user name is not available</li>
          </c:if>
          <c:if test="${user.error[1]}">
            <li>Entered email has been already registered</li>
          </c:if>
        </ul>
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

  </script>
  <!-- END SCRIPTS -->
</div>
