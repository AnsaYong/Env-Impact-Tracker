//################### Plot emission data bar chart ###################
function createBarChart(label_set, data_set) {
    const bar1Ctx = document.getElementById('bar1Chart_d').getContext('2d');
    new Chart(bar1Ctx, {
        type: 'bar',
        data: {
            labels: label_set,
            datasets: [{
                label: 'Emission Data',
                data: data_set,
                backgroundColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)',
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)',
                ],
                borderWidth: 1,
            }]
        },
        options: {
            plugins: {
                title: {
                    display: true,
                    text: 'Emission Data',
                    color: 'black',
                    align: 'left',
                    font: {
                        size: 20
                    }
                },
                subtitle: {
                    display: true,
                    text: 'Your Carbon Footprint Breakdown',
                    color: 'blue',
                    font: {
                        size: 15,
                        family: 'tahoma',
                        weight: 'normal',
                        style: 'italic'
                    }
                },
                legend: {
                    display: false
                },
                scales: {
                    x: {
                        title: {
                            display: true,
                            text: 'Carbon emission (t CO2e)',
                            color: 'black',
                            align: 'center',
                            font: {
                                size: 12
                            }
                        }
                    },
                    y: {
                        title: {
                            display: true,
                            text: 'Source of emission',
                            color: 'black',
                            align: 'center',
                            font: {
                                size: 12
                            }
                        }
                    }
                }
            }
        },
    });

    document.getElementById('bar1Chart_d').style.backgroundColor = 'rgba(255, 255, 255, 1)';
}

//################### Plot emission data donot chart ###################
function createDoughnutChart(label_set, data_set) {
    const doughnut1Ctx = document.getElementById('doughnut1Chart_d').getContext('2d');
    new Chart(doughnut1Ctx, {
        type: 'doughnut',
        data: {
            labels: label_set,
            datasets: [{
                label: 'Emission Data',
                data: data_set,
                backgroundColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)',
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)',
                ],
                borderWidth: 1,
            }]
        },
        options: {
            plugins: {
                title: {
                    display: true,
                    text: 'Emission Data',
                    color: 'black',
                    align: 'left',
                    font: {
                        size: 20
                    },
                },
                subtitle: {
                    display: true,
                    text: 'Carbon Footprint Impact Overview',
                    color: 'blue',
                    font: {
                        size: 15,
                        family: 'tahoma',
                        weight: 'normal',
                        style: 'italic'
                    }
                },
                legend: {
                    display: true,
                    position: 'bottom',
                },
            },
        },
    });

    document.getElementById('doughnut1Chart_d').style.backgroundColor = 'rgba(255, 255, 255, 1)';
}

//################# Plot environmental data pie chart #################
function createPieChart(label_set, data_set) {
    const pie1Ctx = document.getElementById('envDataChart_d').getContext('2d');
    new Chart(pie1Ctx, {
        type: 'pie',
        data: {
            labels: label_set,
            datasets: [{
                label: 'Environmental Data',
                data: data_set,
                backgroundColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1,
            }]
        },
        options: {
            plugins: {
                title: {
                    display: true,
                    text: 'Environmental Data',
                    color: 'black',
                    align: 'left',
                    font: {
                        size: 20
                    }
                },
                subtitle: {
                    display: true,
                    text: 'Your Environmental Data Summary',
                    color: 'blue',
                    font: {
                        size: 15,
                        family: 'tahoma',
                        weight: 'normal',
                        style: 'italic'
                    }
                },
                legend: {
                    display: false
                }
            },
        },
    });

    document.getElementById('envDataChart_d').style.backgroundColor = 'rgba(255, 255, 255, 1)';
}

//######################### Plot emission data pie chart #########################
function createPie2Chart(label_set, data_set) {
    const pie2Ctx = document.getElementById('emmDataChart').getContext('2d');
    new Chart(pie2Ctx, {
        type: 'pie',
        data: {
            labels: label_set,
            datasets: [{
                label: 'Carbon Footprint',
                data: data_set,
                backgroundColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1,
            }]
        },
        options: {
            plugins: {
                legend: {
                    display: false,
                    position: 'bottom',
                },
                title: {
                    display: true,
                    text: 'Carbon Footprint',
                    color: 'black',
                    align: 'left',
                    font: {
                        size: 20
                    }
                },
                subtitle: {
                    display: true,
                    text: 'Your Carbon Footprint Snapshot',
                    color: 'blue',
                    font: {
                        size: 15,
                        family: 'tahoma',
                        weight: 'normal',
                        style: 'italic'
                    }
                }
            },
        },
    });

    document.getElementById('emmDataChart').style.backgroundColor = 'rgba(255, 255, 255, 1)';
}

//################# Get environmental data from the database #################
const getChartData = async (env_data_id) => {
    fetch(`http://127.0.0.1:8000/data_collection/user_data/${env_data_id}`)
    .then(response => response.json())
    .then(results => {
        console.log("results", results);

        //Extract the carbon footprint and the labels and data for the pie chart
        const env_data_summary = results['env_data_summary'];
        const env_label = env_data_summary['labels'];
        const env_data = env_data_summary['data'];
        const emm_data_summary = results['carbon_footprint'];
        const emm_label = emm_data_summary['labels'];
        const emm_data = emm_data_summary['data'];

        createPieChart(env_label, env_data);    //Environmental data pie chart
        createPie2Chart(emm_label, emm_data);    //Emmision data pie chart
        createDoughnutChart(emm_label, emm_data);    //Emission data donut chart
        createBarChart(emm_label, emm_data);    //Emission data bar chart


        //Extract the env data summary and the labels and data for the bar chart
    });
};
window.onload = () => getChartData(env_data_id);
//################# End get environmental data from the database #################