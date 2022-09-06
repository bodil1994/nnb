import { Controller } from "@hotwired/stimulus"
import { Chart, registerables } from 'chart.js';

export default class extends Controller {
  static values = { health: Number, education: Number, business: Number, insurance: Number, already: Number, still: Number, profit: Object};

  connect() {
    Chart.register(...registerables);
    const labels = [
      'Education',
      'Health',
      'Business',
      'Insurance'
    ];

    const data = {
      labels: labels,
      datasets: [{
        label: 'Your investments in €',
        backgroundColor: 'rgb(136, 46, 252)',
        borderColor: 'rgb(136, 46, 252)',
        data: [this.educationValue, this.healthValue, this.businessValue, this.insuranceValue]
      }]
    };

    const config = {
      type: 'bar',
      data: data,
      options: {}
    };

    const categoryChart = new Chart(
      document.getElementById('categoryChart'),
      config
    );

    const data2 = {
      labels: [
        `Due: ${this.stillValue} €`,
        `Already payed back: ${this.alreadyValue} €`
      ],

      datasets: [{
        label: 'How much of your loan is already payed back?',
        data: [this.stillValue, this.alreadyValue],
        backgroundColor: [
          'rgb(125,123,126)',
          'rgb(136, 46, 252)',
        ],
        hoverOffset: 4
      }]
    };

    const config2 = {
      type: 'doughnut',
      data: data2,
    };

    const paybackChart = new Chart(
      document.getElementById('paybackChart'),
      config2
    );

    const labels3 = [ for (const i in this.profitValue) {
      console.log("hi")

    };
      // function(value) {
      // value.payment_date
      // }
    ];

    const data3 = {
      labels: labels3,
      datasets: [{
        label: 'Your profit in €',
        data: [this.profitValue.forEach(
          function(value) {
          value.profit
          }
        )],
        fill: false,
        borderColor: 'rgb(75, 192, 192)',
        tension: 0.1
      }]
    };

    const config3 = {
      type: 'line',
      data: data3,
    };

    const profitChart = new Chart(
      document.getElementById('profitChart'),
      config3
    );
  }
}
