<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" session="true" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
  <head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  </head>
  <title>EPAW Template</title>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
  <link
    rel="stylesheet"
    href="https://www.w3schools.com/lib/w3-theme-red.css"
  />
  <link
    rel="stylesheet"
    href="https://fonts.googleapis.com/css?family=Open+Sans"
  />
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
  />
  <style>
    html,
    body,
    h1,
    h2,
    h3,
    h4,
    h5 {
      font-family: 'Open Sans', sans-serif;
    }
  </style>

  <script type="text/javascript">
    $('#navigation').load('MenuController')
  </script>

  <script>
    var start = 0
    var nt = 4
    var cview = 'GetTweetsFromFollows'
    var uid = '${user.uid}'

    $(document).ready(function () {
      $('#duser').load('GetUserInfo', { uid: uid }, function () {})
      $('#dtweets').load(
        'GetTweetsFromFollows',
        { uid: uid, start: start, end: start + nt },
        function () {
          start = nt
          cview = 'GetTweetsFromFollows'
        }
      )

      /* Infinite scrolling */
      $(window).scroll(function (event) {
        event.preventDefault()
        if (
          Math.ceil($(window).scrollTop()) ==
          $(document).outerHeight() - $(window).outerHeight()
        ) {
          $.post(cview, { uid: uid, start: start, end: start + nt }, function (
            data
          ) {
            $('#dtweets').append(data)
            start = start + nt
          })
        }
      })

      // *******************************************************************************************//
      // Elements $("#id").click(...)  caputure clicks of elements that have been statically loaded //
      // *******************************************************************************************//

      /* Get and visualize user follows*/
      $('.vF').click(function (event) {
        event.preventDefault()
        $('#dtweets').load(
          'GetFollows',
          { uid: uid, start: 0, end: nt },
          function (data) {
            start = nt
            cview = 'GetFollows'
          }
        )
      })
      /* Get and visualize Tweets from a given user */
      $('.vT').click(function (event) {
        event.preventDefault()
        $('#dtweets').load(
          'GetTweetsFromUser',
          { uid: uid, start: 0, end: nt },
          function (data) {
            start = nt
            cview = 'GetTweetsFromUser'
          }
        )
      })
      /* Add tweet and reload Tweet Visualitzation */
      $('#aT').click(function (event) {
        event.preventDefault()
        $.post(
          'AddTweetFromUser',
          { uid: uid, content: $('#cT').text() },
          function (data) {
            $('#dtweets').load(
              'GetTweetsFromUser',
              { uid: uid, start: 0, end: nt },
              function () {
                start = nt
                cview = 'GetTweetsFromUser'
              }
            )
          }
        )
      })

      // ***************************************************************************************************//
      // Elements $("body").on("click","...)  caputure clicks of elements that have been dinamically loaded //
      // ***************************************************************************************************//

      /* Delete tweet from user */
      $('body').on('click', '.dT', function (event) {
        event.preventDefault()
        var tweet = $(this).parent()
        $.post(
          'DelTweetFromUser',
          { tid: $(this).parent().attr('id') },
          function (data) {
            tweet.remove()
            start = start - 1
          }
        )
      })
    })
  </script>

  <body class="w3-theme-l5">
    <!-- Navbar -->
    <div class="w3-top">
      <div class="w3-bar w3-theme-d2 w3-left-align w3-large">
        <a
          class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2"
          href="javascript:void(0);"
          onclick="openNav()"
          ><i class="fa fa-bars"></i
        ></a>
        <a href="#" class="w3-bar-item w3-button w3-padding-large w3-theme-d4"
          ><i class="fa fa-home w3-margin-right"></i> EPAW
        </a>
        <a
          href="#"
          class="vF w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"
          title="Friends"
          ><i class="fa fa-users"></i
        ></a>
        <a
          href="#"
          class="vT w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white"
          title="My Account"
        >
          <img
            src="avatar/user-3.png"
            class="w3-circle"
            style="height: 23px; width: 23px;"
            alt="Avatar"
          />
        </a>
      </div>
    </div>

    <!-- Navbar on small screens -->
    <div
      id="navDemo"
      class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium w3-large"
    >
      <a href="#" class="w3-bar-item w3-button w3-padding-large">Item1</a>
      <a class="vF w3-bar-item w3-button w3-padding-large">Friends</a>
      <a class="vT w3-bar-item w3-button w3-padding-large">My Profile</a>
    </div>

    <!-- Page Container -->
    <div
      class="w3-container w3-content"
      style="max-width: 1400; margin-top: 80px;"
    >
      <!-- The Grid -->
      <div class="w3-row">
        <!-- Left Column -->
        <div class="w3-col m3">
          <!-- Profile -->
          <div id="duser"></div>

          <!-- End Left Column -->
        </div>

        <!-- Middle Column -->
        <div class="w3-col m9">
          <div class="w3-row-padding">
            <div class="w3-col m12">
              <div class="w3-card w3-round w3-white">
                <div class="w3-container w3-padding">
                  <h6 class="w3-opacity">EPAW template by UPF</h6>
                  <p
                    id="cT"
                    contenteditable="true"
                    class="w3-border w3-padding"
                  >
                    Status: Feeling EPAW
                  </p>
                  <button id="aT" type="button" class="w3-button w3-theme">
                    <i class="fa fa-pencil"></i> &nbsp;Post
                  </button>
                </div>
              </div>
            </div>
          </div>

          <div id="dtweets"></div>

          <!-- End Middle Column -->
        </div>

        <!-- End Grid -->
      </div>

      <!-- End Page Container -->
    </div>
    <br />

    <!-- Footer -->
    <footer class="w3-container w3-theme-d3 w3-padding-16">
      <h5>Avís legal</h5>
    </footer>

    <footer class="w3-container w3-theme-d5">
      <p>
        Powered by
        <a href="https://www.w3schools.com/w3css/default.asp" target="_blank"
          >w3.css</a
        >
      </p>
    </footer>

    <script>
      // Accordion
      function myFunction(id) {
        var x = document.getElementById(id)
        if (x.className.indexOf('w3-show') == -1) {
          x.className += ' w3-show'
          x.previousElementSibling.className += ' w3-theme-d1'
        } else {
          x.className = x.className.replace('w3-show', '')
          x.previousElementSibling.className = x.previousElementSibling.className.replace(
            ' w3-theme-d1',
            ''
          )
        }
      }

      // Used to toggle the menu on smaller screens when clicking on the menu button
      function openNav() {
        var x = document.getElementById('navDemo')
        if (x.className.indexOf('w3-show') == -1) {
          x.className += ' w3-show'
        } else {
          x.className = x.className.replace(' w3-show', '')
        }
      }
    </script>
  </body>
</html>
