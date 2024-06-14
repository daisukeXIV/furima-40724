window.addEventListener('turbo:load',function(){
  if(document.URL.match("/items/new")){
    const price_field = document.getElementById('item-price');
    const tax_field = document.getElementById('add-tax-price');
    const profit_field = document.getElementById('profit');
    const tax_rate = 0.1
    price_field.addEventListener('change',function(){
      let price = price_field.value
      // tax計算処理
      let tax = Math.floor(price * tax_rate)
      tax_field.innerText = tax
      // profit計算処理
      let profit = Math.floor(price - tax)
      profit_field.innerText = profit
    })
  }
})