<!--SCRIPT CODE-->
/** REGISTRATION VALIDATION:
 * This function checks for null input in all the registration forms and checks
 * if the inputted passwords match. It validates every form, based on database constraints.
 * It returns a boolean for this check. */
function validateRegistration() {
    // VARIABLE DECLARATION: login vars
    let fName = document.getElementById("fname");
    let lName = document.getElementById("lname");
    let email = document.getElementById("email");
    let phoneNum = document.getElementById("phone_num");
    let street = document.getElementById("street_address");
    let city = document.getElementById("city");
    let province = document.getElementById("province_state");
    let country = document.getElementById("country");
    let sin = document.getElementById("sin");
    let ccNum = document.getElementById("cc_num");

    // PROCESS: checking for null registration forms
    if (fName.value === "" || lName.value === "" || email.value === ""
        || phoneNum.value === "" || street.value === ""
        || sin.value === "" || ccNum.value === "") { //has null
        alert("Please fill out all forms!"); //error-handling

        // OUTPUT
        return false;
    } else { //all filled
        // PROCESS: validating first name
        if (!/^[a-zA-Z]/.test(fName.value) || fName.value.length > 25) { //invalid chars or length
            alert("Please enter a valid first name (25 characters max)!") //error-handling

            // OUTPUT
            return false;
        }

        // PROCESS: validating last name
        if (!/^[a-zA-Z]/.test(lName.value) || lName.value.length > 25) { //invalid chars or length
            alert("Please enter a valid last name (25 characters max)!") //error-handling

            // OUTPUT
            return false;
        }

        // PROCESS: validating email
        if (!/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/.test(email.value)) { //invalid chars
            alert("Please enter a valid email address!") //error-handling

            // OUTPUT
            return false;
        }

        // PROCESS: validating phone number
        if (isNaN(phoneNum.value) || phoneNum.value.length !== 10) { //contains invalid chars
            alert("Please enter a valid phone number (10 digits)!") //error-handling

            // OUTPUT
            return false;
        }

        // PROCESS: validating address
        if (street.value.length > 50) { //too long
            alert("Please enter a valid street address (50 characters max)!") //error-handling

            // OUTPUT
            return false;
        }
        if (city.options[city.selectedIndex].value === "default") { //invalid selection
            alert("Please select a city!") //error-handling

            // OUTPUT
            return false;
        }
        if (province.options[province.selectedIndex].value === "default") { //invalid selection
            alert("Please select a province!") //error-handling

            // OUTPUT
            return false;
        }
        if (country.options[country.selectedIndex].value === "default") { //invalid selection
            alert("Please select a country!") //error-handling

            // OUTPUT
            return false;
        }

        // PROCESS: validating SIN
        if (isNaN(sin.value) || sin.value.length !== 9) { //invalid chars or length
            alert("Please enter a valid SIN (9 digits)!") //error-handling

            // OUTPUT
            return false;
        }

        // PROCESS: validating credit card
        if (isNaN(ccNum.value) || ccNum.value.length !== 16) { //invalid chars or length
            alert("Please enter a valid credit card number (16 digits)!") //error-handling

            // OUTPUT
            return false;
        }

        // OUTPUT
        return true;
    }
}

/** LOGIN VALIDATION:
 * This function checks for null input in the username and password forms of the login.
 * It returns a boolean for this check. */
function validateLogin() {
    // VARIABLE DECLARATION: login vars
    let username = document.getElementById("uid");
    let password = document.getElementById("upwd");

    // PROCESS: checking for null logins
    if (username.value === "") { //null username
        alert("Customer email cannot be null!"); //error-handling

        // OUTPUT
        return false;
    } else if (password.value === "") { //null password
        alert("Password cannot be null!"); //error-handling

        // OUTPUT
        return false;
    } else { //non-null login
        if (isNaN(password.value) || (password.value.length !== 9)) {
            alert("Invalid SIN number (9 digits)!"); //error-handling
            return false;
        }
        // OUTPUT
        return true; // passed all checks
    }
}

/** SHOW SIGN-UP/LOGIN:
 * This function determines whether to show the sign-up or login forms, given the
 * isLogin boolean parameter. Then, it updates the site's display accordingly. */
function showForms(isLogin) {
    // VARIABLE DECLARATION: form vars
    let loginForms = document.getElementById("loginForms");
    let signUpForms = document.getElementById("signUpForms");

    // PROCESS: checking which forms to show
    if (isLogin === true) { //show login
        if (loginForms.style.display === "none") { //currently hidden
            loginForms.style.display = "block"; //updating display to visible
        }

        if (signUpForms.style.display === "block") { //currently displayed
            signUpForms.style.display = "none"; //hiding forms
            signUpForms.reset(); //clearing forms
        }
    } else { //show registration
        if (signUpForms.style.display === "none") { //currently hidden
            signUpForms.style.display = "block"; //updating display to visible
        }

        if (loginForms.style.display === "block") { //currently displayed
            loginForms.style.display = "none"; //hiding forms
            loginForms.reset(); //clearing forms
        }
    }
}