import { Controller } from "@hotwired/stimulus"
import { Chart, registerables } from 'chart.js';

export default class extends Controller {
  static values = { health: Number, education: Number, business: Number, insurance: Number, already: Number, still: Number, amount: Number, category: String, profit: Object, loans: Array};
  static targets = ["wrapper"]
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
          'rgb(229,220,255)',
          'rgb(136, 46, 252)',
        ],
        hoverOffset: 4
      }]
    };

    const config2 = {
      type: 'doughnut',
      data: data2,
    };

    // const paybackChart = new Chart(
    //   document.getElementById('paybackChart'),
    //   config2
    // );


    const labels3 = Object.keys(this.profitValue).reverse();
    // labels3.unshift(Object.values(this.profitValue)[0][0].created_at)
    // console.log(Object.values(this.profitValue)[0][0].created_at)
    labels3.unshift("2015-01-01")
    // .strftime("%d-%m-%Y")
    // let date = Object.values(this.profitValue)[0][0].created_at
    // , options = {weekday: 'short', month: 'short', day: 'numeric' };
    // console.logtoDateString((date.toLocaleString('eu-US')));
    let l = 0
    const banana = Object.values(this.profitValue).map((loan) => l += loan[0].profit);
    banana.unshift(0);
    console.log(labels3, banana)
    console.log(Object.values(this.profitValue))

    const data3 = {
      labels: labels3,
      datasets: [{
        label: 'Your profit in €',
        data: banana,
        fill: false,
        borderColor: 'rgb(136, 46, 252)',
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

    console.log("HELLOO")

    this.loansValue.forEach((loan) => {
      const id = Object.keys(loan)[0]
      const values = Object.values(loan)
      console.log(Object.values(loan)[0])
      const already = values[0].already
      const still = values[0].still
      const category = values[0].category
      const amount = values[0].amount
      const data4 = {
        labels: [
          `Due: ${Math.round(still)} €`,
          `Already payed back: ${Math.round(already)} €`
        ],

        datasets: [{
          label: 'How much of your loan is already payed back?',
          data: [still, already],
          backgroundColor: [
            'rgb(229,220,255)',
            'rgb(136, 46, 252)',
          ],
          hoverOffset: 4
        }]
      };

      const config4 = {
        type: 'doughnut',
        data: data4,
      };

      const div = `<div class="swiper-slide">
      <div class="">
        <p class="description">This is your ${category}-Loan over ${amount}€</p>
        <canvas id="chart${id}"></canvas>
      </div>
    </div>`

    this.wrapperTarget.insertAdjacentHTML("beforeend", div)
      const paybackChart2 = new Chart(
        document.getElementById(`chart${id}`),
        config4
      );
    })
  }
}
