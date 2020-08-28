window.addEventListener('load', function(){
  document.getElementById("item-price").addEventListener('input', function(){
    const itemPrice = document.getElementById("item-price").value;
    const addTaxPrice = Math.round(itemPrice * 0.1);
    const profit = Math.round(itemPrice * 0.9);
    document.getElementById("add-tax-price").innerHTML = addTaxPrice
    document.getElementById("profit").innerHTML = profit
  })
})