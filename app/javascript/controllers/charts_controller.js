import { Controller } from "@hotwired/stimulus"
import { Chart, registerables } from 'chart.js';

export default class extends Controller {
  connect() {
    Chart.register(...registerables);
    const labels = [
      'Total',
      'Already payed back',
      'Have to pay back',
    ];

    const data = {
      labels: labels,
      datasets: [{
        label: 'Your Payback-Overview',
        backgroundColor: 'rgb(136, 46, 252)',
        borderColor: 'rgb(136, 46, 252)',
        data: [0, 10, 5, 2, 20, 30, 45],
      }]
    };

    const config = {
      type: 'bar',
      data: data,
      options: {}
    };

    const firstChart = new Chart(
      document.getElementById('firstChart'),
      config
    );
  }

}
