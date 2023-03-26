<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Language" content="ch-cn">
        <link rel ="stylesheet" href="css/styles.css">
        <link rel ="stylesheet" href="css/viewrooms.css">

        <!--TITLE-->
        <title>eHotels Home</title>
    </head>

    <script>
        /** REVEALING AREA DROPDOWN:
         * This function toggles the dropdown list's visibility for the hotel area search. */
        function showDropdown() {
            document.getElementById("areaDropdown").classList.toggle("show"); //updating block visibility
        }

        /** SEARCH FILTERING:
         * This function filters the area results when the user types by checking for matching
         * text in each of the city dropdown options. The list display updates as the user types. */
        function filterCities() {
            // VARIABLE DECLARATION: user input & cities result list
            let userInput = document.getElementById("areaSearchInput").value.toUpperCase();
            let resultsList = document.getElementById("areaDropdown").getElementsByTagName("a");

            // PROCESS: looping through cities list
            for (let i = 0; i < resultsList.length; i++) {
                // VARIABLE DECLARATION: each city
                let txtValue = resultsList[i].textContent || resultsList[i].innerText;

                if (txtValue.toUpperCase().indexOf(userInput) > -1) { //found
                    resultsList[i].style.display = ""; //updating display
                }
                else { //not found
                    resultsList[i].style.display = "none"; //updating display
                }
            }
        }
    </script>

    <body>
        <!--HEADING-->
        <h1>Deals from your favourite hotels!</h1>
        <hr style="background-color: rosybrown; height: 1.5px">
        <br>

        <!--AREA SEARCH BAR-->
        <div class="areaSearch">
            <!--SEARCH BUTTON-->
            <button onclick="showDropdown()" class="buttons">HOTEL AREAS</button>

            <!--SEARCH MENU-->
            <div id="areaDropdown" class="dropdown-content">
                <input type="text" placeholder="Search Cities..."
                       id="areaSearchInput" onkeyup="filterCities()">

                <!--CITIES LIST (may need to become buttons to enable SQL querying later)-->
                <a href="#calgaryhotels">Calgary</a>
                <a href="#cancunhotels">Cancun</a>
                <a href="#chihuahuacityhotels">Chihuahua City</a>
                <a href="#columbushotels">Columbus</a>
                <a href="#gatineauhotels">Gatineau</a>
                <a href="#mexicocityhotels">Mexico City</a>
                <a href="#milwaukeehotels">Milwaukee</a>
                <a href="#montrealhotels">Montreal</a>
                <a href="#nychotels">New York City</a>
                <a href="#ottawahotels">Ottawa</a>
                <a href="#tijuanahotels">Tijuana</a>
                <a href="#torontohotels">Toronto</a>
                <a href="#volcanohotels">Volcano</a>
                <a href="#winnipeghotels">Winnipeg</a>
            </div>
        </div>

        <br><br><br>

        <!--BOOKING DATE PICKERS-->
        <div>
            <!--START DATE-->
            <form style="display: inline; padding-right: 20px">
                <label for="checkin" class="labels">Check in:</label>
                <input type="date" id="checkin" name="check in date" style="font-size: 18px">
            </form>

            <!--END DATE-->
            <form action="ACTIONHERE" style="display: inline">
                <label for="checkout" class="labels">Check out:</label>
                <input type="date" id="checkout" name="check out date" style="font-size: 18px">
                <input type="submit" class="buttons" value="SEARCH">
            </form>
        </div>
    </body>

</html>