// Chart for the scatter plot
const scatterCtx = document.getElementById('scatterChart').getContext('2d');
new Chart(scatterCtx, {
    type: 'pie',
    data: {
        labels: ['January', 'February', 'March', 'April', 'May', 'June'],
        datasets: [{
            label: 'Scatter Dataset',
            data: [12, 19, 3, 5, 2, 3],
            borderWidth: 1,
        }]
    },
    options: {
        plugins: {
            title: {
                display: true,
                text: 'Scatter Chart',
                color: 'black', // Change the color of the title text
                align: 'left', // Align the title to the left
                font: {
                    size: 25 // Set the font size
                }
            }
        },
    }
});

// Chart for the summary
const summaryCtx = document.getElementById('summaryChart').getContext('2d');
new Chart(summaryCtx, {
    type: 'bar',
    data: {
        labels: ['Category 1', 'Category 2', 'Category 3', 'Category 4', 'Category 5'],
        datasets: [{
            label: 'Summary Dataset',
            data: [12, 19, 3, 5, 2],
            borderWidth: 1,
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)', // Example color for Category 1
                'rgba(54, 162, 235, 0.2)', // Example color for Category 2
                'rgba(255, 206, 86, 0.2)', // Example color for Category 3
                'rgba(75, 192, 192, 0.2)', // Example color for Category 4
                'rgba(153, 102, 255, 0.2)', // Example color for Category 5
            ],
        }]
    },
    options: {
        plugins: {
            title: {
                display: true,
                text: 'Sexy Chart',
                color: 'black', // Change the color of the title text
                align: 'left', // Align the title to the left
                font: {
                    size: 25 // Set the font size
                }
            }
        },
    },
});
// Set the background color of the canvas elements
document.getElementById('scatterChart').style.backgroundColor = 'rgba(255, 255, 255, 1)';
document.getElementById('summaryChart').style.backgroundColor = 'rgba(255, 255, 255, 1)';
