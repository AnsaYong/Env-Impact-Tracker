//############################ Function to create the charts ############################
const createCharts = (data) => {
    // Extract data for environment parameters
    const envLabels = Object.keys(data.weekly_env_data);
    const envData = {
        total_energy: envLabels.map(label => data.weekly_env_data[label].total_energy),
        total_waste: envLabels.map(label => data.weekly_env_data[label].total_waste),
        total_technology: envLabels.map(label => data.weekly_env_data[label].total_technology),
        total_distance: envLabels.map(label => data.weekly_env_data[label].total_distance),
    };

    // Extract data for carbon footprint
    const cfLabels = Object.keys(data.weekly_footprint_data);
    const cfData = {
        total_carbon_footprint: cfLabels.map(label => data.weekly_footprint_data[label].total_carbon_footprint),
        energy_footprint: cfLabels.map(label => data.weekly_footprint_data[label].energy_footprint),
        waste_footprint: cfLabels.map(label => data.weekly_footprint_data[label].waste_footprint),
        technology_footprint: cfLabels.map(label => data.weekly_footprint_data[label].technology_footprint),
        transport_footprint: cfLabels.map(label => data.weekly_footprint_data[label].transport_footprint),
        water_footprint: cfLabels.map(label => data.weekly_footprint_data[label].water_footprint),
        consumer_goods_footprint: cfLabels.map(label => data.weekly_footprint_data[label].consumer_goods_footprint),
    };

    // Create environment data histogram
    const envDataChart = new Chart(document.getElementById('envDataChart'), {
        type: 'bar',
        data: {
            labels: envLabels,
            datasets: [
                {
                    label: 'Total Energy',
                    data: envData.total_energy,
                    backgroundColor: 'rgba(255, 99, 132, 1)',
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 1,
                },
                {
                    label: 'Total Waste',
                    data: envData.total_waste,
                    backgroundColor: 'rgba(54, 162, 235, 1)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1,
                },
                {
                    label: 'Total Technology',
                    data: envData.total_technology,
                    backgroundColor: 'rgba(255, 206, 86, 1)',
                    borderColor: 'rgba(255, 206, 86, 1)',
                    borderWidth: 1,
                },
                {
                    label: 'Total Distance',
                    data: envData.total_distance,
                    backgroundColor: 'rgba(75, 192, 192, 1)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1,
                },
            ],
        },
        options: {
            scales: {
                x: {
                    stacked: true,
                },
                y: {
                    stacked: true,
                },
            },
        },
    });

    document.getElementById('envDataChart').style.backgroundColor = 'rgba(255, 255, 255, 1)';

    // Create individual carbon footprint histogram
    const cfCategoryDataChart = new Chart(document.getElementById('cfCategoryDataChart'), {
        type: 'bar',
        data: {
            labels: cfLabels,
            datasets: [
                {
                    label: 'Energy Footprint',
                    data: cfData.energy_footprint,
                    backgroundColor: 'rgba(255, 99, 132, 1)',
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 1,
                },
                {
                    label: 'Waste Footprint',
                    data: cfData.waste_footprint,
                    backgroundColor: 'rgba(54, 162, 235, 1)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1,
                },
                {
                    label: 'Technology Footprint',
                    data: cfData.technology_footprint,
                    backgroundColor: 'rgba(255, 206, 86, 1)',
                    borderColor: 'rgba(255, 206, 86, 1)',
                    borderWidth: 1,
                },
                {
                    label: 'Transport Footprint',
                    data: cfData.transport_footprint,
                    backgroundColor: 'rgba(75, 192, 192, 1)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1,
                },
                {
                    label: 'Water Footprint',
                    data: cfData.water_footprint,
                    backgroundColor: 'rgba(153, 102, 255, 1)',
                    borderColor: 'rgba(153, 102, 255, 1)',
                    borderWidth: 1,
                },
                {
                    label: 'Consumer Goods Footprint',
                    data: cfData.consumer_goods_footprint,
                    backgroundColor: 'rgba(255, 159, 64, 1)',
                    borderColor: 'rgba(255, 159, 64, 1)',
                    borderWidth: 1,
                },
            ],
        },
        options: {
            scales: {
                x: {
                    stacked: true,
                },
                y: {
                    stacked: true,
                },
            },
        },
    });

    document.getElementById('cfCategoryDataChart').style.backgroundColor = 'rgba(255, 255, 255, 1)';

    // Create carbon footprint line chart
    const cfDataChart = new Chart(document.getElementById('cfDataChart'), {
        type: 'line',
        data: {
            labels: cfLabels,
            datasets: [
                {
                    label: 'Total Carbon Footprint',
                    data: cfData.total_carbon_footprint,
                    fill: false,
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1,
                },
            ],
        },
    });

    document.getElementById('cfDataChart').style.backgroundColor = 'rgba(255, 255, 255, 1)';

    // Create radar chart for carbon footprint categories distribution
    const cfDistributionChart = new Chart(document.getElementById('cfDistributionChart'), {
        type: 'radar',
        data: {
            labels: ['Energy', 'Transport', 'Consumer Goods', 'Waste', 'Water', 'Technology'],
            datasets: [
                {
                    label: 'Total Carbon Footprint',
                    data: [
                        cfData.energy_footprint[cfData.energy_footprint.length - 1],
                        cfData.transport_footprint[cfData.transport_footprint.length - 1],
                        cfData.consumer_goods_footprint[cfData.consumer_goods_footprint.length - 1],
                        cfData.waste_footprint[cfData.waste_footprint.length - 1],
                        cfData.water_footprint[cfData.water_footprint.length - 1],
                        cfData.technology_footprint[cfData.technology_footprint.length - 1],
                    ],
                },
            ],
        },
        options: {
            scale: {
                pointLabels: { fontSize: 14 },
            },
            responsive: true,
            maintainASpectRatio: false,
        },
    });

    document.getElementById('cfDistributionChart').style.backgroundColor = 'rgba(255, 255, 255, 1)';
};

