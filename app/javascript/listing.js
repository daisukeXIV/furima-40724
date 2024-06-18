window.addEventListener('turbo:load',function(){
  if(document.URL.match("/items/new")){
    tax_calc();
  }
})
// 入力エラー時のrenderで描画された時の処理
window.addEventListener('turbo:render',function(){
  if(document.URL.match("/items/new")){
    tax_calc();
  }
})

function tax_calc(){
  let price_field = document.getElementById('item-price');
  let tax_field = document.getElementById('add-tax-price');
  let profit_field = document.getElementById('profit');
  const tax_rate = 0.1
  price_field.addEventListener('input',function(){
    let price = price_field.value
    // tax計算処理
    let tax = Math.floor(price * tax_rate)
    tax_field.innerText = tax
    // profit計算処理
    let profit = Math.floor(price - tax)
    profit_field.innerText = profit
  })
}