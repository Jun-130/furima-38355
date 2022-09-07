function count (){
  const itemPrice  = document.getElementById('item-price');
  itemPrice.addEventListener('keyup', () => {
    const tax = 0.1
    const taxPrice = Math.round(itemPrice.value * tax);
    const profitPrice = (itemPrice.value - taxPrice);
    const addTaxPrice  = document.getElementById('add-tax-price');
    const profit = document.getElementById('profit')
    addTaxPrice.innerHTML = `${taxPrice}`;
    profit.innerHTML = `${profitPrice}`;
  });
};
window.addEventListener('load', count);
