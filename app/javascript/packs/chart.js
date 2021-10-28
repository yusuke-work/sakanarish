import Chart from 'chart.js/auto';
// viewでjsを書く時に必要
// global.Chart = Chart;

// viewから渡しているdata属性は配列でないとjsonをパースできません
// jsにおけるJSON.parse() メソッドは文字列を JSON として解析して構築します｡
var ctx = document.getElementById("myChart").getContext('2d');
var myChart = new Chart(ctx, {
  type: 'radar',
  data: {
    labels: JSON.parse(ctx.canvas.dataset.labels),
    datasets:
      [
        {
          label: JSON.parse(ctx.canvas.dataset.label),
          backgroundColor: 'rgba(102,255,129,0.2)',
          borderColor: 'rgba(122,255,129,0.2)',
          data: JSON.parse(ctx.canvas.dataset.data)
        }
      ]
  },
  options: {
    scales: {
      r: {
        // suggestedMin: 0,
        // suggestedMax: 1
        min: 0,
        max: 5
      }
    }
  }
});