//################# Function to create the table of highest impact components #################
function createTable(data) {
    const tableBody = document.querySelector('#highestImpactTable tbody');
    data.forEach(([item, amount]) => {
        const row = document.createElement('tr');
        const itemCell = document.createElement('td');
        itemCell.textContent = item;
        const amountCell = document.createElement('td');
        amountCell.textContent = amount.toFixed(1) + ' kg CO2e';
        row.appendChild(itemCell);

        amountCell.style.paddingLeft = '200px';

        row.appendChild(amountCell);
        tableBody.appendChild(row);
    });
}

console.log("user_data", user_id);

//################# Get aggregate data from the database #################
const getChartData = async (user_id) => {
    fetch(`/data_collection/analytics_data/${user_id}`)
    .then(response => response.json())
    .then(results => {
        console.log("results", results);

        const highest_contributors = results.highest_contributors;
        createTable(highest_contributors);

        createCharts(results);

    });
};

//################# Function to update user information #################
function getUserLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
            var latitude = position.coords.latitude;
            var longitude = position.coords.longitude;
            // You can use the latitude and longitude to get the user's location
            // For simplicity, we'll just return a string representing the location
            return `Latitude: ${latitude}, Longitude: ${longitude}`;
        });
    } else {
        return "Location information is not available.";
    }
}

function updateUserInfo() {
    const userLocation = getUserLocation();
    const currentTime = new Date().toLocaleTimeString();
    const currentDate = new Date().toLocaleDateString();

    document.getElementById('userInformation').innerHTML = `
        <p>Location: ${userLocation}</p>
        <p>Time: ${currentTime}</p>
        <p>Date: ${currentDate}</p>
    `;
}
//################# Call functions when the page loads #################
window.onload = function() {
    getChartData(user_id);
    updateUserInfo();
};