import { Controller } from "@hotwired/stimulus"
import { Chart, registerables } from 'chart.js';

// Connects to data-controller="info"
export default class extends Controller {
  static values = { still: Number, already: Number };
  connect() {

    console.log("Hello from info js controller")
    Chart.register(...registerables);

    const data = {
      labels: [
        `Due: ${this.stillValue} €`,
        `Already payed back: ${this.alreadyValue} €`
      ],
      datasets: [{
        label: 'My First Dataset',
        data: [this.stillValue, this.alreadyValue],
        backgroundColor: [
          'rgb(229,220,255)',
          'rgb(136, 46, 252)',
        ],
        hoverOffset: 4
      }]
    };

    const config = {
      type: 'doughnut',
      data: data,
    };

    const paymentsChart = new Chart(
      document.getElementById('paymentsChart'),
      config
    );
  }
}
