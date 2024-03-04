// Select user input
const usernameField = document.querySelector('#usernameField');
const feedBackArea = document.querySelector('.invalid_feedback');
const emailField = document.querySelector('#emailField');
const emailFeedBackArea = document.querySelector('.emailFeedBackArea');
const passwordField = document.querySelector('#passwordField');
const usernameSuccessOutput = document.querySelector('.usernameSuccessOutput');
const showPasswordToggle = document.querySelector('.showPasswordToggle');
const submitBtn = document.querySelector('.submit-btn');

// Variables to track if username and email inputs are valid
let isUsernameValid = false;
let isEmailValid = false;

// Function to update submit button status
const updateSubmitButton = () => {
    if (isUsernameValid && isEmailValid) {
        submitBtn.disabled = false;
    } else {
        submitBtn.disabled = true;
    }
};

// Function to toggle password visibility
const handleToggleInput = (e) => {
    if (showPasswordToggle.textContent === 'SHOW') {
        showPasswordToggle.textContent = 'HIDE';
        passwordField.setAttribute('type', 'text');
    } else {
        showPasswordToggle.textContent = 'SHOW';
        passwordField.setAttribute('type', 'password');
    }
};

// Event listener for password toggle
showPasswordToggle.addEventListener("click", handleToggleInput);

// Event listener for email field
emailField.addEventListener("keyup", (e) => {
    const emailVal = e.target.value;

    // Reset validation feedback
    emailField.classList.remove('is-invalid');
    emailFeedBackArea.style.display = "none";

    // Validate email
    if (emailVal.length >= 0) {
        fetch('/authentication/validate-email', {
            body: JSON.stringify({ email: emailVal }),
            method: "POST",
        })
        .then((res) => res.json())
        .then((data) => {
            console.log('data', data)
            // Handle invalid email
            if (data.email_error) {
                isEmailValid = false;
                submitBtn.disabled = true;
                emailField.classList.add('is-invalid');
                emailFeedBackArea.style.display = 'block';
                emailFeedBackArea.innerHTML = `<p>${data.email_error}</p>`;
            } else {
                isEmailValid = true;
                updateSubmitButton();
            }
        });
    }
});

// Event listener for username field
usernameField.addEventListener("keyup", (e) => {
    const usernameVal = e.target.value;

    // Reset validation feedback
    usernameSuccessOutput.style.display = 'block';
    usernameSuccessOutput.textContent = `Checking ${usernameVal}`;
    usernameField.classList.remove('is-invalid');
    feedBackArea.style.display = "none";

    // Validate username
    if (usernameVal.length >= 0) {
        fetch('/authentication/validate-username', {
            body: JSON.stringify({ username: usernameVal }),
            method: "POST",
        })
        .then((res) => res.json())
        .then((data) => {
            usernameSuccessOutput.style.display = 'none';
            // Handle invalid username
            if (data.username_error) {
                isUsernameValid = false;
                submitBtn.disabled = true;
                usernameField.classList.add('is-invalid');
                feedBackArea.style.display = 'block';
                feedBackArea.innerHTML = `<p>${data.username_error}</p>`;
            } else {
                isUsernameValid = true;
                updateSubmitButton();
            }
        });
    }
});
