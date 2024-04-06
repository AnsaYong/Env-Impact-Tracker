// Add event listener to the delete button
document.addEventListener("DOMContentLoaded", function () {
    const deleteButtons = document.getElementsByClassName('delete-btn');
    const deleteUrl = document.getElementById('delete-url').value;
    const csrftoken = getCookie('csrftoken'); // Fetch CSRF token from cookie

    for (let i = 0; i < deleteButtons.length; i++) {
        deleteButtons[i].addEventListener('click', function (event) {
            if (confirm('Are you sure you want to delete this data record?')) {
                const dataId = this.getAttribute('data-id');
                const xhr = new XMLHttpRequest();
                xhr.open("POST", deleteUrl, true);
                xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
                xhr.setRequestHeader("X-CSRFToken", csrftoken);
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        location.reload();
                    }
                };
                xhr.send(JSON.stringify({ id: dataId }));
            }
            event.preventDefault();
        });
    }
});

// Function to fetch CSRF token from cookie
function getCookie(name) {
    let cookieValue = null;
    if (document.cookie && document.cookie !== '') {
        const cookies = document.cookie.split(';');
        for (let i = 0; i < cookies.length; i++) {
            const cookie = cookies[i].trim();
            if (cookie.substring(0, name.length + 1) === (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
}
