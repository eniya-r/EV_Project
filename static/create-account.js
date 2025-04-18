document.addEventListener("DOMContentLoaded", function () {
    const form = document.getElementById("create-account-form");
    const passwordInput = document.getElementById("password");
    const confirmPasswordInput = document.getElementById("confirm-password");
    const passwordError = document.getElementById("password-error");

    form.addEventListener("submit", function (event) {
        let isValid = true;
        passwordError.textContent = ""; // Clear previous errors

        // Validate password match
        if (passwordInput.value !== confirmPasswordInput.value) {
            passwordError.textContent = "Passwords do not match!";
            passwordError.style.color = "red";
            isValid = false;
        }

        // Validate password length
        if (passwordInput.value.length < 6) {
            passwordError.textContent = "Password must be at least 6 characters long!";
            passwordError.style.color = "red";
            isValid = false;
        }

        if (!isValid) {
            event.preventDefault(); // Prevent form submission if validation fails
        }
    });
});
