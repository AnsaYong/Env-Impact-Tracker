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
};

//################# Get aggregate data from the database #################
const getChartData = async (user_id) => {
    fetch(`/data_collection/analytics_data/${user_id}`)
    .then(response => response.json())
    .then(results => {
        createCharts(results);
    });
};

//################# Call functions when the page loads #################
window.onload = function() {
    getChartData(user_id);
};