// Wait for the DOM to load
document.addEventListener("DOMContentLoaded", function () {
    // Select form elements
    const loginForm = document.querySelector("form");
    const usernameInput = document.getElementById("username");
    const passwordInput = document.getElementById("password");
    const rememberCheckbox = document.getElementById("remember");
    const forgotPasswordLink = document.querySelector(".remember-forget a");
    const signUpLink = document.querySelector(".register-link a");

    // Check if username is saved in localStorage
    if (localStorage.getItem("savedUsername")) {
        usernameInput.value = localStorage.getItem("savedUsername");
        rememberCheckbox.checked = true;
    }

    // Handle form submission
    loginForm.addEventListener("submit", function (e) {
        e.preventDefault(); // Prevent the default form submission

        const username = usernameInput.value.trim();
        const password = passwordInput.value.trim();

        // Simple validation
        if (!username || !password) {
            alert("Please fill in both username and password.");
            return;
        }

        // Save username if "Remember Me" is checked
        if (rememberCheckbox.checked) {
            localStorage.setItem("savedUsername", username);
        } else {
            localStorage.removeItem("savedUsername");
        }

        // Simulate login (redirect or show success message)
        alert(`Welcome, ${username}!`);
        window.location.href = loginForm.action; // Redirect to ToDo.html
    });

    // Handle "Forgot Password?" link click
    forgotPasswordLink.addEventListener("click", function (e) {
        e.preventDefault();
        alert("Forgot Password? Redirecting to password recovery...");
        window.location.href = "forgot-password.html"; // Replace with your actual forgot password page
    });

    // Handle "Sign Up" link click
    signUpLink.addEventListener("click", function (e) {
        e.preventDefault();
        alert("Redirecting to sign-up page...");
        window.location.href = "signup.html"; // Replace with your actual sign-up page
    });
});
