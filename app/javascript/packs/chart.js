import Chart from 'chart.js/auto';
// viewでjsを書く時に必要
// global.Chart = Chart;

var ctx = document.getElementById("myChart").getContext('2d');
var myChart = new Chart(ctx, {
  type: 'pie',
  data: {
    labels: JSON.parse(ctx.canvas.dataset.labels),
    datasets: [
      {
      // label: JSON.parse(ctx.canvas.dataset.label),
      backgroundColor: [
              "#BB5179",
              "#FAFF67",
              "#58A27C",
              "#3C00FF"
          ],
      // borderColor: "rgba(0,0,80,1)",
      data: JSON.parse(ctx.canvas.dataset.data)
      }
    ]
  },
  options: {
    title: {
      display: true,
      text: '血液型 割合'
    },
    scale: {
      ticks: {
        suggestedMin: 0,
            suggestedMax: 100,
        }
    }
  }
});

